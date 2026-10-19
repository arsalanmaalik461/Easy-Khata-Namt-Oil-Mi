import 'dart:convert';

import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/theme.dart';
import '../../core/message_templates.dart';
import '../../core/phone.dart';
import '../../data/db.dart';
import '../../data/party_actions.dart';
import '../providers.dart';
import '../widgets/ek.dart';
import '../widgets/ui.dart';
import 'party_form_screen.dart';
import 'sale_form_screen.dart';
import 'txn_form_screen.dart';

/// EasyKhata-style customer/supplier detail:
/// balance hero, Tareekh/SMS/WhatsApp row, DIYE/LIYE ledger,
/// sticky "Mainey Diye / Mainey Liye" buttons.
class PartyDetailScreen extends ConsumerStatefulWidget {
  final String kind; // customer | supplier
  final String partyId;
  const PartyDetailScreen(
      {super.key, required this.kind, required this.partyId});

  @override
  ConsumerState<PartyDetailScreen> createState() =>
      _PartyDetailScreenState();
}

class _PartyDetailScreenState
    extends ConsumerState<PartyDetailScreen> {
  String _q = '';

  bool get _isCust => widget.kind == 'customer';

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    final db = ref.watch(databaseProvider);
    final partyStream = _isCust
        ? (db.select(db.customers)
              ..where((t) => t.id.equals(widget.partyId)))
            .watchSingle()
        : (db.select(db.suppliers)
              ..where((t) => t.id.equals(widget.partyId)))
            .watchSingle();
    return Scaffold(
      body: StreamBuilder(
        stream: partyStream,
        builder: (c, snap) {
          if (!snap.hasData) {
            return const Scaffold(
                body: Center(
                    child: CircularProgressIndicator()));
          }
          final p = snap.data as dynamic;
          return _body(
              context,
              l,
              name: p.name as String,
              balance: p.balance as int,
              phone: p.phone as String,
              whatsapp: (p as dynamic).whatsapp as String? ?? '',
              createdAt: p.createdAt as int,
              isFav: _isCust
                  ? (p.isFavorite as bool? ?? false)
                  : false);
        },
      ),
      bottomNavigationBar: _dualButtons(l),
    );
  }

  Widget _body(BuildContext context, l,
      {required String name,
      required int balance,
      required String phone,
      required String whatsapp,
      required int createdAt,
      required bool isFav}) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final owesUs = balance > 0;
    return SafeArea(
      child: Column(
        children: [
          _appBar(l, name, createdAt, isFav),
          Expanded(
            child: ListView(
              padding:
                  const EdgeInsets.fromLTRB(16, 4, 16, 16),
              children: [
                _balanceHero(l, dark, balance, owesUs),
                const SizedBox(height: 16),
                _actionRow(l, name, balance, phone,
                    whatsapp),
                const SizedBox(height: 16),
                _searchRow(l, dark),
                const SizedBox(height: 8),
                _ledgerTable(l),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar(l, String name, int createdAt, bool isFav) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        children: [
          IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800)),
                Text(
                    '${l.customerSince} ${fmtDate(context, createdAt)}',
                    style: TextStyle(
                        fontSize: 12,
                        color: dark
                            ? AppColors.mutedDark
                            : AppColors.muted)),
              ],
            ),
          ),
          if (_isCust)
            IconButton(
              icon: Icon(
                  isFav
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: isFav ? AppColors.diye : null),
              tooltip: l.favorite,
              onPressed: _toggleFavorite,
            ),
          PopupMenuButton<String>(
            onSelected: (v) {
              if (v == 'edit') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PartyFormScreen(
                            kind: widget.kind,
                            partyId: widget.partyId)));
              }
            },
            itemBuilder: (c) => [
              PopupMenuItem(
                  value: 'edit', child: Text(l.edit)),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _toggleFavorite() async {
    if (!_isCust) return;
    final db = ref.read(databaseProvider);
    final cur = await (db.select(db.customers)
          ..where((t) => t.id.equals(widget.partyId)))
        .getSingle();
    await (db.update(db.customers)
          ..where((t) => t.id.equals(widget.partyId)))
        .write(CustomersCompanion(
            isFavorite: Value(!cur.isFavorite)));
  }

  Widget _balanceHero(l, bool dark, int balance, bool owesUs) {
    final clear = balance == 0;
    final strong = clear
        ? (dark ? AppColors.mutedDark : AppColors.muted)
        : (dark ? AppColors.diyeDark : AppColors.diye);
    final tint = clear
        ? (dark ? AppColors.cardDark : AppColors.bg)
        : (dark
            ? AppColors.diyeLightDark
            : AppColors.diyeLight);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: tint,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                color: strong, shape: BoxShape.circle),
            child: Icon(
                clear
                    ? Icons.check
                    : Icons.arrow_downward,
                color: Colors.white,
                size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                    clear
                        ? fmtMoney(context, 0)
                        : '${fmtMoney(context, balance.abs())}',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: strong,
                        fontFeatures: const [
                          FontFeature.tabularFigures()
                        ])),
                const SizedBox(height: 2),
                Text(
                    clear
                        ? l.hisaabClearHai
                        : (_isCust
                            ? (owesUs
                                ? l.leneHain
                                : l.deneHain)
                            : (owesUs
                                ? l.deneHain
                                : l.leneHain)),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: strong)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionRow(l, String name, int balance,
      String phone, String whatsapp) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionRowButton(
          icon: Icons.calendar_today_outlined,
          label: l.tareekhRakhein,
          iconColor:
              Theme.of(context).brightness ==
                      Brightness.dark
                  ? AppColors.mutedDark
                  : AppColors.muted,
          onTap: () => _setReminder(l, name),
        ),
        ActionRowButton(
          icon: Icons.sms,
          label: l.sms,
          iconColor: AppColors.smsBlue,
          onTap: () =>
              _sendReminder(l, name, balance, phone, true),
        ),
        ActionRowButton(
          icon: Icons.chat_bubble,
          label: l.whatsapp,
          iconColor: AppColors.whatsapp,
          onTap: () => _sendReminder(
              l, name, balance, whatsapp.isNotEmpty ? whatsapp : phone, false),
        ),
      ],
    );
  }

  Widget _searchRow(l, bool dark) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: l.search,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor:
                  dark ? AppColors.cardDark : AppColors.card,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 10),
            ),
            onChanged: (v) =>
                setState(() => _q = v.trim().toLowerCase()),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: dark ? AppColors.cardDark : AppColors.card,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
              icon: const Icon(Icons.sort),
              onPressed: () {}),
        ),
        const SizedBox(width: 8),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: dark ? AppColors.cardDark : AppColors.card,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
              icon: const Icon(
                  Icons.picture_as_pdf_outlined),
              onPressed: () => _sharePdf(l)),
        ),
      ],
    );
  }

  Widget _ledgerTable(l) {
    final svc = ref.watch(reportsProvider);
    return FutureBuilder(
      future: Future.wait([
        svc.partyLedger(widget.kind, widget.partyId, 0,
            DateTime.now().millisecondsSinceEpoch),
        _imageMap(),
      ]),
      builder: (c, snap) {
        if (!snap.hasData) {
          return const Center(
              child: Padding(
                  padding: EdgeInsets.all(24),
                  child: CircularProgressIndicator()));
        }
        final rows = snap.data![0] as List;
        final imgMap = snap.data![1] as Map<String, List<String>>;
        if (rows.isEmpty) {
          return EmptyState(title: l.noTransactionsYet);
        }
        final filtered = _q.isEmpty
            ? rows
            : rows
                .where((e) => (e.description as String)
                    .toLowerCase()
                    .contains(_q))
                .toList();
        return LedgerTable(
          timeHeader: l.time.toUpperCase(),
          diyeHeader: l.diye.toUpperCase(),
          liyeHeader: l.liye.toUpperCase(),
          rows: filtered.reversed.map((e) {
            final debit = e.debitMinor as int;
            final credit = e.creditMinor as int;
            final isDiye = debit > 0;
            return LedgerRowData(
              timeLabel:
                  fmtDateTime(context, e.date as int),
              balanceLabel:
                  'Bal: ${fmtMoney(context, e.balanceAfterMinor as int)}',
              description: e.description as String,
              amountLabel: fmtMoney(
                  context, isDiye ? debit : credit),
              isDiye: isDiye,
              imagePaths:
                  imgMap[e.txnId as String] ?? const [],
            );
          }).toList(),
        );
      },
    );
  }

  /// txnId -> bill image paths (one query for all visible rows).
  Future<Map<String, List<String>>> _imageMap() async {
    final db = ref.read(databaseProvider);
    final svc = ref.read(reportsProvider);
    final rows = await svc.partyLedger(widget.kind, widget.partyId,
        0, DateTime.now().millisecondsSinceEpoch);
    final ids = rows.map((e) => e.txnId).toSet().toList();
    if (ids.isEmpty) return {};
    final txns = await (db.select(db.transactions)
          ..where((t) => t.id.isIn(ids)))
        .get();
    final out = <String, List<String>>{};
    for (final t in txns) {
      try {
        final list =
            (jsonDecode(t.imagePaths) as List).cast<String>();
        if (list.isNotEmpty) out[t.id] = list;
      } catch (_) {}
    }
    return out;
  }

  Widget _dualButtons(l) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final diyeC = dark ? AppColors.diyeDark : AppColors.diye;
    final liyeC = dark ? AppColors.liyeDark : AppColors.liye;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 56,
                child: FilledButton.icon(
                  onPressed: () => _goDiye(),
                  icon: const Icon(Icons.arrow_upward,
                      size: 22),
                  label: Text(l.maineyDiye,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                  style: FilledButton.styleFrom(
                    backgroundColor: diyeC,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(14)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 56,
                child: FilledButton.icon(
                  onPressed: () => _goLiye(),
                  icon: const Icon(Icons.arrow_downward,
                      size: 22),
                  label: Text(l.maineyLiye,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                  style: FilledButton.styleFrom(
                    backgroundColor: liyeC,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(14)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goDiye() {
    if (_isCust) {
      _go(TxnFormScreen(
          mode: TxnMode.udhaar,
          presetPartyId: widget.partyId,
          presetKind: 'customer'));
    } else {
      _go(TxnFormScreen(
          mode: TxnMode.pay,
          presetPartyId: widget.partyId,
          presetKind: 'supplier'));
    }
  }

  void _goLiye() {
    if (_isCust) {
      _go(TxnFormScreen(
          mode: TxnMode.receive,
          presetPartyId: widget.partyId,
          presetKind: 'customer'));
    } else {
      // Supplier "liye" = new purchase on credit.
      _go(const SaleFormScreen(mode: DocMode.purchase));
    }
  }

  void _go(Widget s) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => s));

  // ---------------- actions ----------------

  Future<void> _setReminder(l, String name) async {
    final picked = await showDatePicker(
      context: context,
      initialDate:
          DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked == null || !mounted) return;
    final noteC = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (d) => AlertDialog(
        title: Text(l.tareekhRakhein),
        content: TextField(
            controller: noteC,
            decoration: InputDecoration(
                labelText: l.notes,
                hintText: name)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(d, false),
              child: Text(l.cancel)),
          FilledButton(
              onPressed: () => Navigator.pop(d, true),
              child: Text(l.save)),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    try {
      await ref.read(accountingProvider).addCustomerReminder(
            customerId: widget.partyId,
            remindAt: DateTime(
                picked.year, picked.month, picked.day, 9),
            note: noteC.text.trim(),
          );
      if (mounted) showSnack(context, l.reminderSaved);
    } catch (e) {
      if (mounted) showSnack(context, '$e', error: true);
    }
  }

  /// Template picker (new scope #3): choose Urdu/English message,
  /// preview, then send via SMS or WhatsApp.
  Future<String?> _pickTemplate(
      l, String name, int balance) async {
    final isUr =
        Localizations.localeOf(context).languageCode != 'en';
    final templates = [
      (l.templateUrdu, isUr ? kReminderTemplateUr : kReminderTemplateEn),
      (l.templateEnglish, isUr ? kReminderTemplateEn : kReminderTemplateUr),
    ];
    var idx = 0;
    final business = ref
            .read(settingsProvider)
            .valueOrNull
            ?.businessName ??
        l.appName;
    final chosen = await showModalBottomSheet<int>(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(20))),
      builder: (c) => StatefulBuilder(
        builder: (c, setS) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(l.chooseTemplate,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                ...templates.asMap().entries.map((e) =>
                    RadioListTile<int>(
                      value: e.key,
                      groupValue: idx,
                      title: Text(e.value.$1),
                      onChanged: (v) =>
                          setS(() => idx = v!),
                    )),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    buildReminderMessage(
                      template: templates[idx].$2,
                      customerName: name,
                      amount: formatAmountShort(
                          balance.abs()),
                      businessName: business,
                    ),
                    style:
                        const TextStyle(fontSize: 13),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () =>
                        Navigator.pop(c, idx),
                    child: Text(l.useTemplate),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    if (chosen == null) return null;
    return buildReminderMessage(
      template: templates[chosen].$2,
      customerName: name,
      amount: formatAmountShort(balance.abs()),
      businessName: business,
    );
  }

  Future<void> _sendReminder(l, String name, int balance,
      String rawPhone, bool viaSms) async {
    final msg =
        await _pickTemplate(l, name, balance);
    if (msg == null || !mounted) return;
    final digits = normalizePkPhone(rawPhone);
    if (digits.isEmpty) {
      if (mounted) {
        showSnack(context, l.noWhatsappNumber, error: true);
      }
      return;
    }
    try {
      final uri = viaSms
          ? Uri.parse(
              'sms:$digits?body=${Uri.encodeComponent(msg)}')
          : Uri.parse(
              'https://wa.me/$digits?text=${Uri.encodeComponent(msg)}');
      final ok = await launchUrl(uri,
          mode: LaunchMode.externalApplication);
      if (!ok && mounted) {
        showSnack(context, l.errorGeneric, error: true);
      }
    } catch (e) {
      if (mounted) showSnack(context, '$e', error: true);
    }
  }

  Future<void> _sharePdf(l) async {
    // Statement PDF via the system share sheet (WhatsApp appears there).
    final db = ref.read(databaseProvider);
    final isUr =
        Localizations.localeOf(context).languageCode != 'en';
    final business =
        ref.read(settingsProvider).valueOrNull?.businessName ??
            l.appName;
    try {
      final name = await _partyName();
      final bal = await _partyBalance();
      final res = await PartyActions(db).shareStatementPdf(
        customerId: widget.partyId,
        customerName: name,
        balanceMinor: bal,
        businessName: business,
        urdu: isUr,
      );
      if (!mounted) return;
      if (!res.isOk) showSnack(context, res.error, error: true);
    } catch (e) {
      if (mounted) showSnack(context, '$e', error: true);
    }
  }

  Future<String> _partyName() async {
    final db = ref.read(databaseProvider);
    if (_isCust) {
      final p = await (db.select(db.customers)
            ..where((t) => t.id.equals(widget.partyId)))
          .getSingle();
      return p.name;
    }
    final p = await (db.select(db.suppliers)
          ..where((t) => t.id.equals(widget.partyId)))
        .getSingle();
    return p.name;
  }

  Future<int> _partyBalance() async {
    final db = ref.read(databaseProvider);
    if (_isCust) {
      final p = await (db.select(db.customers)
            ..where((t) => t.id.equals(widget.partyId)))
          .getSingle();
      return p.balance;
    }
    final p = await (db.select(db.suppliers)
          ..where((t) => t.id.equals(widget.partyId)))
        .getSingle();
    return p.balance;
  }
}

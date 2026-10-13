import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../app/theme.dart';
import '../providers.dart';
import '../widgets/ui.dart';
import 'party_form_screen.dart';
import 'txn_form_screen.dart';

/// Customer/supplier detail: balance hero, quick actions, full ledger.
class PartyDetailScreen extends ConsumerStatefulWidget {
  final String kind; // customer | supplier
  final String partyId;
  const PartyDetailScreen(
      {super.key, required this.kind, required this.partyId});

  @override
  ConsumerState<PartyDetailScreen> createState() =>
      _PartyDetailScreenState();
}

class _PartyDetailScreenState extends ConsumerState<PartyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final l = L(context);
    final isCust = widget.kind == 'customer';
    final db = ref.watch(databaseProvider);
    final partyFuture = isCust
        ? (db.select(db.customers)
              ..where((t) => t.id.equals(widget.partyId)))
            .watchSingle()
        : (db.select(db.suppliers)
              ..where((t) => t.id.equals(widget.partyId)))
            .watchSingle();
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => PartyFormScreen(
                        kind: widget.kind,
                        partyId: widget.partyId)))),
      ]),
      body: StreamBuilder(
        stream: partyFuture,
        builder: (c, snap) {
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final p = snap.data!;
          final name = (p as dynamic).name as String;
          final balance = (p as dynamic).balance as int;
          final phone = (p as dynamic).phone as String;
          return _body(context, l, ref, name, balance, phone, isCust);
        },
      ),
    );
  }

  Widget _body(BuildContext context, l, WidgetRef ref, String name,
      int balance, String phone, bool isCust) {
    final owesUs = balance > 0;
    final label = isCust
        ? (owesUs ? l.youWillReceive : l.youWillPay)
        : (owesUs ? l.youWillPay : l.youWillReceive);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          color: AppColors.navy,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800)),
                if (phone.isNotEmpty)
                  Text(phone,
                      style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 12),
                Text(label,
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 12)),
                Text(fmtMoney(context, balance.abs()),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w800)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(spacing: 8, runSpacing: 8, children: [
          if (isCust) ...[
            FilledButton.tonalIcon(
                onPressed: () => _go(const TxnFormScreen(
                    mode: TxnMode.udhaar,
                    presetPartyId: null,
                    presetKind: 'customer')),
                icon: const Icon(Icons.handshake_outlined),
                label: Text(l.giveUdhaar)),
            FilledButton.tonalIcon(
                onPressed: () => _go(const TxnFormScreen(
                    mode: TxnMode.receive, presetKind: 'customer')),
                icon: const Icon(Icons.payments_outlined),
                label: Text(l.receivePayment)),
          ] else ...[
            FilledButton.tonalIcon(
                onPressed: () => _go(const TxnFormScreen(
                    mode: TxnMode.pay, presetKind: 'supplier')),
                icon: const Icon(Icons.payments_outlined),
                label: Text(l.makePayment)),
          ],
          OutlinedButton.icon(
              onPressed: _shareStatement,
              icon: const Icon(Icons.share_outlined),
              label: Text(l.share)),
          if (phone.isNotEmpty)
            OutlinedButton.icon(
                onPressed: _whatsappReminder,
                icon: const Icon(Icons.message_outlined),
                label: Text(l.sendReminder)),
        ]),
        const SizedBox(height: 12),
        SectionCard(title: l.customerLedger, child: _ledgerList()),
      ],
    );
  }

  void _go(Widget s) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => s));

  Widget _ledgerList() {
    final l = L(context);
    final svc = ref.watch(reportsProvider);
    return FutureBuilder(
      future: svc.partyLedger(
          widget.kind, widget.partyId, 0, DateTime.now().millisecondsSinceEpoch),
      builder: (c, snap) {
        if (!snap.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final rows = snap.data!;
        if (rows.isEmpty) {
          return EmptyState(title: l.noTransactionsYet);
        }
        return Column(
          children: rows.reversed.take(50).map((e) {
            final net = e.debitMinor - e.creditMinor;
            return ListTile(
              dense: true,
              title: Text(e.description.isEmpty ? '—' : e.description),
              subtitle: Text(fmtDate(context, e.date)),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MoneyText(net, style: const TextStyle(fontSize: 13)),
                  Text(fmtMoney(context, e.balanceAfterMinor),
                      style: const TextStyle(
                          fontSize: 11, color: AppColors.textMuted)),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Future<void> _shareStatement() async {
    final l = L(context);
    final svc = ref.read(reportsProvider);
    final rows = await svc.partyLedger(widget.kind, widget.partyId, 0,
        DateTime.now().millisecondsSinceEpoch);
    final buf = StringBuffer('${l.appName}\n$l.customerLedger\n\n');
    for (final e in rows) {
      buf.writeln(
          '${fmtDate(context, e.date)} | ${e.description} | ${fmtMoney(context, e.debitMinor - e.creditMinor)} | ${fmtMoney(context, e.balanceAfterMinor)}');
    }
    await Share.share(buf.toString(), subject: l.customerLedger);
  }

  Future<void> _whatsappReminder() async {
    // wa.me deep link via share sheet (works offline for composing).
    final l = L(context);
    final msg =
        '${l.reminderMessage}: ${l.outstandingBalance} — ${l.appName}';
    await Share.share(msg);
  }
}

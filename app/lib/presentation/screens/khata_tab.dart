import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../providers.dart';
import '../widgets/ek.dart';
import '../widgets/ui.dart';
import 'party_detail_screen.dart';
import 'party_form_screen.dart';

enum _SortField { name, date, amount }

/// EasyKhata-style Khata tab: balance heroes, search + sort + PDF row,
/// customer/supplier lists, sticky "+ Add customer" CTA.
class KhataTab extends ConsumerStatefulWidget {
  const KhataTab({super.key});
  @override
  ConsumerState<KhataTab> createState() => _KhataTabState();
}

class _KhataTabState extends ConsumerState<KhataTab>
    with SingleTickerProviderStateMixin {
  late final TabController _tab;
  String _q = '';
  _SortField _sortField = _SortField.name;
  bool _sortAsc = true;
  bool _hideBalances = false;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
    _tab.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    final dark = Theme.of(context).brightness == Brightness.dark;
    final settings = ref.watch(settingsProvider).valueOrNull;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                            (settings?.businessName ??
                                    l.appName)
                                .toUpperCase(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.2,
                                color: dark
                                    ? AppColors.inkDark
                                    : AppColors.ink)),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Text(l.totalBalance.toUpperCase(),
                                style:
                                    ekLabelStyle(context)),
                            const SizedBox(width: 6),
                            InkWell(
                              onTap: () => setState(() =>
                                  _hideBalances =
                                      !_hideBalances),
                              child: Icon(
                                  _hideBalances
                                      ? Icons
                                          .visibility_off_outlined
                                      : Icons
                                          .visibility_outlined,
                                  size: 16,
                                  color: dark
                                      ? AppColors.mutedDark
                                      : AppColors.muted),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: _balanceHeroes(l),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: _searchField(l, dark)),
                  const SizedBox(width: 8),
                  _iconBtn(Icons.sort, () => _openSort(l),
                      dark),
                  const SizedBox(width: 8),
                  _iconBtn(Icons.picture_as_pdf_outlined,
                      () => _exportPdf(l), dark),
                ],
              ),
            ),
            const SizedBox(height: 8),
            TabBar(controller: _tab, tabs: [
              Tab(text: l.customers),
              Tab(text: l.suppliers),
            ]),
            Expanded(
              child: TabBarView(
                  controller: _tab,
                  children: [
                    _partyList('customer'),
                    _partyList('supplier'),
                  ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: BigCtaButton(
          label: _tab.index == 0
              ? l.addCustomer
              : l.addSupplier,
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => PartyFormScreen(
                      kind: _tab.index == 0
                          ? 'customer'
                          : 'supplier'))),
        ),
      ),
    );
  }

  Widget _balanceHeroes(l) {
    final dash = ref.watch(dashboardProvider);
    return dash.when(
      loading: () => const SizedBox(height: 96),
      error: (_, __) => const SizedBox.shrink(),
      data: (d) {
        final hide = _hideBalances;
        return Row(
          children: [
            Expanded(
              child: HeroBalanceCard(
                amount: hide
                    ? '••••'
                    : fmtMoney(context, d.receivables.minor),
                label: l.leneHain,
                isRed: true,
                icon: Icons.arrow_downward,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: HeroBalanceCard(
                amount: hide
                    ? '••••'
                    : fmtMoney(context, d.payables.minor),
                label: l.deneHain,
                isRed: false,
                icon: Icons.arrow_upward,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _searchField(l, bool dark) {
    return TextField(
      decoration: InputDecoration(
        hintText: l.searchCustomers,
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: dark ? AppColors.cardDark : AppColors.card,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 12),
      ),
      onChanged: (v) => setState(() => _q = v.trim()),
    );
  }

  Widget _iconBtn(
      IconData icon, VoidCallback onTap, bool dark) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: dark ? AppColors.cardDark : AppColors.card,
        borderRadius: BorderRadius.circular(14),
      ),
      child: IconButton(icon: Icon(icon), onPressed: onTap),
    );
  }

  Future<void> _openSort(l) async {
    final r = await showSortSheet(context,
        title: l.sortBy,
        fields: [
          ('name', l.sortName),
          ('date', l.sortDate),
          ('amount', l.sortAmount),
        ],
        currentField: _sortField.name,
        currentAsc: _sortAsc,
        ascLabel: l.sortAsc,
        descLabel: l.sortDesc);
    if (r != null && mounted) {
      setState(() {
        _sortField = _SortField.values
            .firstWhere((e) => e.name == r.$1);
        _sortAsc = r.$2;
      });
    }
  }

  void _exportPdf(l) {
    // Team B wires the full customer-list PDF (B10); placeholder for now.
    showSnack(context, l.comingSoon);
  }

  Widget _partyList(String kind) {
    final l = L(context);
    final async = kind == 'customer'
        ? ref.watch(customersProvider(_q))
        : ref.watch(suppliersProvider(_q));
    return async.when(
      loading: () =>
          const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text(l.errorGeneric)),
      data: (list) {
        if (list.isEmpty) {
          return EmptyState(
            title: kind == 'customer'
                ? l.noCustomers
                : l.noSuppliers,
            hint: kind == 'customer'
                ? l.addCustomerHint
                : null,
            icon: Icons.people_outline,
          );
        }
        return FutureBuilder<Map<String, int>>(
          future: _lastTxnDates(kind, list),
          builder: (c, snap) {
            final dates = snap.data ?? {};
            // Normalize to records so Customer/Supplier unify.
            final recs = list.map((p) {
              final d = p as dynamic;
              return (
                id: d.id as String,
                name: d.name as String,
                phone: d.phone as String,
                balance: d.balance as int,
                fav: (d.isFavorite as bool?) ?? false,
              );
            }).toList();
            recs.sort((a, b) {
              int cmp;
              switch (_sortField) {
                case _SortField.name:
                  cmp = a.name.compareTo(b.name);
                  break;
                case _SortField.amount:
                  cmp = a.balance.compareTo(b.balance);
                  break;
                case _SortField.date:
                  cmp = (dates[a.id] ?? 0)
                      .compareTo(dates[b.id] ?? 0);
                  break;
              }
              return _sortAsc ? cmp : -cmp;
            });
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(
                  16, 8, 16, 16),
              itemCount: recs.length,
              itemBuilder: (c, i) {
                final r = recs[i];
                return _partyRow(
                    l,
                    kind,
                    r.id,
                    r.name,
                    r.phone,
                    r.balance,
                    dates[r.id] ?? 0,
                    r.fav);
              },
            );
          },
        );
      },
    );
  }

  Future<Map<String, int>> _lastTxnDates(
      String kind, List<dynamic> list) async {
    final svc = ref.read(reportsProvider);
    final out = <String, int>{};
    for (final p in list) {
      final d = p as dynamic;
      out[d.id as String] =
          await svc.lastPartyTxnDate(kind, d.id as String);
    }
    return out;
  }

  Widget _partyRow(l, String kind, String id, String name,
      String phone, int bal, int lastTxnMs, bool fav) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final red = dark ? AppColors.diyeDark : AppColors.diye;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: dark ? AppColors.cardDark : AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 4),
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: dark
                  ? AppColors.bgDark
                  : AppColors.bg,
              child: Text(
                  name.isEmpty ? '?' : name[0].toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: dark
                          ? AppColors.inkDark
                          : AppColors.ink)),
            ),
            if (fav)
              const Positioned(
                right: 0,
                bottom: 0,
                child: Icon(Icons.favorite,
                    size: 14, color: AppColors.diye),
              ),
          ],
        ),
        title: Text(name,
            style:
                const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: lastTxnMs > 0
            ? Text(
                '${l.lastTransactedOn} ${fmtDate(context, lastTxnMs)}',
                style: TextStyle(
                    fontSize: 12,
                    color: dark
                        ? AppColors.mutedDark
                        : AppColors.muted))
            : (phone.isEmpty
                ? null
                : Text(phone,
                    style: TextStyle(
                        fontSize: 12,
                        color: dark
                            ? AppColors.mutedDark
                            : AppColors.muted))),
        trailing: _hideBalances
            ? null
            : Text(
                bal == 0
                    ? fmtMoney(context, 0)
                    : '- ${fmtMoney(context, bal.abs())}',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: bal == 0
                        ? (dark
                            ? AppColors.mutedDark
                            : AppColors.muted)
                        : red,
                    fontFeatures: const [
                      FontFeature.tabularFigures()
                    ])),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PartyDetailScreen(
                    kind: kind, partyId: id))),
      ),
    );
  }
}

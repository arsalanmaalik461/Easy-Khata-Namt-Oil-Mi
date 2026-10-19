import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../data/reports.dart' show SalesSummary;
import '../providers.dart';
import '../widgets/ek.dart';
import '../widgets/ui.dart';
import 'products_screen.dart';
import 'sale_form_screen.dart';

enum _Range { hafta, maheena, custom }

/// EasyKhata-style Sales dashboard:
/// Hafta/Maheena/Apni-marzi tabs, 4 stat cards, items card,
/// search, recent sales, "+ Sale darj karein" CTA.
class SalesDashboardScreen extends ConsumerStatefulWidget {
  const SalesDashboardScreen({super.key});
  @override
  ConsumerState<SalesDashboardScreen> createState() =>
      _SalesDashboardScreenState();
}

class _SalesDashboardScreenState
    extends ConsumerState<SalesDashboardScreen> {
  _Range _range = _Range.maheena;
  String _q = '';
  late int _fromMs;
  late int _toMs;

  @override
  void initState() {
    super.initState();
    _applyPreset(_Range.maheena);
  }

  void _applyPreset(_Range r) {
    final now = DateTime.now();
    switch (r) {
      case _Range.hafta:
        final from = DateTime(now.year, now.month, now.day)
            .subtract(const Duration(days: 6));
        _fromMs = from.millisecondsSinceEpoch;
        _toMs = DateTime(
                now.year, now.month, now.day, 23, 59, 59)
            .millisecondsSinceEpoch;
        break;
      case _Range.maheena:
        _fromMs =
            DateTime(now.year, now.month, 1).millisecondsSinceEpoch;
        _toMs = DateTime(
                now.year, now.month + 1, 0, 23, 59, 59)
            .millisecondsSinceEpoch;
        break;
      case _Range.custom:
        break; // keep current custom values
    }
    _range = r;
  }

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    final dark = Theme.of(context).brightness == Brightness.dark;
    final settings = ref.watch(settingsProvider).valueOrNull;
    final summaryAsync =
        ref.watch(_salesSummaryProvider((_fromMs, _toMs)));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async =>
                    ref.invalidate(_salesSummaryProvider),
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(l.salesDashboard,
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight:
                                          FontWeight.w800,
                                      color: dark
                                          ? AppColors.inkDark
                                          : AppColors.ink)),
                              const SizedBox(height: 2),
                              Text(
                                  settings?.businessName ??
                                      l.appName,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: dark
                                          ? AppColors.mutedDark
                                          : AppColors.muted)),
                            ],
                          ),
                        ),
                        _rangeChips(l, dark),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (_range == _Range.custom)
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 12),
                        child: DateRangeField(
                          fromMs: _fromMs,
                          toMs: _toMs,
                          fromLabel: l.from,
                          toLabel: l.to,
                          onChanged: (r) => setState(() {
                            _fromMs = r.$1;
                            _toMs = r.$2;
                          }),
                        ),
                      ),
                    summaryAsync.when(
                      loading: () => const Center(
                          child: Padding(
                              padding:
                                  EdgeInsets.all(32),
                              child:
                                  CircularProgressIndicator())),
                      error: (e, _) =>
                          Center(child: Text(l.errorGeneric)),
                      data: (s) => _statsGrid(l, s),
                    ),
                    const SizedBox(height: 12),
                    _itemsCard(l, dark),
                    const SizedBox(height: 12),
                    _searchRow(l, dark),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l.haaliSales.toUpperCase(),
                            style: ekLabelStyle(context)),
                        summaryAsync.maybeWhen(
                          data: (s) => Text(
                              '${s.recentInvoices.length} ${l.results}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: dark
                                      ? AppColors.mutedDark
                                      : AppColors.muted)),
                          orElse: () => const SizedBox.shrink(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    summaryAsync.when(
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                      data: (s) => _recentList(l, dark, s),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  16, 8, 16, 16),
              child: BigCtaButton(
                label: l.saleDarjKarein,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            const SaleFormScreen(
                                mode: DocMode.sale))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rangeChips(l, bool dark) {
    chip(_Range r, String label) {
      final sel = _range == r;
      return InkWell(
        onTap: () => setState(() => _applyPreset(r)),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: sel
                ? (dark
                    ? AppColors.cardDark
                    : AppColors.card)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: sel
                ? [
                    BoxShadow(
                        color: Colors.black
                            .withValues(alpha: 0.06),
                        blurRadius: 4)
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (r == _Range.custom)
                const Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(
                      Icons.calendar_today_outlined,
                      size: 14),
                ),
              Text(label,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: sel
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: sel
                          ? (dark
                              ? AppColors.inkDark
                              : AppColors.ink)
                          : (dark
                              ? AppColors.mutedDark
                              : AppColors.muted))),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: dark
            ? AppColors.cardDark.withValues(alpha: 0.6)
            : const Color(0xFFEFF2F5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          chip(_Range.hafta, l.hafta),
          chip(_Range.maheena, l.maheena),
          chip(_Range.custom, l.apniMarzi),
        ],
      ),
    );
  }

  Widget _statsGrid(l, summary) {
    final sub = _range == _Range.hafta
        ? l.thisWeek
        : _range == _Range.maheena
            ? l.thisMonth
            : l.custom;
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.35,
      children: [
        StatCard(
            label: l.kullSales,
            value: fmtMoney(context, summary.total.minor),
            subtitle: '— $sub'),
        StatCard(
            label: l.kullOrders,
            value: '${summary.orders}',
            subtitle: '— $sub'),
        StatCard(
            label: l.kullNaqad,
            value: fmtMoney(context, summary.naqad.minor),
            subtitle: '— $sub',
            valueColor: AppColors.liye),
        StatCard(
            label: l.kullUdhaar,
            value: fmtMoney(context, summary.udhaar.minor),
            subtitle: '— $sub',
            valueColor: AppColors.diye),
      ],
    );
  }

  Widget _itemsCard(l, bool dark) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const ProductsScreen())),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: dark ? AppColors.cardDark : AppColors.card,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: dark
                    ? AppColors.bgDark
                    : AppColors.bg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                  Icons.grid_view_outlined,
                  size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(l.itemsManageKarein,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 2),
                  Text(l.itemsManageHint,
                      style: TextStyle(
                          fontSize: 13,
                          color: dark
                              ? AppColors.mutedDark
                              : AppColors.muted)),
                ],
              ),
            ),
            Icon(Icons.chevron_right,
                color:
                    dark ? AppColors.mutedDark : AppColors.muted),
          ],
        ),
      ),
    );
  }

  Widget _searchRow(l, bool dark) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: l.searchSales,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor:
                  dark ? AppColors.cardDark : AppColors.card,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 12),
            ),
            onChanged: (v) =>
                setState(() => _q = v.trim().toLowerCase()),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: dark ? AppColors.cardDark : AppColors.card,
            borderRadius: BorderRadius.circular(14),
          ),
          child: IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _recentList(l, bool dark, summary) {
    var invs = summary.recentInvoices;
    if (_q.isNotEmpty) {
      invs = invs
          .where((i) =>
              i.invoiceNo.toLowerCase().contains(_q) ||
              i.totalMinor.toString().contains(_q))
          .toList();
    }
    if (invs.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Text(l.noSalesYet,
            textAlign: TextAlign.center,
            style: TextStyle(
                color:
                    dark ? AppColors.mutedDark : AppColors.muted)),
      );
    }
    return Column(
      children: invs.map((i) {
        final paid = i.paidMinor >= i.totalMinor;
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: dark ? AppColors.cardDark : AppColors.card,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(i.invoiceNo,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700)),
                    const SizedBox(height: 2),
                    Text(fmtDate(context, i.date),
                        style: TextStyle(
                            fontSize: 12,
                            color: dark
                                ? AppColors.mutedDark
                                : AppColors.muted)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(fmtMoney(context, i.totalMinor),
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: paid
                              ? AppColors.liye
                              : AppColors.diye,
                          fontFeatures: const [
                            FontFeature.tabularFigures()
                          ])),
                  Text(
                      paid
                          ? l.statusPaid
                          : '${l.remainingAmount}: ${fmtMoney(context, i.totalMinor - i.paidMinor)}',
                      style: TextStyle(
                          fontSize: 11,
                          color: dark
                              ? AppColors.mutedDark
                              : AppColors.muted)),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

final _salesSummaryProvider =
    FutureProvider.family<SalesSummary, (int, int)>((ref, r) async {
  return ref.watch(reportsProvider).salesSummary(r.$1, r.$2);
});

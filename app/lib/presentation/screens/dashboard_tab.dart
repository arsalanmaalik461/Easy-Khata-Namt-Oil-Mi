import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../core/money.dart';
import '../providers.dart';
import '../widgets/ui.dart';
import 'party_detail_screen.dart';
import 'party_form_screen.dart';
import 'production_screen.dart';
import 'reports_tab.dart';
import 'sale_form_screen.dart';
import 'txn_form_screen.dart';

class DashboardTab extends ConsumerWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L(context);
    final dash = ref.watch(dashboardProvider);
    final settings = ref.watch(settingsProvider).valueOrNull;
    return Scaffold(
      appBar: AppBar(title: Text(settings?.businessName ?? l.appName)),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(dashboardProvider),
        child: dash.when(
          loading: () =>
              const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('${l.errorGeneric}\n$e')),
          data: (d) => ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _balanceHero(context, l, d),
              const SizedBox(height: 12),
              _quickActions(context, l, ref),
              const SizedBox(height: 12),
              _todayRow(context, l, d),
              const SizedBox(height: 12),
              _alerts(context, l, ref, d),
              const SizedBox(height: 12),
              _recent(context, l, d),
            ],
          ),
        ),
      ),
    );
  }

  Widget _balanceHero(BuildContext c, l, d) {
    return Card(
      color: AppColors.emerald,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: _heroItem(c, l.totalReceivables,
                        d.receivables, Icons.arrow_downward)),
                Container(
                    width: 1,
                    height: 56,
                    color: Colors.white24),
                Expanded(
                    child: _heroItem(c, l.totalPayables, d.payables,
                        Icons.arrow_upward)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _heroItem(BuildContext c, String label, Money m, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 12)),
        const SizedBox(height: 2),
        Text(fmtMoney(c, m.minor),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800)),
      ],
    );
  }

  Widget _quickActions(BuildContext c, l, WidgetRef ref) {
    void go(Widget s) =>
        Navigator.push(c, MaterialPageRoute(builder: (_) => s));
    return SectionCard(
      title: l.quickActions,
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          QuickAction(
              icon: Icons.person_add_outlined,
              label: l.addCustomer,
              onTap: () => go(const PartyFormScreen(kind: 'customer'))),
          QuickAction(
              icon: Icons.handshake_outlined,
              label: l.giveUdhaar,
              color: AppColors.navy,
              onTap: () => go(const TxnFormScreen(mode: TxnMode.udhaar))),
          QuickAction(
              icon: Icons.payments_outlined,
              label: l.receivePayment,
              color: AppColors.success,
              onTap: () =>
                  go(const TxnFormScreen(mode: TxnMode.receive))),
          QuickAction(
              icon: Icons.point_of_sale_outlined,
              label: l.newSale,
              color: AppColors.gold,
              onTap: () => go(const SaleFormScreen(mode: DocMode.sale))),
          QuickAction(
              icon: Icons.shopping_cart_outlined,
              label: l.newPurchase,
              color: AppColors.navy,
              onTap: () =>
                  go(const SaleFormScreen(mode: DocMode.purchase))),
          QuickAction(
              icon: Icons.money_off_outlined,
              label: l.addExpense,
              color: AppColors.danger,
              onTap: () => go(const TxnFormScreen(mode: TxnMode.expense))),
          QuickAction(
              icon: Icons.factory_outlined,
              label: l.production,
              color: AppColors.emeraldDark,
              onTap: () => go(const ProductionHubPlaceholder())),
          QuickAction(
              icon: Icons.bar_chart_outlined,
              label: l.navReports,
              onTap: () => go(const ReportsPlaceholder())),
        ],
      ),
    );
  }

  Widget _todayRow(BuildContext c, l, d) {
    return SectionCard(
      title: l.today,
      child: Column(
        children: [
          _kv(c, l.todaySales, d.todaySales.minor, AppColors.success),
          _kv(c, l.todayPurchases, d.todayPurchases.minor, null),
          _kv(c, l.receivedToday, d.todayReceived.minor,
              AppColors.success),
          _kv(c, l.paidToday, d.todayPaid.minor, null),
          _kv(c, l.cashBalance, d.cashBalance.minor, null),
          if (d.bankBalance.minor != 0)
            _kv(c, l.bankBalance, d.bankBalance.minor, null),
        ],
      ),
    );
  }

  Widget _kv(BuildContext c, String k, int minor, Color? color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(k)),
          MoneyText(minor, colored: color != null),
        ],
      ),
    );
  }

  Widget _alerts(BuildContext c, l, WidgetRef ref, d) {
    final items = <Widget>[];
    if (d.lowStockCount > 0) {
      items.add(ListTile(
        leading:
            const Icon(Icons.warning_amber_outlined, color: AppColors.warn),
        title: Text(l.lowStockAlerts),
        trailing: Text('${d.lowStockCount}',
            style: const TextStyle(fontWeight: FontWeight.w800)),
        onTap: () {},
      ));
    }
    if (d.outstandingSaleInvoices > 0) {
      items.add(ListTile(
        leading: const Icon(Icons.pending_actions_outlined,
            color: AppColors.navy),
        title: Text(l.outstandingInvoices),
        trailing: Text('${d.outstandingSaleInvoices}',
            style: const TextStyle(fontWeight: FontWeight.w800)),
      ));
    }
    if (items.isEmpty) return const SizedBox.shrink();
    return SectionCard(
        title: l.reminders, child: Column(children: items));
  }

  Widget _recent(BuildContext c, l, d) {
    final txns = d.recentTransactions;
    if (txns.isEmpty) {
      return EmptyState(
          title: l.noTransactionsYet, hint: l.addFirstTransaction);
    }
    return SectionCard(
      title: l.recentTransactions,
      child: Column(
        children: txns
            .take(6)
            .map((t) => ListTile(
                  dense: true,
                  title: Text(t.description.isEmpty
                      ? t.txnNumber
                      : t.description),
                  subtitle: Text(fmtDate(c, t.date)),
                  trailing: MoneyText(t.amountMinor),
                ))
            .toList(),
      ),
    );
  }
}

// Placeholders replaced by real screens below in this batch.
class ProductionHubPlaceholder extends StatelessWidget {
  const ProductionHubPlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const ProductionScreen();
}

class ReportsPlaceholder extends StatelessWidget {
  const ReportsPlaceholder({super.key});
  @override
  Widget build(BuildContext context) => const ReportsTab();
}

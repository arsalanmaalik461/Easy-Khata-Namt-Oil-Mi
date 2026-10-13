import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../widgets/ui.dart';
import 'report_view_screen.dart';

class ReportsTab extends ConsumerWidget {
  const ReportsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L(context);
    final items = <(String, IconData, String)>[
      (l.reportDailySummary, Icons.today_outlined, 'daily'),
      (l.reportMonthlySummary, Icons.calendar_month_outlined, 'monthly'),
      (l.reportProfitLoss, Icons.trending_up_outlined, 'pnl'),
      (l.reportSales, Icons.point_of_sale_outlined, 'sales'),
      (l.reportPurchases, Icons.shopping_cart_outlined, 'purchases'),
      (l.reportPaymentsReceived, Icons.payments_outlined, 'pay_in'),
      (l.reportPaymentsMade, Icons.payments_outlined, 'pay_out'),
      (l.reportExpenses, Icons.money_off_outlined, 'expenses'),
      (l.reportIncome, Icons.attach_money_outlined, 'income'),
      (l.reportReceivables, Icons.arrow_downward_outlined, 'receivables'),
      (l.reportPayables, Icons.arrow_upward_outlined, 'payables'),
      (l.reportCashbook, Icons.book_outlined, 'cashbook'),
      (l.reportBalances, Icons.account_balance_outlined, 'balances'),
      (l.reportInventoryValuation, Icons.inventory_2_outlined, 'valuation'),
      (l.reportLowStock, Icons.warning_amber_outlined, 'lowstock'),
      (l.reportProduction, Icons.factory_outlined, 'production'),
      (l.reportCustomerLedger, Icons.person_outlined, 'cust_ledger'),
      (l.reportSupplierLedger, Icons.person_outline, 'sup_ledger'),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(l.navReports)),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (c, i) {
          final it = items[i];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              leading: Icon(it.$2,
                  color: Theme.of(context).colorScheme.primary),
              title: Text(it.$1),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          ReportViewScreen(kind: it.$3, title: it.$1))),
            ),
          );
        },
      ),
    );
  }
}

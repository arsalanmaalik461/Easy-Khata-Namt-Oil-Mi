import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../widgets/ui.dart';
import 'backup_screen.dart';
import 'cashbook_screen.dart';
import 'products_screen.dart';
import 'production_screen.dart';
import 'reports_tab.dart';
import 'settings_screen.dart';
import 'transactions_tab.dart';

/// Account tab: everything that isn't Khata or Sales.
/// (Products, production, transactions, reports, cashbook, backup, settings.)
class AccountTab extends ConsumerWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L(context);
    final dark = Theme.of(context).brightness == Brightness.dark;
    final items = <(String, IconData, Widget)>[
      (l.products, Icons.inventory_2_outlined, const ProductsScreen()),
      (l.production, Icons.factory_outlined, const ProductionScreen()),
      (l.navTransactions, Icons.receipt_long_outlined,
          const TransactionsTab()),
      (l.navReports, Icons.bar_chart_outlined, const ReportsTab()),
      (l.cashbook, Icons.book_outlined, const CashbookScreen()),
      (l.backup, Icons.backup_outlined, const BackupScreen()),
      (l.settings, Icons.settings_outlined, const SettingsScreen()),
      (l.about, Icons.info_outline, const AboutScreen()),
    ];
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(l.navAccount,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: dark
                        ? AppColors.inkDark
                        : AppColors.ink)),
            const SizedBox(height: 4),
            Text(l.appName,
                style: TextStyle(
                    fontSize: 14,
                    color: dark
                        ? AppColors.mutedDark
                        : AppColors.muted)),
            const SizedBox(height: 16),
            ...items.map((it) => Container(
                  margin:
                      const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: dark
                        ? AppColors.cardDark
                        : AppColors.card,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: Icon(it.$2,
                        color: dark
                            ? AppColors.inkDark
                            : AppColors.ink),
                    title: Text(it.$1,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600)),
                    trailing: Icon(
                        Icons.chevron_right,
                        color: dark
                            ? AppColors.mutedDark
                            : AppColors.muted),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => it.$3)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final l = L(context);
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: Text(l.about)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.oil_barrel_outlined,
                size: 64,
                color: dark
                    ? AppColors.inkDark
                    : AppColors.ink),
            const SizedBox(height: 16),
            Text(l.appName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall),
            Text(l.tagline),
            const SizedBox(height: 8),
            Text('${l.version} 1.0.0+1'),
            const SizedBox(height: 16),
            Text(l.noInternetNeeded),
          ],
        ),
      ),
    );
  }
}

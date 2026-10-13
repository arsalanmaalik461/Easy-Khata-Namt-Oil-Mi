import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/ui.dart';
import 'backup_screen.dart';
import 'cashbook_screen.dart';
import 'products_screen.dart';
import 'production_screen.dart';
import 'settings_screen.dart';

class MoreTab extends ConsumerWidget {
  const MoreTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L(context);
    final items = <(String, IconData, Widget)>[
      (l.products, Icons.inventory_2_outlined, const ProductsScreen()),
      (l.production, Icons.factory_outlined, const ProductionScreen()),
      (l.cashbook, Icons.book_outlined, const CashbookScreen()),
      (l.backup, Icons.backup_outlined, const BackupScreen()),
      (l.settings, Icons.settings_outlined, const SettingsScreen()),
      (l.about, Icons.info_outline, const AboutScreen()),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(l.navMore)),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (c, i) => Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            leading: Icon(items[i].$2,
                color: Theme.of(context).colorScheme.primary),
            title: Text(items[i].$1),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => items[i].$3)),
          ),
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
    return Scaffold(
      appBar: AppBar(title: Text(l.about)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.oil_barrel_outlined,
                size: 64, color: Color(0xFF0E6B4D)),
            const SizedBox(height: 16),
            Text(l.appName,
                style: Theme.of(context).textTheme.headlineSmall),
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

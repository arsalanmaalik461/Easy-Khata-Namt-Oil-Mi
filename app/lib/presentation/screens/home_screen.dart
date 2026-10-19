import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/ui.dart';
import 'account_tab.dart';
import 'khata_tab.dart';
import 'sales_dashboard_screen.dart';

/// EasyKhata-style 3-tab navigation: Khata / Sales / Account.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    final tabs = [
      const KhataTab(),
      const SalesDashboardScreen(),
      const AccountTab(),
    ];
    return Scaffold(
      body: IndexedStack(index: _index, children: tabs),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.book_outlined),
              selectedIcon: const Icon(Icons.book),
              label: l.navKhata),
          NavigationDestination(
              icon: const Icon(Icons.bar_chart_outlined),
              selectedIcon: const Icon(Icons.bar_chart),
              label: l.navSales),
          NavigationDestination(
              icon: const Icon(Icons.person_outlined),
              selectedIcon: const Icon(Icons.person),
              label: l.navAccount),
        ],
      ),
    );
  }
}

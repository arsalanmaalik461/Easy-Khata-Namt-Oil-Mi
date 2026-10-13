import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/money.dart';
import '../providers.dart';
import '../widgets/ui.dart';
import 'party_detail_screen.dart';
import 'party_form_screen.dart';

class KhataTab extends ConsumerStatefulWidget {
  const KhataTab({super.key});
  @override
  ConsumerState<KhataTab> createState() => _KhataTabState();
}

class _KhataTabState extends ConsumerState<KhataTab>
    with SingleTickerProviderStateMixin {
  late final TabController _tab;
  String _q = '';

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.navKhata),
        bottom: TabBar(controller: _tab, tabs: [
          Tab(text: l.customers),
          Tab(text: l.suppliers),
        ]),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: l.search,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (v) => setState(() => _q = v.trim()),
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tab, children: [
              _partyList('customer', _q),
              _partyList('supplier', _q),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PartyFormScreen(
                    kind: _tab.index == 0 ? 'customer' : 'supplier'))),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _partyList(String kind, String q) {
    final l = L(context);
    if (kind == 'customer') {
      final async = ref.watch(customersProvider(q));
      return _buildList(async, l, kind);
    } else {
      final async = ref.watch(suppliersProvider(q));
      return _buildList(async, l, kind);
    }
  }

  Widget _buildList(
      AsyncValue<List<dynamic>> async, dynamic l, String kind) {
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text(l.errorGeneric)),
      data: (list) {
        if (list.isEmpty) {
          return EmptyState(
            title: kind == 'customer' ? l.noCustomers : l.noSuppliers,
            hint: kind == 'customer' ? l.addCustomerHint : null,
            icon: Icons.people_outline,
            actionLabel:
                kind == 'customer' ? l.addCustomer : l.addSupplier,
            onAction: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => PartyFormScreen(kind: kind))),
          );
        }
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (c, i) {
            final p = list[i];
            final name = p.name as String;
            final bal = p.balance as int;
            final phone = p.phone as String;
            final id = p.id as String;
            return Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: ListTile(
                leading: CircleAvatar(
                    child: Text(name.isEmpty ? '?' : name[0])),
                title: Text(name),
                subtitle: phone.isEmpty ? null : Text(phone),
                trailing: MoneyText(bal),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PartyDetailScreen(
                            kind: kind, partyId: id))),
              ),
            );
          },
        );
      },
    );
  }
}

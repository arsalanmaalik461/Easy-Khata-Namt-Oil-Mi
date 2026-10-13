import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/db.dart' show AppDatabase, Transaction;
import '../providers.dart';
import '../widgets/ui.dart';

/// All transactions with search + category filter.
class TransactionsTab extends ConsumerStatefulWidget {
  const TransactionsTab({super.key});
  @override
  ConsumerState<TransactionsTab> createState() =>
      _TransactionsTabState();
}

class _TransactionsTabState extends ConsumerState<TransactionsTab> {
  String _q = '';
  String? _cat;

  static const _cats = [
    'credit_sale', 'cash_sale', 'customer_payment', 'customer_advance',
    'credit_purchase', 'cash_purchase', 'supplier_payment', 'supplier_advance',
    'expense', 'other_income', 'cash_transfer', 'sales_return',
    'purchase_return', 'production', 'adjustment', 'opening_balance',
  ];

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.navTransactions)),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(children: [
              ChoiceChip(
                label: Text(l.all),
                selected: _cat == null,
                onSelected: (_) => setState(() => _cat = null),
              ),
              const SizedBox(width: 6),
              ..._cats.map((c) => Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                      label: Text(_catLabel(l, c)),
                      selected: _cat == c,
                      onSelected: (_) => setState(() => _cat = c),
                    ),
                  )),
            ]),
          ),
          Expanded(
            child: FutureBuilder<List<Transaction>>(
              future: _load(db),
              builder: (c, snap) {
                if (!snap.hasData) {
                  return const Center(
                      child: CircularProgressIndicator());
                }
                final rows = snap.data!;
                if (rows.isEmpty) {
                  return EmptyState(title: l.noTransactionsYet);
                }
                return ListView.builder(
                  itemCount: rows.length,
                  itemBuilder: (_, i) {
                    final t = rows[i];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      child: ListTile(
                        leading: Icon(_catIcon(t.category),
                            color: Theme.of(context)
                                .colorScheme
                                .primary),
                        title: Text(t.description.isEmpty
                            ? t.txnNumber
                            : t.description),
                        subtitle: Text(
                            '${_catLabel(l, t.category)} • ${fmtDate(context, t.date)}'),
                        trailing: MoneyText(t.amountMinor),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Transaction>> _load(AppDatabase db) async {
    final sel = db.select(db.transactions);
    if (_cat != null) {
      sel.where((t) => t.category.equals(_cat!));
    }
    sel.orderBy([(t) => OrderingTerm.desc(t.date)]);
    final rows = await sel.get();
    if (_q.isEmpty) return rows;
    return rows
        .where((t) =>
            t.description.contains(_q) ||
            t.txnNumber.contains(_q) ||
            t.reference.contains(_q))
        .toList();
  }

  String _catLabel(dynamic l, String c) => switch (c) {
        'credit_sale' => l.creditSale,
        'cash_sale' => l.cashSale,
        'customer_payment' => l.receivePayment,
        'supplier_payment' => l.makePayment,
        'credit_purchase' => l.newPurchase,
        'cash_purchase' => l.newPurchase,
        'expense' => l.expenses,
        'other_income' => l.income,
        'cash_transfer' => l.transfer,
        'sales_return' => l.salesReturns,
        'purchase_return' => l.purchaseReturns,
        'production' => l.production,
        'opening_balance' => l.openingBalance,
        _ => c,
      };

  IconData _catIcon(String c) => switch (c) {
        'credit_sale' || 'cash_sale' => Icons.point_of_sale_outlined,
        'customer_payment' => Icons.payments_outlined,
        'supplier_payment' => Icons.payments_outlined,
        'credit_purchase' || 'cash_purchase' =>
          Icons.shopping_cart_outlined,
        'expense' => Icons.money_off_outlined,
        'other_income' => Icons.attach_money_outlined,
        'cash_transfer' => Icons.swap_horiz_outlined,
        'production' => Icons.factory_outlined,
        _ => Icons.receipt_long_outlined,
      };
}

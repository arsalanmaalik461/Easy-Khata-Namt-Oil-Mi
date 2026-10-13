import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/money.dart';
import '../../core/units.dart';
import '../providers.dart';
import '../widgets/ui.dart';

/// Generic report viewer: date range + computed rows per report kind.
class ReportViewScreen extends ConsumerStatefulWidget {
  final String kind;
  final String title;
  const ReportViewScreen(
      {super.key, required this.kind, required this.title});

  @override
  ConsumerState<ReportViewScreen> createState() =>
      _ReportViewScreenState();
}

class _ReportViewScreenState extends ConsumerState<ReportViewScreen> {
  DateTime _from = DateTime.now().subtract(const Duration(days: 30));
  DateTime _to = DateTime.now();

  int get _f => DateTime(_from.year, _from.month, _from.day)
      .millisecondsSinceEpoch;
  int get _t => DateTime(_to.year, _to.month, _to.day, 23, 59, 59, 999)
      .millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(children: [
              Expanded(
                  child: OutlinedButton(
                      onPressed: () => _pick(true),
                      child: Text(
                          '${l.from}: ${fmtDate(context, _f)}'))),
              const SizedBox(width: 8),
              Expanded(
                  child: OutlinedButton(
                      onPressed: () => _pick(false),
                      child:
                          Text('${l.to}: ${fmtDate(context, _t)}'))),
            ]),
          ),
          Expanded(child: _body()),
        ],
      ),
    );
  }

  Future<void> _pick(bool isFrom) async {
    final d = await showDatePicker(
      context: context,
      initialDate: isFrom ? _from : _to,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (d != null) setState(() => isFrom ? _from = d : _to = d);
  }

  Widget _body() {
    final l = L(context);
    final svc = ref.watch(reportsProvider);
    final db = ref.watch(databaseProvider);
    return FutureBuilder<Widget>(
      future: _buildReport(l, svc, db),
      builder: (c, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) {
          return Center(child: Text('${l.errorGeneric}\n${snap.error}'));
        }
        return snap.data!;
      },
    );
  }

  Future<Widget> _buildReport(l, svc, db) async {
    switch (widget.kind) {
      case 'pnl':
        final r = await svc.profitLoss(_f, _t);
        return _kvList([
          (l.revenue, r.revenue.minor),
          (l.costOfGoods, r.costOfGoodsSold.minor),
          (l.operatingExpenses, r.operatingExpenses.minor),
          (l.income, r.otherIncome.minor),
          (l.netProfit, r.profit.minor),
        ], note: '(${l.estimated})');
      case 'valuation':
        final rows = await svc.inventoryValuation();
        final total = rows.fold<int>(0, (a, r) => a + r.value.minor);
        return _table(
            [l.productName, l.currentStock, l.costPerUnit, l.total],
            rows
                .map((r) => [
                      r.product.name,
                      '${r.stock.display()}',
                      fmtMoney(context, r.avgUnitCost.minor),
                      fmtMoney(context, r.value.minor),
                    ])
                .toList(),
            footer: '${l.total}: ${fmtMoney(context, total)}');
      case 'lowstock':
        final products = await (db.select(db.products)
              ..where((t) => t.active.equals(true)))
            .get();
        final rows = <List<String>>[];
        for (final p in products) {
          final stock = await svc.accounting.stockOf(p.id);
          final reorder = Qty.of(p.reorderNum, p.reorderDen);
          if (reorder > Qty.zero && stock <= reorder) {
            rows.add([p.name, stock.display(), reorder.display()]);
          }
        }
        return _table([l.productName, l.currentStock, l.reorderLevel],
            rows);
      case 'production':
        final rows = await svc.productionYields(_f, _t);
        return _table(
            [l.batchNo, l.date, l.rawMaterials, l.finishedOutputs,
             l.yieldPercent, l.totalCost],
            rows
                .map((r) => [
                      r.batch.batchNo,
                      fmtDate(context, r.batch.date),
                      r.inputQty.toStringAsFixed(1),
                      r.oilQty.toStringAsFixed(1),
                      r.yieldPercent == null
                          ? '—'
                          : '${r.yieldPercent!.toStringAsFixed(1)}%',
                      fmtMoney(context, r.totalCost.minor),
                    ])
                .toList());
      case 'receivables':
        final cs = await (db.select(db.customers)
              ..where((t) => t.balance.isBiggerThanValue(0))
              ..orderBy([(t) => OrderingTerm.desc(t.balance)]))
            .get();
        final total = cs.fold<int>(0, (a, c) => a + c.balance);
        return _table(
            [l.customerName, l.phone, l.balance],
            cs
                .map((c) => [
                      c.name,
                      c.phone,
                      fmtMoney(context, c.balance)
                    ])
                .toList(),
            footer: '${l.total}: ${fmtMoney(context, total)}');
      case 'payables':
        final ss = await (db.select(db.suppliers)
              ..where((t) => t.balance.isBiggerThanValue(0))
              ..orderBy([(t) => OrderingTerm.desc(t.balance)]))
            .get();
        final total = ss.fold<int>(0, (a, s) => a + s.balance);
        return _table(
            [l.supplierName, l.phone, l.balance],
            ss
                .map((s) => [
                      s.name,
                      s.phone,
                      fmtMoney(context, s.balance)
                    ])
                .toList(),
            footer: '${l.total}: ${fmtMoney(context, total)}');
      case 'balances':
        final accs = await db.select(db.cashAccounts).get();
        final total = accs.fold<int>(0, (a, x) => a + x.balance);
        return _table(
            [l.accountName, l.accountType, l.balance],
            accs
                .map((a) => [
                      a.name,
                      a.type == 'cash' ? l.typeCash : l.typeBank,
                      fmtMoney(context, a.balance)
                    ])
                .toList(),
            footer: '${l.total}: ${fmtMoney(context, total)}');
      default:
        // daily/monthly/sales/purchases/payments/expenses/income/cashbook/ledgers
        return _txnReport(l, db);
    }
  }

  Future<Widget> _txnReport(l, db) async {
    // Map report kind -> txn categories + label
    final cats = switch (widget.kind) {
      'daily' || 'monthly' => null, // all
      'sales' => ['credit_sale', 'cash_sale'],
      'purchases' => ['credit_purchase', 'cash_purchase'],
      'pay_in' => ['customer_payment'],
      'pay_out' => ['supplier_payment'],
      'expenses' => ['expense'],
      'income' => ['other_income'],
      'cashbook' => [
          'customer_payment', 'supplier_payment', 'expense',
          'other_income', 'cash_transfer'
        ],
      _ => null,
    };
    final sel = db.select(db.transactions)
      ..where((t) => t.date.isBetweenValues(_f, _t));
    if (cats != null) sel.where((t) => t.category.isIn(cats));
    sel.orderBy([(t) => OrderingTerm.desc(t.date)]);
    final rows = await sel.get();
    final total = rows.fold<int>(0, (a, t) => a + t.amountMinor);
    if (rows.isEmpty) return EmptyState(title: l.noTransactionsYet);
    return Column(children: [
      Expanded(
        child: ListView.builder(
          itemCount: rows.length,
          itemBuilder: (_, i) {
            final t = rows[i];
            return ListTile(
              dense: true,
              title: Text(
                  t.description.isEmpty ? t.txnNumber : t.description),
              subtitle: Text(fmtDate(context, t.date)),
              trailing: MoneyText(t.amountMinor),
            );
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          Expanded(
              child: Text(l.total,
                  style:
                      const TextStyle(fontWeight: FontWeight.w800))),
          MoneyText(total),
        ]),
      ),
    ]);
  }

  Widget _kvList(List<(String, int)> rows, {String? note}) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (note != null)
          Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(note,
                  style: const TextStyle(color: Colors.grey))),
        ...rows.map((r) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(children: [
                Expanded(child: Text(r.$1)),
                MoneyText(r.$2),
              ]),
            )),
      ],
    );
  }

  Widget _table(
      List<String> head, List<List<String>> rows, {String? footer}) {
    if (rows.isEmpty) {
      return EmptyState(title: L(context).noTransactionsYet);
    }
    return Column(children: [
      Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns:
                head.map((h) => DataColumn(label: Text(h))).toList(),
            rows: rows
                .map((r) => DataRow(
                    cells: r.map((c) => DataCell(Text(c))).toList()))
                .toList(),
          ),
        ),
      ),
      if (footer != null)
        Padding(
            padding: const EdgeInsets.all(16),
            child: Text(footer,
                style: const TextStyle(fontWeight: FontWeight.w800))),
    ]);
  }
}

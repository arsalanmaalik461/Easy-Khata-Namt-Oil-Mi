import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/money.dart';
import '../../core/units.dart';
import '../../data/services.dart';
import '../providers.dart';
import '../widgets/ui.dart';

class ProductionScreen extends ConsumerWidget {
  const ProductionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L(context);
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.production)),
      body: FutureBuilder(
        future: (db.select(db.productionBatches)
              ..orderBy([(t) => OrderingTerm.desc(t.date)]))
            .get(),
        builder: (c, snap) {
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final rows = snap.data!;
          if (rows.isEmpty) {
            return EmptyState(
              title: l.production,
              hint: l.addFirstTransaction,
              icon: Icons.factory_outlined,
              actionLabel: l.newBatch,
              onAction: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          const ProductionFormScreen())),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: rows.length,
            itemBuilder: (_, i) {
              final b = rows[i];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: const Icon(Icons.factory_outlined),
                  title: Text(b.batchNo),
                  subtitle: Text(fmtDate(context, b.date)),
                  trailing: MoneyText(b.labourCostMinor +
                      b.electricityCostMinor +
                      b.otherCostMinor),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              BatchDetailScreen(batchId: b.id))),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const ProductionFormScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _IO {
  String productId;
  String name;
  String unitId;
  String unitSymbol;
  Qty qty;
  _IO(this.productId, this.name, this.unitId, this.unitSymbol, this.qty);
}

class ProductionFormScreen extends ConsumerStatefulWidget {
  const ProductionFormScreen({super.key});
  @override
  ConsumerState<ProductionFormScreen> createState() =>
      _ProductionFormScreenState();
}

class _ProductionFormScreenState
    extends ConsumerState<ProductionFormScreen> {
  final _labour = TextEditingController(text: '0');
  final _elec = TextEditingController(text: '0');
  final _other = TextEditingController(text: '0');
  final _notes = TextEditingController();
  final List<_IO> _inputs = [];
  final List<_IO> _outputs = [];

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.newBatch)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SectionCard(
            title: l.rawMaterials,
            trailing: TextButton.icon(
                onPressed: () => _pick(true),
                icon: const Icon(Icons.add),
                label: Text(l.add)),
            child: _ioList(_inputs),
          ),
          const SizedBox(height: 12),
          SectionCard(
            title: l.finishedOutputs,
            trailing: TextButton.icon(
                onPressed: () => _pick(false),
                icon: const Icon(Icons.add),
                label: Text(l.add)),
            child: _ioList(_outputs),
          ),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(
                child: TextField(
                    controller: _labour,
                    keyboardType:
                        const TextInputType.numberWithOptions(
                            decimal: true),
                    decoration: InputDecoration(
                        labelText: l.labourCost,
                        prefixText: 'Rs '))),
            const SizedBox(width: 12),
            Expanded(
                child: TextField(
                    controller: _elec,
                    keyboardType:
                        const TextInputType.numberWithOptions(
                            decimal: true),
                    decoration: InputDecoration(
                        labelText: l.electricityCost,
                        prefixText: 'Rs '))),
          ]),
          const SizedBox(height: 12),
          TextField(
              controller: _other,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                  labelText: l.otherCost, prefixText: 'Rs ')),
          const SizedBox(height: 12),
          TextField(
              controller: _notes,
              decoration:
                  InputDecoration(labelText: l.notes)),
          const SizedBox(height: 24),
          FilledButton(onPressed: _save, child: Text(l.save)),
        ],
      ),
    );
  }

  Widget _ioList(List<_IO> list) {
    if (list.isEmpty) return Text(L(context).emptyStateTitle);
    return Column(
      children: list
          .asMap()
          .entries
          .map((e) => Dismissible(
                key: ValueKey('${e.value.productId}$e.key'),
                direction: DismissDirection.endToStart,
                background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: const Icon(Icons.delete,
                        color: Colors.white)),
                onDismissed: (_) =>
                    setState(() => list.removeAt(e.key)),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(e.value.name),
                  trailing: Text(
                      '${e.value.qty.display()} ${e.value.unitSymbol}'),
                ),
              ))
          .toList(),
    );
  }

  Future<void> _pick(bool isInput) async {
    final l = L(context);
    final products = await ref.read(productsProvider('').future);
    final units = await ref.read(unitsProvider.future);
    if (!mounted) return;
    String? pid;
    String? uid;
    final qtyC = TextEditingController(text: '1');
    final ok = await showDialog<bool>(
      context: context,
      builder: (c) => StatefulBuilder(
        builder: (c, setS) => AlertDialog(
          title: Text(l.addItem),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration:
                    InputDecoration(labelText: l.selectProduct),
                items: products
                    .map((p) => DropdownMenuItem(
                        value: p.id, child: Text(p.name)))
                    .toList(),
                onChanged: (v) => setS(() {
                  pid = v;
                  uid = products
                      .firstWhere((e) => e.id == v)
                      .baseUnitId;
                }),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration:
                    InputDecoration(labelText: l.unit),
                initialValue: uid,
                items: units
                    .map((u) => DropdownMenuItem(
                        value: u.id,
                        child: Text(u.symbol)))
                    .toList(),
                onChanged: (v) => setS(() => uid = v),
              ),
              const SizedBox(height: 12),
              TextField(
                  controller: qtyC,
                  keyboardType:
                      const TextInputType.numberWithOptions(
                          decimal: true),
                  decoration:
                      InputDecoration(labelText: l.quantity)),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(c, false),
                child: Text(l.cancel)),
            FilledButton(
                onPressed: () => Navigator.pop(c, true),
                child: Text(l.add)),
          ],
        ),
      ),
    );
    if (ok == true && pid != null && uid != null) {
      final p = products.firstWhere((e) => e.id == pid);
      final u = units.firstWhere((e) => e.id == uid);
      setState(() => (isInput ? _inputs : _outputs).add(_IO(
          pid!, p.name, uid!, u.symbol,
          Qty.parse(qtyC.text.isEmpty ? '1' : qtyC.text))));
    }
  }

  Future<void> _save() async {
    final l = L(context);
    if (_inputs.isEmpty || _outputs.isEmpty) {
      showSnack(context, l.addItem, error: true);
      return;
    }
    final svc = ref.read(accountingProvider);
    final res = await svc.createProductionBatch(
      inputs: _inputs
          .map((e) => ProductionIO(
              productId: e.productId,
              qty: e.qty,
              unitId: e.unitId))
          .toList(),
      outputs: _outputs
          .map((e) => ProductionIO(
              productId: e.productId,
              qty: e.qty,
              unitId: e.unitId))
          .toList(),
      labourCost: Money(parseAmountMinor(_labour.text)),
      electricityCost: Money(parseAmountMinor(_elec.text)),
      otherCost: Money(parseAmountMinor(_other.text)),
      notes: _notes.text.trim(),
    );
    if (!res.isOk) {
      if (mounted) showSnack(context, res.error, error: true);
      return;
    }
    refreshLists(ref);
    if (mounted) {
      showSnack(context, l.recordSaved);
      Navigator.pop(context);
    }
  }
}

class BatchDetailScreen extends ConsumerWidget {
  final String batchId;
  const BatchDetailScreen({super.key, required this.batchId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L(context);
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.production)),
      body: FutureBuilder(
        future: _load(db),
        builder: (c, snap) {
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final (b, ins, outs) = snap.data!;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SectionCard(
                  title: '${l.batchNo}: ${b.batchNo}',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${l.batchDate}: ${fmtDate(context, b.date)}'),
                      Text(
                          '${l.labourCost}: ${fmtMoney(context, b.labourCostMinor)}'),
                      Text(
                          '${l.electricityCost}: ${fmtMoney(context, b.electricityCostMinor)}'),
                      Text(
                          '${l.otherCost}: ${fmtMoney(context, b.otherCostMinor)}'),
                      if (b.notes.isNotEmpty)
                        Text('${l.notes}: ${b.notes}'),
                    ],
                  )),
              const SizedBox(height: 12),
              SectionCard(
                  title: l.rawMaterials,
                  child: Column(
                      children: ins
                          .map((e) => ListTile(
                              dense: true,
                              title: Text(e.$1),
                              trailing: Text(
                                  '${e.$2.display()} ${e.$3}')))
                          .toList())),
              const SizedBox(height: 12),
              SectionCard(
                  title: l.finishedOutputs,
                  child: Column(
                      children: outs
                          .map((e) => ListTile(
                              dense: true,
                              title: Text(e.$1),
                              trailing: Text(
                                  '${e.$2.display()} ${e.$3}')))
                          .toList())),
            ],
          );
        },
      ),
    );
  }

  Future<(dynamic, List<(String, Qty, String)>,
      List<(String, Qty, String)>)> _load(db) async {
    final b = await (db.select(db.productionBatches)
          ..where((t) => t.id.equals(batchId)))
        .getSingle();
    Future<List<(String, Qty, String)>> rows(table, isIn) async {
      final list = isIn
          ? await (db.select(db.productionInputs)
                ..where((t) => t.batchId.equals(batchId)))
              .get()
          : await (db.select(db.productionOutputs)
                ..where((t) => t.batchId.equals(batchId)))
              .get();
      final out = <(String, Qty, String)>[];
      for (final r in list) {
        final p = await (db.select(db.products)
              ..where((t) =>
                  t.id.equals((r as dynamic).productId as String)))
            .getSingle();
        out.add((
          p.name,
          Qty.of((r as dynamic).qtyNum as int,
              (r as dynamic).qtyDen as int),
          p.baseUnitId
        ));
      }
      return out;
    }

    return (
      b,
      await rows(db.productionInputs, true),
      await rows(db.productionOutputs, false)
    );
  }
}

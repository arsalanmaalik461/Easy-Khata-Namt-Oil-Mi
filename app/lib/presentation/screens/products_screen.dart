import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/money.dart';
import '../../core/units.dart';
import '../../data/db.dart';
import '../providers.dart';
import '../widgets/ui.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});
  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  String _q = '';

  static const _cats = [
    ('raw', 'catRaw'),
    ('finished_oil', 'catFinishedOil'),
    ('cake', 'catCake'),
    ('packaging', 'catPackaging'),
    ('container', 'catContainers'),
    ('spare', 'catSpareParts'),
    ('consumable', 'catConsumables'),
    ('other', 'catOther'),
  ];

  String _catLabel(l, String c) =>
      {'raw': l.catRaw, 'finished_oil': l.catFinishedOil, 'cake': l.catCake,
       'packaging': l.catPackaging, 'container': l.catContainers,
       'spare': l.catSpareParts, 'consumable': l.catConsumables,
       'other': l.catOther}[c] ?? c;

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    final async = ref.watch(productsProvider(_q));
    return Scaffold(
      appBar: AppBar(title: Text(l.products)),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            decoration: InputDecoration(
                hintText: l.search,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
            onChanged: (v) => setState(() => _q = v.trim()),
          ),
        ),
        Expanded(
          child: async.when(
            loading: () =>
                const Center(child: CircularProgressIndicator()),
            error: (_, __) => Center(child: Text(l.errorGeneric)),
            data: (list) {
              if (list.isEmpty) {
                return EmptyState(
                    title: l.noProducts,
                    actionLabel: l.addProduct,
                    onAction: _form);
              }
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (c, i) {
                  final p = list[i];
                  return FutureBuilder<Qty>(
                    future: ref
                        .read(accountingProvider)
                        .stockOf(p.id),
                    builder: (c2, s) {
                      final stock = s.data ?? Qty.zero;
                      final low = Qty.of(p.reorderNum, p.reorderDen) >
                              Qty.zero &&
                          stock <=
                              Qty.of(p.reorderNum, p.reorderDen);
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        child: ListTile(
                          leading: Icon(
                              Icons.inventory_2_outlined,
                              color: low
                                  ? Colors.orange
                                  : Theme.of(context)
                                      .colorScheme
                                      .primary),
                          title: Text(p.name),
                          subtitle: Text(
                              '${_catLabel(l, p.category)} • ${l.salePrice}: ${fmtMoney(context, p.salePrice)}'),
                          trailing: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            crossAxisAlignment:
                                CrossAxisAlignment.end,
                            children: [
                              Text(
                                  '${l.inStock}: ${stock.display()}',
                                  style: TextStyle(
                                      fontWeight:
                                          FontWeight.w700,
                                      color: low
                                          ? Colors.orange
                                          : null)),
                              if (low)
                                Text(l.lowStock,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.orange)),
                            ],
                          ),
                          onTap: () => _form(existing: p),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _form(), child: const Icon(Icons.add)),
    );
  }

  Future<void> _form({dynamic existing}) async {
    final l = L(context);
    final nameC = TextEditingController(text: existing?.name ?? '');
    final purC = TextEditingController(
        text: existing == null
            ? ''
            : (existing.purchasePrice / 100).toString());
    final saleC = TextEditingController(
        text: existing == null
            ? ''
            : (existing.salePrice / 100).toString());
    final reorderC = TextEditingController(
        text: existing == null
            ? '0'
            : Qty.of(existing.reorderNum, existing.reorderDen)
                .display());
    String cat = existing?.category ?? 'raw';
    String unitId = existing?.baseUnitId ?? 'kg';
    final units = await ref.read(unitsProvider.future);
    if (!mounted) return;
    final ok = await showDialog<bool>(
      context: context,
      builder: (c) => StatefulBuilder(
        builder: (c, setS) => AlertDialog(
          title: Text(
              existing == null ? l.addProduct : l.editProduct),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                    controller: nameC,
                    decoration: InputDecoration(
                        labelText: l.productName)),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: cat,
                  decoration:
                      InputDecoration(labelText: l.category),
                  items: _cats
                      .map((e) => DropdownMenuItem(
                          value: e.$1,
                          child: Text(_catLabel(l, e.$1))))
                      .toList(),
                  onChanged: (v) => setS(() => cat = v!),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: unitId,
                  decoration:
                      InputDecoration(labelText: l.baseUnit),
                  items: units
                      .map((u) => DropdownMenuItem(
                          value: u.id,
                          child: Text(
                              '${u.symbol} — ${u.nameEn}')))
                      .toList(),
                  onChanged: (v) => setS(() => unitId = v!),
                ),
                const SizedBox(height: 12),
                TextField(
                    controller: purC,
                    keyboardType:
                        const TextInputType.numberWithOptions(
                            decimal: true),
                    decoration: InputDecoration(
                        labelText: l.purchasePrice,
                        prefixText: 'Rs ')),
                const SizedBox(height: 12),
                TextField(
                    controller: saleC,
                    keyboardType:
                        const TextInputType.numberWithOptions(
                            decimal: true),
                    decoration: InputDecoration(
                        labelText: l.salePrice,
                        prefixText: 'Rs ')),
                const SizedBox(height: 12),
                TextField(
                    controller: reorderC,
                    keyboardType:
                        const TextInputType.numberWithOptions(
                            decimal: true),
                    decoration: InputDecoration(
                        labelText: l.reorderLevel)),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(c, false),
                child: Text(l.cancel)),
            FilledButton(
                onPressed: () => Navigator.pop(c, true),
                child: Text(l.save)),
          ],
        ),
      ),
    );
    if (ok != true || nameC.text.trim().isEmpty) return;
    final svc = ref.read(accountingProvider);
    if (existing == null) {
      await svc.createProduct(
        name: nameC.text.trim(),
        category: cat,
        baseUnitId: unitId,
        purchasePriceMinor: parseAmountMinor(purC.text),
        salePriceMinor: parseAmountMinor(saleC.text),
        reorderLevel: Qty.parse(
            reorderC.text.isEmpty ? '0' : reorderC.text),
      );
    } else {
      final db = ref.read(databaseProvider);
      await (db.update(db.products)
            ..where((t) => t.id.equals(existing.id)))
          .write(ProductsCompanion(
              name: Value(nameC.text.trim()),
              category: Value(cat),
              baseUnitId: Value(unitId),
              purchasePrice: Value(parseAmountMinor(purC.text)),
              salePrice: Value(parseAmountMinor(saleC.text)),
              reorderNum: Value(
                  Qty.parse(reorderC.text.isEmpty
                          ? '0'
                          : reorderC.text)
                      .num),
              reorderDen: Value(
                  Qty.parse(reorderC.text.isEmpty
                          ? '0'
                          : reorderC.text)
                      .den),
              updatedAt:
                  Value(DateTime.now().millisecondsSinceEpoch)));
    }
    refreshLists(ref);
    if (mounted) {
      setState(() {});
      showSnack(context, l.recordSaved);
    }
  }
}

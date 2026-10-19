import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../core/money.dart';
import '../../core/units.dart';
import '../../data/services.dart';
import '../providers.dart';
import '../widgets/ek.dart';
import '../widgets/ui.dart';

enum DocMode { sale, purchase }

class _Line {
  String productId;
  String productName;
  String unitId;
  String unitSymbol;
  Qty qty;
  int unitPriceMinor;
  int discountMinor;
  _Line({
    required this.productId,
    required this.productName,
    required this.unitId,
    required this.unitSymbol,
    required this.qty,
    required this.unitPriceMinor,
    this.discountMinor = 0,
  });
  int get lineTotal =>
      (unitPriceMinor * qty.asDouble).round() - discountMinor;
}

/// Invoice form for sales and purchases (multi-item, discount, tax,
/// partial payment).
class SaleFormScreen extends ConsumerStatefulWidget {
  final DocMode mode;
  const SaleFormScreen({super.key, required this.mode});

  @override
  ConsumerState<SaleFormScreen> createState() => _SaleFormScreenState();
}

class _SaleFormScreenState extends ConsumerState<SaleFormScreen> {
  final _form = GlobalKey<FormState>();
  final _discount = TextEditingController(text: '0');
  final _tax = TextEditingController(text: '0');
  final _paid = TextEditingController(text: '0');
  final _notes = TextEditingController();
  String? _partyId;
  String? _accountId;
  final List<_Line> _lines = [];

  bool get _isSale => widget.mode == DocMode.sale;

  int _paidMinor() {
    final v = evaluateExpression(_paid.text);
    if (v == null || v <= 0) return 0;
    return (v * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    final total = _lines.fold<int>(0, (a, x) => a + x.lineTotal);
    final discount = parseAmountMinor(_discount.text);
    final tax = parseAmountMinor(_tax.text);
    final grand = total - discount + tax;
    return Scaffold(
      appBar: AppBar(title: Text(_isSale ? l.newSale : l.newPurchase)),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _partyPicker(),
            const SizedBox(height: 12),
            SectionCard(
              title: l.items,
              trailing: TextButton.icon(
                onPressed: _pickProduct,
                icon: const Icon(Icons.add),
                label: Text(l.addItem),
              ),
              child: _lines.isEmpty
                  ? Text(l.emptyStateTitle)
                  : Column(
                      children: _lines
                          .asMap()
                          .entries
                          .map((e) => _lineRow(e.key, e.value))
                          .toList(),
                    ),
            ),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                  child: TextFormField(
                      controller: _discount,
                      keyboardType:
                          const TextInputType.numberWithOptions(
                              decimal: true),
                      decoration: InputDecoration(
                          labelText: l.discount, prefixText: 'Rs '),
                      onChanged: (_) => setState(() {}))),
              const SizedBox(width: 12),
              Expanded(
                  child: TextFormField(
                      controller: _tax,
                      keyboardType:
                          const TextInputType.numberWithOptions(
                              decimal: true),
                      decoration: InputDecoration(
                          labelText: l.tax, prefixText: 'Rs '),
                      onChanged: (_) => setState(() {}))),
            ]),
            const SizedBox(height: 12),
            SectionCard(
              title: l.total,
              child: Column(
                children: [
                  _kv(l.subtotal, total),
                  _kv(l.discount, -discount),
                  _kv(l.tax, tax),
                  const Divider(),
                  _kv(l.grandTotal, grand, bold: true),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(l.paidAmount,
                style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            AmountKeypadInput(
              controller: _paid,
              accentColor: _isSale
                  ? AppColors.liye
                  : AppColors.diye,
              onChanged: () => setState(() {}),
            ),
            const SizedBox(height: 12),
            if (_paidMinor() > 0) _accountPicker(),
            const SizedBox(height: 12),
            TextFormField(
                controller: _notes,
                decoration:
                    InputDecoration(labelText: l.notes)),
            const SizedBox(height: 24),
            FilledButton(
                onPressed: () => _save(grand), child: Text(l.save)),
          ],
        ),
      ),
    );
  }

  Widget _kv(String k, int minor, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(children: [
        Expanded(child: Text(k)),
        MoneyText(minor,
            style: TextStyle(
                fontWeight:
                    bold ? FontWeight.w800 : FontWeight.w600)),
      ]),
    );
  }

  Widget _partyPicker() {
    final l = L(context);
    final AsyncValue<List<dynamic>> async =
        _isSale ? ref.watch(customersProvider('')) : ref.watch(suppliersProvider(''));
    return async.when(
          loading: () => const LinearProgressIndicator(),
          error: (_, __) => Text(l.errorGeneric),
          data: (list) => DropdownButtonFormField<String>(
            initialValue: _partyId,
            decoration: InputDecoration(
                labelText: _isSale
                    ? l.selectCustomer
                    : l.selectSupplier),
            items: list
                .map((p) => DropdownMenuItem(
                    value: p.id as String,
                    child:
                        Text(p.name as String)))
                .toList(),
            onChanged: (v) => setState(() => _partyId = v),
            validator: (v) =>
                v == null ? l.requiredField : null,
          ),
        );
  }

  Widget _accountPicker() {
    final l = L(context);
    return ref.watch(cashAccountsProvider).when(
          loading: () => const LinearProgressIndicator(),
          error: (_, __) => Text(l.errorGeneric),
          data: (list) => DropdownButtonFormField<String>(
            initialValue: _accountId,
            decoration: InputDecoration(labelText: l.selectAccount),
            items: list
                .map((a) => DropdownMenuItem(
                    value: a.id, child: Text(a.name)))
                .toList(),
            onChanged: (v) => setState(() => _accountId = v),
            validator: (v) =>
                v == null ? l.requiredField : null,
          ),
        );
  }

  Widget _lineRow(int i, _Line line) {
    return Dismissible(
      key: ValueKey('line$i'),
      direction: DismissDirection.endToStart,
      background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 16),
          child: const Icon(Icons.delete, color: Colors.white)),
      onDismissed: (_) => setState(() => _lines.removeAt(i)),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(line.productName),
        subtitle: Text(
            '${line.qty.display()} ${line.unitSymbol} × ${fmtMoney(context, line.unitPriceMinor)}'),
        trailing: MoneyText(line.lineTotal),
        onTap: () => _editLine(i),
      ),
    );
  }

  Future<void> _pickProduct() async {
    final l = L(context);
    final products = await ref.read(productsProvider('').future);
    if (!mounted) return;
    if (products.isEmpty) {
      showSnack(context, l.noProducts, error: true);
      return;
    }
    final units = await ref.read(unitsProvider.future);
    if (!mounted) return;
    String? pid;
    String? uid;
    final qtyC = TextEditingController(text: '1');
    final priceC = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (c) => StatefulBuilder(
        builder: (c, setS) => AlertDialog(
          title: Text(l.addItem),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  decoration:
                      InputDecoration(labelText: l.selectProduct),
                  items: products
                      .map((p) => DropdownMenuItem(
                          value: p.id, child: Text(p.name)))
                      .toList(),
                  onChanged: (v) {
                    setS(() {
                      pid = v;
                      final p = products
                          .firstWhere((e) => e.id == v);
                      uid = p.baseUnitId;
                      priceC.text = _isSale
                          ? (p.salePrice / 100).toString()
                          : (p.purchasePrice / 100).toString();
                    });
                  },
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  decoration:
                      InputDecoration(labelText: l.unit),
                  initialValue: uid,
                  items: units
                      .map((u) => DropdownMenuItem(
                          value: u.id, child: Text(u.symbol)))
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
                const SizedBox(height: 12),
                TextField(
                    controller: priceC,
                    keyboardType:
                        const TextInputType.numberWithOptions(
                            decimal: true),
                    decoration: InputDecoration(
                        labelText: l.unitPrice,
                        prefixText: 'Rs ')),
              ],
            ),
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
      setState(() => _lines.add(_Line(
            productId: pid!,
            productName: p.name,
            unitId: uid!,
            unitSymbol: u.symbol,
            qty: Qty.parse(qtyC.text.isEmpty ? '1' : qtyC.text),
            unitPriceMinor: parseAmountMinor(priceC.text),
          )));
    }
  }

  Future<void> _editLine(int i) async {
    // Simple: remove and re-add via picker is overkill; allow qty edit.
    final l = L(context);
    final qtyC =
        TextEditingController(text: _lines[i].qty.display());
    final ok = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text(l.quantity),
        content: TextField(
            controller: qtyC,
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true),
            decoration:
                InputDecoration(labelText: l.quantity)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(c, false),
              child: Text(l.cancel)),
          FilledButton(
              onPressed: () => Navigator.pop(c, true),
              child: Text(l.save)),
        ],
      ),
    );
    if (ok == true) {
      setState(
          () => _lines[i].qty = Qty.parse(qtyC.text.isEmpty ? '1' : qtyC.text));
    }
  }

  Future<void> _save(int grand) async {
    final l = L(context);
    if (!_form.currentState!.validate()) return;
    if (_lines.isEmpty) {
      showSnack(context, l.addItem, error: true);
      return;
    }
    final svc = ref.read(accountingProvider);
    final items = _lines
        .map((x) => SaleItemInput(
            productId: x.productId,
            qty: x.qty,
            unitId: x.unitId,
            unitPriceMinor: x.unitPriceMinor,
            discountMinor: x.discountMinor))
        .toList();
    try {
      final res = _isSale
          ? await svc.createSale(
              customerId: _partyId!,
              items: items,
              discount: Money(parseAmountMinor(_discount.text)),
              tax: Money(parseAmountMinor(_tax.text)),
              paidNow: Money(_paidMinor()),
              accountId: _accountId,
              notes: _notes.text.trim(),
            )
          : await svc.createPurchase(
              supplierId: _partyId!,
              items: items,
              discount: Money(parseAmountMinor(_discount.text)),
              tax: Money(parseAmountMinor(_tax.text)),
              paidNow: Money(_paidMinor()),
              accountId: _accountId,
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
    } catch (e) {
      if (mounted) showSnack(context, '$e', error: true);
    }
  }
}

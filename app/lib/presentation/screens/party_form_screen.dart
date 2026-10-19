import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/money.dart';
import '../../data/contact_picker.dart';
import '../providers.dart';
import '../widgets/ui.dart';

/// Add / edit customer or supplier.
class PartyFormScreen extends ConsumerStatefulWidget {
  final String kind; // customer | supplier
  final String? partyId;
  const PartyFormScreen({super.key, required this.kind, this.partyId});

  @override
  ConsumerState<PartyFormScreen> createState() => _PartyFormScreenState();
}

class _PartyFormScreenState extends ConsumerState<PartyFormScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _whatsapp = TextEditingController();
  final _address = TextEditingController();
  final _code = TextEditingController();
  final _business = TextEditingController();
  final _notes = TextEditingController();
  final _opening = TextEditingController(text: '0');
  bool _loaded = false;

  bool get _isEdit => widget.partyId != null;

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    final isCust = widget.kind == 'customer';
    if (!_loaded && _isEdit) {
      _load();
      return const Scaffold(
          body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(_isEdit
              ? (isCust ? l.editCustomer : l.editSupplier)
              : (isCust ? l.addCustomer : l.addSupplier))),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                          labelText: isCust
                              ? l.customerName
                              : l.supplierName),
                      validator: (v) =>
                          (v ?? '').trim().isEmpty
                              ? l.requiredField
                              : null),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon:
                      const Icon(Icons.contacts_outlined),
                  tooltip: l.pickFromContacts,
                  onPressed: _pickContact,
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
                controller: _phone,
                keyboardType: TextInputType.phone,
                decoration:
                    InputDecoration(labelText: l.phone)),
            const SizedBox(height: 12),
            TextFormField(
                controller: _whatsapp,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    labelText: l.whatsappNumber,
                    hintText: l.whatsappNumberHint)),
            const SizedBox(height: 12),
            TextFormField(
                controller: _address,
                decoration:
                    InputDecoration(labelText: l.address)),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                  child: TextFormField(
                      controller: _code,
                      decoration: InputDecoration(
                          labelText: isCust
                              ? l.customerCode
                              : l.supplierCode))),
              const SizedBox(width: 12),
              Expanded(
                  child: TextFormField(
                      controller: _business,
                      decoration: InputDecoration(
                          labelText: l.businessName))),
            ]),
            const SizedBox(height: 12),
            if (!_isEdit)
              TextFormField(
                  controller: _opening,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true),
                  decoration: InputDecoration(
                      labelText: l.openingBalance, prefixText: 'Rs ')),
            const SizedBox(height: 12),
            TextFormField(
                controller: _notes,
                maxLines: 2,
                decoration:
                    InputDecoration(labelText: l.notes)),
            const SizedBox(height: 24),
            FilledButton(onPressed: _save, child: Text(l.save)),
          ],
        ),
      ),
    );
  }

  /// Fill name/phone from the phone's contact list (new scope #6).
  Future<void> _pickContact() async {
    final res = await ContactPickerService().pickContact();
    if (!mounted) return;
    if (res.isOk) {
      final c = res.value;
      setState(() {
        if (_name.text.trim().isEmpty) {
          _name.text = c.name;
        }
        if (_phone.text.trim().isEmpty) {
          _phone.text = c.phone;
        }
      });
    } else {
      showSnack(context, res.error, error: true);
    }
  }

  Future<void> _load() async {    final db = ref.read(databaseProvider);
    if (widget.kind == 'customer') {
      final c = await (db.select(db.customers)
            ..where((t) => t.id.equals(widget.partyId!)))
          .getSingle();
      _name.text = c.name;
      _phone.text = c.phone;
      _whatsapp.text = c.whatsapp;
      _address.text = c.address;
      _code.text = c.code;
      _business.text = c.businessName;
      _notes.text = c.notes;
    } else {
      final s = await (db.select(db.suppliers)
            ..where((t) => t.id.equals(widget.partyId!)))
          .getSingle();
      _name.text = s.name;
      _phone.text = s.phone;
      _whatsapp.text = s.whatsapp;
      _address.text = s.address;
      _code.text = s.code;
      _business.text = s.businessName;
      _notes.text = s.notes;
    }
    if (mounted) setState(() => _loaded = true);
  }

  Future<void> _save() async {
    final l = L(context);
    if (!_form.currentState!.validate()) return;
    final svc = ref.read(accountingProvider);
    final opening =
        Money(((double.tryParse(_opening.text.trim()) ?? 0) * 100).round());
    try {
      if (_isEdit) {
        if (widget.kind == 'customer') {
          await svc.updateCustomer(widget.partyId!,
              name: _name.text.trim(),
              phone: _phone.text.trim(),
              whatsapp: _whatsapp.text.trim(),
              address: _address.text.trim(),
              code: _code.text.trim(),
              businessName: _business.text.trim(),
              notes: _notes.text.trim());
        } else {
          await svc.updateSupplier(widget.partyId!,
              name: _name.text.trim(),
              phone: _phone.text.trim(),
              whatsapp: _whatsapp.text.trim(),
              address: _address.text.trim(),
              code: _code.text.trim(),
              businessName: _business.text.trim(),
              notes: _notes.text.trim());
        }
      } else if (widget.kind == 'customer') {
        await svc.createCustomer(
            name: _name.text.trim(),
            phone: _phone.text.trim(),
            whatsapp: _whatsapp.text.trim(),
            address: _address.text.trim(),
            code: _code.text.trim(),
            businessName: _business.text.trim(),
            notes: _notes.text.trim(),
            openingBalance: opening);
      } else {
        await svc.createSupplier(
            name: _name.text.trim(),
            phone: _phone.text.trim(),
            whatsapp: _whatsapp.text.trim(),
            address: _address.text.trim(),
            code: _code.text.trim(),
            businessName: _business.text.trim(),
            notes: _notes.text.trim(),
            openingBalance: opening);
      }
      refreshLists(ref);
      if (mounted) {
        showSnack(context, l.recordSaved);
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) showSnack(context, '${l.errorGeneric}\n$e', error: true);
    }
  }
}

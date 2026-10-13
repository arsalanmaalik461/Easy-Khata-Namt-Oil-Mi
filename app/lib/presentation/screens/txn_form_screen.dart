import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/money.dart';
import '../providers.dart';
import '../widgets/ui.dart';

enum TxnMode { udhaar, receive, pay, expense, income, transfer }

/// One form for: give udhaar, receive payment, pay supplier,
/// record expense/income, transfer between accounts.
class TxnFormScreen extends ConsumerStatefulWidget {
  final TxnMode mode;
  final String? presetKind; // customer | supplier
  final String? presetPartyId;
  const TxnFormScreen(
      {super.key,
      required this.mode,
      this.presetKind,
      this.presetPartyId});

  @override
  ConsumerState<TxnFormScreen> createState() => _TxnFormScreenState();
}

class _TxnFormScreenState extends ConsumerState<TxnFormScreen> {
  final _form = GlobalKey<FormState>();
  final _amount = TextEditingController();
  final _desc = TextEditingController();
  final _ref = TextEditingController();
  String? _partyId;
  String? _accountId;
  String? _toAccountId;
  String _method = 'cash';
  String _category = 'other';

  @override
  void initState() {
    super.initState();
    _partyId = widget.presetPartyId;
  }

  String get _title {
    final l = L(context);
    return switch (widget.mode) {
      TxnMode.udhaar => l.giveUdhaar,
      TxnMode.receive => l.receivePayment,
      TxnMode.pay => l.makePayment,
      TxnMode.expense => l.addExpense,
      TxnMode.income => l.addIncome,
      TxnMode.transfer => l.transferFunds,
    };
  }

  bool get _needsParty =>
      widget.mode == TxnMode.udhaar ||
      widget.mode == TxnMode.receive ||
      widget.mode == TxnMode.pay;

  bool get _needsAccount =>
      widget.mode != TxnMode.udhaar && widget.mode != TxnMode.transfer;

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_needsParty) _partyPicker(),
            if (_needsAccount || widget.mode == TxnMode.transfer)
              _accountPicker(l),
            if (widget.mode == TxnMode.transfer)
              _toAccountPicker(l),
            const SizedBox(height: 12),
            AmountField(
                controller: _amount, label: l.amount, autofocus: true),
            const SizedBox(height: 12),
            if (widget.mode == TxnMode.expense ||
                widget.mode == TxnMode.income)
              _categoryPicker(l),
            if (_needsAccount || _needsParty) _methodPicker(l),
            TextFormField(
                controller: _desc,
                decoration:
                    InputDecoration(labelText: l.description)),
            const SizedBox(height: 12),
            TextFormField(
                controller: _ref,
                decoration:
                    InputDecoration(labelText: l.reference)),
            const SizedBox(height: 24),
            FilledButton(onPressed: _save, child: Text(l.save)),
          ],
        ),
      ),
    );
  }

  Widget _partyPicker() {
    final l = L(context);
    final isCust = (widget.presetKind ?? 'customer') == 'customer';
    final AsyncValue<List<dynamic>> async = isCust
        ? ref.watch(customersProvider(''))
        : ref.watch(suppliersProvider(''));
    return async.when(
      loading: () => const LinearProgressIndicator(),
      error: (_, __) => Text(l.errorGeneric),
      data: (list) => DropdownButtonFormField<String>(
        initialValue: _partyId,
        decoration: InputDecoration(
            labelText:
                isCust ? l.selectCustomer : l.selectSupplier),
        items: list
            .map((p) => DropdownMenuItem(
                value: p.id as String,
                child: Text(p.name as String)))
            .toList(),
        onChanged: (v) => setState(() => _partyId = v),
        validator: (v) =>
            v == null ? l.requiredField : null,
      ),
    );
  }

  Widget _accountPicker(l) {
    final async = ref.watch(cashAccountsProvider);
    return async.when(
      loading: () => const LinearProgressIndicator(),
      error: (_, __) => Text(l.errorGeneric),
      data: (list) => DropdownButtonFormField<String>(
        initialValue: _accountId,
        decoration: InputDecoration(labelText: l.selectAccount),
        items: list
            .map((a) => DropdownMenuItem(
                value: a.id,
                child: Text(
                    '${a.name} (${fmtMoney(context, a.balance)})')))
            .toList(),
        onChanged: (v) => setState(() => _accountId = v),
        validator: (v) =>
            v == null ? l.requiredField : null,
      ),
    );
  }

  Widget _toAccountPicker(l) {
    final async = ref.watch(cashAccountsProvider);
    return async.when(
      loading: () => const LinearProgressIndicator(),
      error: (_, __) => Text(l.errorGeneric),
      data: (list) => Padding(
        padding: const EdgeInsets.only(top: 12),
        child: DropdownButtonFormField<String>(
          initialValue: _toAccountId,
          decoration: InputDecoration(labelText: l.toAccount),
          items: list
              .map((a) => DropdownMenuItem(
                  value: a.id, child: Text(a.name)))
              .toList(),
          onChanged: (v) => setState(() => _toAccountId = v),
          validator: (v) =>
              v == null ? l.requiredField : null,
        ),
      ),
    );
  }

  Widget _methodPicker(l) {
    final methods = [
      ('cash', l.methodCash),
      ('bank', l.methodBank),
      ('easypaisa', l.methodEasypaisa),
      ('jazzcash', l.methodJazzcash),
      ('other', l.methodOther),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: DropdownButtonFormField<String>(
        initialValue: _method,
        decoration: InputDecoration(labelText: l.paymentMethod),
        items: methods
            .map((m) =>
                DropdownMenuItem(value: m.$1, child: Text(m.$2)))
            .toList(),
        onChanged: (v) => setState(() => _method = v!),
      ),
    );
  }

  Widget _categoryPicker(l) {
    final cats = widget.mode == TxnMode.expense
        ? [
            ('electricity', l.catElectricity),
            ('labour', l.catLabour),
            ('transport', l.catTransport),
            ('rent', l.catRent),
            ('repairs', l.catRepairs),
            ('packaging', l.catPackaging),
            ('maintenance', l.catMaintenance),
            ('admin', l.catAdmin),
            ('other', l.catOther),
          ]
        : [
            ('other', l.catOther),
          ];
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        initialValue: _category,
        decoration: InputDecoration(labelText: l.category),
        items: cats
            .map((m) =>
                DropdownMenuItem(value: m.$1, child: Text(m.$2)))
            .toList(),
        onChanged: (v) => setState(() => _category = v!),
      ),
    );
  }

  Future<void> _save() async {
    final l = L(context);
    if (!_form.currentState!.validate()) return;
    final svc = ref.read(accountingProvider);
    final amount = Money(parseAmountMinor(_amount.text));
    final desc = _desc.text.trim();
    final refNo = _ref.text.trim();
    try {
      final result = switch (widget.mode) {
        TxnMode.udhaar => await svc.giveUdhaar(
            customerId: _partyId!,
            amount: amount,
            description: desc,
            reference: refNo),
        TxnMode.receive => await svc.receivePayment(
            customerId: _partyId!,
            amount: amount,
            accountId: _accountId!,
            method: _method,
            reference: refNo,
            notes: desc),
        TxnMode.pay => await svc.paySupplier(
            supplierId: _partyId!,
            amount: amount,
            accountId: _accountId!,
            method: _method,
            reference: refNo,
            notes: desc),
        TxnMode.expense => await svc.recordExpense(
            category: _category,
            amount: amount,
            accountId: _accountId!,
            description: desc,
            reference: refNo),
        TxnMode.income => await svc.recordIncome(
            category: _category,
            amount: amount,
            accountId: _accountId!,
            description: desc,
            reference: refNo),
        TxnMode.transfer => await svc.transferFunds(
            fromAccountId: _accountId!,
            toAccountId: _toAccountId!,
            amount: amount,
            reference: refNo,
            notes: desc),
      };
      if (!result.isOk) {
        if (mounted) showSnack(context, result.error, error: true);
        return;
      }
      refreshLists(ref);
      if (mounted) {
        showSnack(context, l.transactionRecorded);
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) showSnack(context, '${l.errorGeneric}\n$e', error: true);
    }
  }
}

import 'dart:convert';

import 'package:drift/drift.dart';

import '../core/money.dart';
import '../core/result.dart';
import '../core/units.dart';
import '../domain/accounting.dart';
import 'db.dart';

int _now() => DateTime.now().millisecondsSinceEpoch;
String _uid() =>
    '${DateTime.now().microsecondsSinceEpoch.toRadixString(36)}${(_seq++).toRadixString(36)}';
int _seq = 0;

/// Thrown inside a transaction when a balance check fails on freshly
/// re-read data. The calling method catches it and returns the same `Err`
/// it used to return, so a stale pre-transaction snapshot can never
/// approve an overdraw (C8).
class _InsufficientBalance implements Exception {
  const _InsufficientBalance();
}

/// Thrown inside a transaction when return validation fails on freshly
/// re-read data. The calling method catches it and returns its message
/// as an `Err` (C3).
class _ValidationFailed implements Exception {
  final String message;
  const _ValidationFailed(this.message);
}

/// All financial mutations go through this service, each inside ONE
/// database transaction. UI code must never update balances directly.
class AccountingService {
  final AppDatabase db;
  AccountingService(this.db);

  // ---------- parties ----------

  /// Next automatic party code for [kind] ('customer' | 'supplier'):
  /// max numeric code over ALL rows of that kind + 1, or '1' when none
  /// exist. Non-numeric codes are ignored. Inactive rows count too, so a
  /// deleted party's code is never handed out again (no duplicates).
  Future<String> nextPartyCode(String kind) async {
    final codes = kind == 'supplier'
        ? (await db.select(db.suppliers).get()).map((s) => s.code)
        : (await db.select(db.customers).get()).map((c) => c.code);
    var max = 0;
    for (final c in codes) {
      final n = int.tryParse(c.trim());
      if (n != null && n > max) max = n;
    }
    return '${max + 1}';
  }

  Future<String> createCustomer({
    required String name,
    String phone = '',
    String whatsapp = '',
    String address = '',
    String code = '',
    String businessName = '',
    String notes = '',
    Money openingBalance = Money.zero,
  }) async {
    final id = _uid();
    final now = _now();
    await db.transaction(() async {
      // Empty code = auto-assign inside the transaction, so two concurrent
      // creates can never receive the same code.
      final effectiveCode =
          code.trim().isEmpty ? await nextPartyCode('customer') : code.trim();
      await db.into(db.customers).insert(CustomersCompanion.insert(
            id: id, name: name, phone: Value(phone), whatsapp: Value(whatsapp),
            address: Value(address),
            code: Value(effectiveCode), businessName: Value(businessName),
            notes: Value(notes), openingBalance: Value(openingBalance.minor),
            // balance starts at 0; _postTxn applies the opening balance below
            balance: const Value(0),
            createdAt: now, updatedAt: now,
          ));
      if (!openingBalance.isZero) {
        await _postTxn(
          category: TxnCategory.openingBalance,
          amount: openingBalance.abs(),
          partyKind: 'customer', partyId: id,
          description: 'Opening balance — $name',
          apply: (b) => b + openingBalance,
          accountKind: 'customer', accountId: id,
        );
      }
    });
    return id;
  }

  Future<void> updateCustomer(String id,
      {String? name, String? phone, String? whatsapp, String? address, String? code,
       String? businessName, String? notes, bool? active, bool? isFavorite}) async {
    await (db.update(db.customers)..where((t) => t.id.equals(id))).write(
      CustomersCompanion(
        name: name == null ? const Value.absent() : Value(name),
        phone: phone == null ? const Value.absent() : Value(phone),
        whatsapp: whatsapp == null ? const Value.absent() : Value(whatsapp),
        address: address == null ? const Value.absent() : Value(address),
        code: code == null ? const Value.absent() : Value(code),
        businessName: businessName == null ? const Value.absent() : Value(businessName),
        notes: notes == null ? const Value.absent() : Value(notes),
        active: active == null ? const Value.absent() : Value(active),
        isFavorite: isFavorite == null ? const Value.absent() : Value(isFavorite),
        updatedAt: Value(_now()),
      ),
    );
  }

  Future<String> createSupplier({
    required String name,
    String phone = '',
    String whatsapp = '',
    String address = '',
    String code = '',
    String businessName = '',
    String notes = '',
    Money openingBalance = Money.zero,
  }) async {
    final id = _uid();
    final now = _now();
    await db.transaction(() async {
      // Empty code = auto-assign inside the transaction, so two concurrent
      // creates can never receive the same code.
      final effectiveCode =
          code.trim().isEmpty ? await nextPartyCode('supplier') : code.trim();
      await db.into(db.suppliers).insert(SuppliersCompanion.insert(
            id: id, name: name, phone: Value(phone), whatsapp: Value(whatsapp),
            address: Value(address),
            code: Value(effectiveCode), businessName: Value(businessName),
            notes: Value(notes), openingBalance: Value(openingBalance.minor),
            // balance starts at 0; _postTxn applies the opening balance below
            balance: const Value(0),
            createdAt: now, updatedAt: now,
          ));
      if (!openingBalance.isZero) {
        await _postTxn(
          category: TxnCategory.openingBalance,
          amount: openingBalance.abs(),
          partyKind: 'supplier', partyId: id,
          description: 'Opening balance — $name',
          apply: (b) => b + openingBalance,
          accountKind: 'supplier', accountId: id,
        );
      }
    });
    return id;
  }

  Future<void> updateSupplier(String id,
      {String? name, String? phone, String? whatsapp, String? address, String? code,
       String? businessName, String? notes, bool? active}) async {
    await (db.update(db.suppliers)..where((t) => t.id.equals(id))).write(
      SuppliersCompanion(
        name: name == null ? const Value.absent() : Value(name),
        phone: phone == null ? const Value.absent() : Value(phone),
        whatsapp: whatsapp == null ? const Value.absent() : Value(whatsapp),
        address: address == null ? const Value.absent() : Value(address),
        code: code == null ? const Value.absent() : Value(code),
        businessName: businessName == null ? const Value.absent() : Value(businessName),
        notes: notes == null ? const Value.absent() : Value(notes),
        active: active == null ? const Value.absent() : Value(active),
        updatedAt: Value(_now()),
      ),
    );
  }

  // ---------- customer reminders ("Tareekh Rakhein") ----------

  /// Add a payment reminder for a customer. Returns the reminder id.
  Future<int> addCustomerReminder({
    required String customerId,
    required DateTime remindAt,
    String note = '',
  }) async {
    return db.into(db.customerReminders).insert(CustomerRemindersCompanion.insert(
          customerId: customerId,
          remindAt: remindAt.millisecondsSinceEpoch,
          note: Value(note),
          createdAt: _now(),
        ));
  }

  /// Pending (not done) reminders, optionally for one customer, ordered by date.
  Future<List<CustomerReminder>> pendingReminders({String? customerId}) async {
    final q = db.select(db.customerReminders)
      ..where((t) =>
          t.done.equals(0) &
          (customerId == null
              ? const Constant(true)
              : t.customerId.equals(customerId)))
      ..orderBy([(t) => OrderingTerm.asc(t.remindAt)]);
    return q.get();
  }

  /// Overdue reminders (remindAt < now, not done).
  Future<List<CustomerReminder>> overdueReminders() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    return (db.select(db.customerReminders)
          ..where((t) => t.done.equals(0) & t.remindAt.isSmallerThanValue(now))
          ..orderBy([(t) => OrderingTerm.asc(t.remindAt)]))
        .get();
  }

  Future<void> markReminderDone(int id) async {
    await (db.update(db.customerReminders)..where((t) => t.id.equals(id)))
        .write(const CustomerRemindersCompanion(done: Value(1)));
  }

  Future<void> deleteReminder(int id) async {
    await (db.delete(db.customerReminders)..where((t) => t.id.equals(id))).go();
  }

  // ---------- udhaar & payments ----------

  /// Give udhaar: direct credit to customer (no invoice).
  Future<Result<String>> giveUdhaar({
    required String customerId,
    required Money amount,
    String description = '',
    String reference = '',
    int? date,
    List<String> imagePaths = const [],
  }) async {
    if (amount <= Money.zero) return const Err('Invalid amount');
    final customer = await _customer(customerId);
    if (customer == null) return const Err('Customer not found');
    final txnId = await db.transaction(() async {
      return _postTxn(
        category: TxnCategory.creditSale,
        amount: amount,
        partyKind: 'customer', partyId: customerId,
        description: description.isEmpty ? 'Udhaar — ${customer.name}' : description,
        reference: reference, date: date,
        apply: (b) => Accounting.applyCreditSale(b, amount),
        accountKind: 'customer', accountId: customerId,
        imagePaths: imagePaths,
      );
    });
    return Ok(txnId);
  }

  /// Receive payment from customer into a cash/bank account.
  Future<Result<String>> receivePayment({
    required String customerId,
    required Money amount,
    required String accountId,
    String method = 'cash',
    String reference = '',
    String notes = '',
    int? date,
    String? allocateInvoiceId,
    List<String> imagePaths = const [],
  }) async {
    if (amount <= Money.zero) return const Err('Invalid amount');
    // Fast pre-checks only; the authoritative reads happen inside the
    // transaction below (C8), so a concurrent update cannot be lost.
    final customer = await _customer(customerId);
    if (customer == null) return const Err('Customer not found');
    final account = await _account(accountId);
    if (account == null) return const Err('Account not found');
    final id = _uid();
    final ts = date ?? _now();
    await db.transaction(() async {
      final freshCustomer = (await _customer(customerId))!;
      final freshAccount = (await _account(accountId))!;
      // C9: document number consumed inside the transaction, so a
      // rollback cannot burn a number and a duplicate cannot escape.
      final paymentNo = await db.nextDocNo('payment');
      final newBal = Accounting.applyCustomerPayment(
          Money(freshCustomer.balance), amount);
      await db.into(db.payments).insert(PaymentsCompanion.insert(
        id: id, paymentNo: paymentNo, date: ts, direction: 'receive',
        partyKind: 'customer', partyId: customerId,
        amountMinor: amount.minor, accountId: accountId,
        method: Value(method), reference: Value(reference),
        notes: Value(notes), createdAt: _now(),
      ));
      await (db.update(db.customers)..where((t) => t.id.equals(customerId)))
          .write(CustomersCompanion(balance: Value(newBal.minor),
              updatedAt: Value(_now())));
      await (db.update(db.cashAccounts)..where((t) => t.id.equals(accountId)))
          .write(CashAccountsCompanion(
              balance: Value(freshAccount.balance + amount.minor)));
      final txnId = await _insertTxn(
        category: TxnCategory.customerPayment, amount: amount,
        partyKind: 'customer', partyId: customerId, method: method,
        reference: reference,
        description: 'Payment received — ${freshCustomer.name} ($paymentNo)',
        date: ts, imagePaths: imagePaths,
      );
      await _ledger(txnId, 'customer', customerId, Money.zero, amount,
          newBal, ts, 'Payment received');
      await _ledger(txnId, 'cash', accountId, amount, Money.zero,
          Money(freshAccount.balance + amount.minor), ts, 'Payment received');
      if (allocateInvoiceId != null) {
        await db.into(db.paymentAllocations).insert(
            PaymentAllocationsCompanion.insert(
                paymentId: id,
                invoiceKind: 'sale',
                invoiceId: allocateInvoiceId,
                amountMinor: amount.minor));
        await _applyToSaleInvoice(allocateInvoiceId, amount);
      }
    });
    return Ok(id);
  }

  /// Pay a supplier from a cash/bank account.
  Future<Result<String>> paySupplier({
    required String supplierId,
    required Money amount,
    required String accountId,
    String method = 'cash',
    String reference = '',
    String notes = '',
    int? date,
    String? allocateInvoiceId,
    List<String> imagePaths = const [],
  }) async {
    if (amount <= Money.zero) return const Err('Invalid amount');
    // Fast pre-checks only; balances and the sufficiency check are
    // re-done inside the transaction (C8/C9).
    final supplier = await _supplier(supplierId);
    if (supplier == null) return const Err('Supplier not found');
    final account = await _account(accountId);
    if (account == null) return const Err('Account not found');
    final id = _uid();
    final ts = date ?? _now();
    try {
      await db.transaction(() async {
        final freshSupplier = (await _supplier(supplierId))!;
        final freshAccount = (await _account(accountId))!;
        if (Money(freshAccount.balance) < amount) {
          throw const _InsufficientBalance();
        }
        final paymentNo = await db.nextDocNo('payment');
        final newBal = Accounting.applySupplierPayment(
            Money(freshSupplier.balance), amount);
        await db.into(db.payments).insert(PaymentsCompanion.insert(
          id: id, paymentNo: paymentNo, date: ts, direction: 'pay',
          partyKind: 'supplier', partyId: supplierId,
          amountMinor: amount.minor, accountId: accountId,
          method: Value(method), reference: Value(reference),
          notes: Value(notes), createdAt: _now(),
        ));
        await (db.update(db.suppliers)..where((t) => t.id.equals(supplierId)))
            .write(SuppliersCompanion(balance: Value(newBal.minor),
                updatedAt: Value(_now())));
        await (db.update(db.cashAccounts)..where((t) => t.id.equals(accountId)))
            .write(CashAccountsCompanion(
                balance: Value(freshAccount.balance - amount.minor)));
        final txnId = await _insertTxn(
          category: TxnCategory.supplierPayment, amount: amount,
          partyKind: 'supplier', partyId: supplierId, method: method,
          reference: reference,
          description:
              'Payment to supplier — ${freshSupplier.name} ($paymentNo)',
          date: ts, imagePaths: imagePaths,
        );
        await _ledger(txnId, 'supplier', supplierId, amount, Money.zero,
            newBal, ts, 'Supplier payment');
        await _ledger(txnId, 'cash', accountId, Money.zero, amount,
            Money(freshAccount.balance - amount.minor), ts, 'Supplier payment');
      if (allocateInvoiceId != null) {
        await db.into(db.paymentAllocations).insert(
            PaymentAllocationsCompanion.insert(
                paymentId: id,
                invoiceKind: 'purchase',
                invoiceId: allocateInvoiceId,
                amountMinor: amount.minor));
        await _applyToPurchaseInvoice(allocateInvoiceId, amount);
      }
      });
    } on _InsufficientBalance {
      return const Err('Insufficient account balance');
    }
    return Ok(id);
  }

  // ---------- sales ----------

  /// Short item reference for a party ledger leg, e.g. " (Oil ×2, Ghee ×1)".
  /// Shows at most two lines, then "+N more", so the ledger row stays short.
  Future<String> _itemSummary(List<SaleItemInput> items) async {
    if (items.isEmpty) return '';
    final ids = items.map((e) => e.productId).toSet().toList();
    final prods =
        await (db.select(db.products)..where((t) => t.id.isIn(ids))).get();
    final names = {for (final p in prods) p.id: p.name};
    final parts = items
        .map((it) => '${names[it.productId] ?? it.productId} ×${it.qty.display()}')
        .toList();
    final shown = parts.take(2).join(', ');
    final extra = parts.length - 2;
    return ' ($shown${extra > 0 ? ' +$extra more' : ''})';
  }

  Future<Result<String>> createSale({
    required String customerId,
    required List<SaleItemInput> items,
    Money discount = Money.zero,
    Money tax = Money.zero,
    Money paidNow = Money.zero,
    String? accountId,
    String method = 'cash',
    String notes = '',
    int? date,
  }) async {
    if (items.isEmpty) return const Err('Add at least one item');
    final customer = await _customer(customerId);
    if (customer == null) return const Err('Customer not found');
    if (paidNow > Money.zero && accountId == null) {
      return const Err('Select an account for the received amount');
    }
    // totals in minor units
    var subtotal = 0;
    for (final it in items) {
      final lineQty = it.qty;
      final lineTotal =
          (it.unitPriceMinor * lineQty.asDouble).round() - it.discountMinor;
      if (lineTotal < 0) return const Err('Line total cannot be negative');
      subtotal += lineTotal;
    }
    final total = subtotal - discount.minor + tax.minor;
    if (total < 0) return const Err('Total cannot be negative');
    if (paidNow.minor > total) {
      return const Err('Paid amount cannot exceed total');
    }
    // stock check
    final stockCheck = await _checkStock(items, isSale: true);
    if (!stockCheck.isOk) return Err(stockCheck.error);

    final id = _uid();
    final ts = date ?? _now();
    final itemSummary = await _itemSummary(items);
    await db.transaction(() async {
      // C9: invoice number consumed inside the transaction; C8: the
      // customer balance is re-read here, not taken from the pre-txn snapshot.
      final invoiceNo = await db.nextDocNo('sale');
      final freshCustomer = (await _customer(customerId))!;
      await db.into(db.salesInvoices).insert(SalesInvoicesCompanion.insert(
        id: id, invoiceNo: invoiceNo, customerId: customerId, date: ts,
        subtotalMinor: subtotal, discountMinor: Value(discount.minor),
        taxMinor: Value(tax.minor), totalMinor: total,
        paidMinor: Value(paidNow.minor),
        status: Value(_saleStatus(total, paidNow.minor, 0)),
        notes: Value(notes), createdAt: _now(),
      ));
      for (final it in items) {
        final lineTotal =
            (it.unitPriceMinor * it.qty.asDouble).round() - it.discountMinor;
        await db.into(db.salesInvoiceItems).insert(
            SalesInvoiceItemsCompanion.insert(
              invoiceId: id, productId: it.productId,
              qtyNum: it.qty.num, qtyDen: Value(it.qty.den),
              unitId: it.unitId, unitPriceMinor: it.unitPriceMinor,
              discountMinor: Value(it.discountMinor),
              lineTotalMinor: lineTotal,
            ));
        // stock out (base unit)
        final base = await _toBase(it.productId, it.unitId, it.qty);
        await db.into(db.inventoryMovements).insert(
            InventoryMovementsCompanion.insert(
              productId: it.productId, date: ts,
              qtyNum: -base.num, qtyDen: Value(base.den),
              movementType: 'sale', refKind: 'sale', refId: id,
              unitCostMinor: Value(0),
            ));
      }
      // customer balance += total
      final newCustBal =
          Accounting.applyCreditSale(Money(freshCustomer.balance), Money(total));
      await (db.update(db.customers)..where((t) => t.id.equals(customerId)))
          .write(CustomersCompanion(balance: Value(newCustBal.minor),
              updatedAt: Value(_now())));
      final txnId = await _insertTxn(
        category: paidNow.minor == total ? TxnCategory.cashSale : TxnCategory.creditSale,
        amount: Money(total), partyKind: 'customer', partyId: customerId,
        method: method, reference: invoiceNo,
        description: 'Sale $invoiceNo — ${freshCustomer.name}', date: ts,
      );
      await _ledger(txnId, 'customer', customerId, Money(total), Money.zero,
          newCustBal, ts, 'Sale $invoiceNo$itemSummary');
      if (paidNow > Money.zero) {
        final account = await _account(accountId!);
        if (account == null) throw StateError('Account not found');
        // H1: a paidNow receipt is a real Payment (+ allocation), exactly
        // as receivePayment writes one — otherwise dashboard receipts,
        // payment history and receipt PDFs all miss it.
        final paymentNo = await db.nextDocNo('payment');
        final payId = _uid();
        await db.into(db.payments).insert(PaymentsCompanion.insert(
          id: payId, paymentNo: paymentNo, date: ts, direction: 'receive',
          partyKind: 'customer', partyId: customerId,
          amountMinor: paidNow.minor, accountId: accountId,
          method: Value(method), reference: Value(invoiceNo),
          notes: const Value('Sale receipt'), createdAt: _now(),
        ));
        await db.into(db.paymentAllocations).insert(
            PaymentAllocationsCompanion.insert(
                paymentId: payId, invoiceKind: 'sale',
                invoiceId: id, amountMinor: paidNow.minor));
        await (db.update(db.cashAccounts)
              ..where((t) => t.id.equals(accountId)))
            .write(CashAccountsCompanion(
                balance: Value(account.balance + paidNow.minor)));
        final newCustBal2 = Accounting.applyCustomerPayment(
            newCustBal, paidNow);
        await (db.update(db.customers)..where((t) => t.id.equals(customerId)))
            .write(CustomersCompanion(balance: Value(newCustBal2.minor)));
        await _ledger(txnId, 'cash', accountId, paidNow, Money.zero,
            Money(account.balance + paidNow.minor), ts, 'Sale receipt $invoiceNo');
        await _ledger(txnId, 'customer', customerId, Money.zero, paidNow,
            newCustBal2, ts, 'Sale receipt $invoiceNo');
      }
    });
    return Ok(id);
  }

  // ---------- purchases ----------

  Future<Result<String>> createPurchase({
    required String supplierId,
    required List<SaleItemInput> items,
    Money discount = Money.zero,
    Money tax = Money.zero,
    Money paidNow = Money.zero,
    String? accountId,
    String method = 'cash',
    String notes = '',
    int? date,
  }) async {
    if (items.isEmpty) return const Err('Add at least one item');
    final supplier = await _supplier(supplierId);
    if (supplier == null) return const Err('Supplier not found');
    if (paidNow > Money.zero && accountId == null) {
      return const Err('Select an account for the paid amount');
    }
    var subtotal = 0;
    for (final it in items) {
      final lineTotal =
          (it.unitPriceMinor * it.qty.asDouble).round() - it.discountMinor;
      if (lineTotal < 0) return const Err('Line total cannot be negative');
      subtotal += lineTotal;
    }
    final total = subtotal - discount.minor + tax.minor;
    if (total < 0) return const Err('Total cannot be negative');
    if (paidNow.minor > total) {
      return const Err('Paid amount cannot exceed total');
    }
    if (paidNow > Money.zero) {
      final account = await _account(accountId!);
      if (account == null) return const Err('Account not found');
      // Sufficiency is re-checked on fresh data inside the transaction (C8);
      // the pre-txn read above is only an existence check.
    }
    final id = _uid();
    final ts = date ?? _now();
    final itemSummary = await _itemSummary(items);
    try {
      await db.transaction(() async {
        // C9: invoice number consumed inside the transaction; C8: the
        // supplier balance is re-read here, not from the pre-txn snapshot.
        final invoiceNo = await db.nextDocNo('purchase');
        final freshSupplier = (await _supplier(supplierId))!;
        await db.into(db.purchaseInvoices).insert(
            PurchaseInvoicesCompanion.insert(
        id: id, invoiceNo: invoiceNo, supplierId: supplierId, date: ts,
        subtotalMinor: subtotal, discountMinor: Value(discount.minor),
        taxMinor: Value(tax.minor), totalMinor: total,
        paidMinor: Value(paidNow.minor),
        status: Value(_saleStatus(total, paidNow.minor, 0)),
        notes: Value(notes), createdAt: _now(),
      ));
      for (final it in items) {
        final lineTotal =
            (it.unitPriceMinor * it.qty.asDouble).round() - it.discountMinor;
        await db.into(db.purchaseInvoiceItems).insert(
            PurchaseInvoiceItemsCompanion.insert(
              invoiceId: id, productId: it.productId,
              qtyNum: it.qty.num, qtyDen: Value(it.qty.den),
              unitId: it.unitId, unitPriceMinor: it.unitPriceMinor,
              discountMinor: Value(it.discountMinor),
              lineTotalMinor: lineTotal,
            ));
        final base = await _toBase(it.productId, it.unitId, it.qty);
        final unitCost = base.asDouble == 0
            ? 0
            : (lineTotal / base.asDouble).round();
        await db.into(db.inventoryMovements).insert(
            InventoryMovementsCompanion.insert(
              productId: it.productId, date: ts,
              qtyNum: base.num, qtyDen: Value(base.den),
              movementType: 'purchase', refKind: 'purchase', refId: id,
              unitCostMinor: Value(unitCost),
            ));
      }
      final newSupBal = Accounting.applyCreditPurchase(
          Money(freshSupplier.balance), Money(total));
      await (db.update(db.suppliers)..where((t) => t.id.equals(supplierId)))
          .write(SuppliersCompanion(balance: Value(newSupBal.minor),
              updatedAt: Value(_now())));
      final txnId = await _insertTxn(
        category: paidNow.minor == total ? TxnCategory.cashPurchase : TxnCategory.creditPurchase,
        amount: Money(total), partyKind: 'supplier', partyId: supplierId,
        method: method, reference: invoiceNo,
        description: 'Purchase $invoiceNo — ${freshSupplier.name}', date: ts,
      );
      // A credit purchase increases what we owe the supplier: it posts as a
      // CREDIT (LIYE) leg, not a debit. The payment leg below stays a debit.
      await _ledger(txnId, 'supplier', supplierId, Money.zero, Money(total),
          newSupBal, ts, 'Purchase $invoiceNo$itemSummary');
      if (paidNow > Money.zero) {
        final account = (await _account(accountId!))!;
        if (Money(account.balance) < paidNow) {
          throw const _InsufficientBalance();
        }
        // H1: a paidNow payment is a real Payment (+ allocation), exactly
        // as paySupplier writes one.
        final paymentNo = await db.nextDocNo('payment');
        final payId = _uid();
        await db.into(db.payments).insert(PaymentsCompanion.insert(
          id: payId, paymentNo: paymentNo, date: ts, direction: 'pay',
          partyKind: 'supplier', partyId: supplierId,
          amountMinor: paidNow.minor, accountId: accountId,
          method: Value(method), reference: Value(invoiceNo),
          notes: const Value('Purchase payment'), createdAt: _now(),
        ));
        await db.into(db.paymentAllocations).insert(
            PaymentAllocationsCompanion.insert(
                paymentId: payId, invoiceKind: 'purchase',
                invoiceId: id, amountMinor: paidNow.minor));
        await (db.update(db.cashAccounts)
              ..where((t) => t.id.equals(accountId)))
            .write(CashAccountsCompanion(
                balance: Value(account.balance - paidNow.minor)));
        final newSupBal2 =
            Accounting.applySupplierPayment(newSupBal, paidNow);
        await (db.update(db.suppliers)..where((t) => t.id.equals(supplierId)))
            .write(SuppliersCompanion(balance: Value(newSupBal2.minor)));
        await _ledger(txnId, 'cash', accountId, Money.zero, paidNow,
            Money(account.balance - paidNow.minor), ts, 'Purchase payment $invoiceNo');
        await _ledger(txnId, 'supplier', supplierId, paidNow, Money.zero,
            newSupBal2, ts, 'Purchase payment $invoiceNo');
      }
      });
    } on _InsufficientBalance {
      return const Err('Insufficient account balance');
    }
    return Ok(id);
  }

  // ---------- expenses / income / transfers ----------

  Future<Result<String>> recordExpense({
    required String category,
    required Money amount,
    required String accountId,
    String description = '',
    String reference = '',
    int? date,
    List<String> imagePaths = const [],
  }) async {
    if (amount <= Money.zero) return const Err('Invalid amount');
    final account = await _account(accountId);
    if (account == null) return const Err('Account not found');
    final ts = date ?? _now();
    String txnId;
    try {
      txnId = await db.transaction(() async {
        // C8: balance + sufficiency re-checked on fresh data inside the txn.
        final freshAccount = (await _account(accountId))!;
        if (Money(freshAccount.balance) < amount) {
          throw const _InsufficientBalance();
        }
        await db.into(db.expenses).insert(ExpensesCompanion.insert(
          date: ts, category: category, amountMinor: amount.minor,
          accountId: accountId, description: Value(description),
          reference: Value(reference), createdAt: _now(),
        ));
        await (db.update(db.cashAccounts)..where((t) => t.id.equals(accountId)))
            .write(CashAccountsCompanion(
                balance: Value(freshAccount.balance - amount.minor)));
        final id = await _insertTxn(
          category: TxnCategory.expense, amount: amount,
          description: description.isEmpty ? 'Expense — $category' : description,
          reference: reference, date: ts, imagePaths: imagePaths,
        );
        await _ledger(id, 'cash', accountId, Money.zero, amount,
            Money(freshAccount.balance - amount.minor), ts, 'Expense');
        await _ledger(id, 'expense', category, amount, Money.zero, amount,
            ts, 'Expense');
        return id;
      });
    } on _InsufficientBalance {
      return const Err('Insufficient account balance');
    }
    return Ok(txnId);
  }

  Future<Result<String>> recordIncome({
    required String category,
    required Money amount,
    required String accountId,
    String description = '',
    String reference = '',
    int? date,
    List<String> imagePaths = const [],
  }) async {
    if (amount <= Money.zero) return const Err('Invalid amount');
    final account = await _account(accountId);
    if (account == null) return const Err('Account not found');
    final ts = date ?? _now();
    final txnId = await db.transaction(() async {
      // C8: balance re-read inside the transaction.
      final freshAccount = (await _account(accountId))!;
      await db.into(db.incomeRecords).insert(IncomeRecordsCompanion.insert(
        date: ts, category: category, amountMinor: amount.minor,
        accountId: accountId, description: Value(description),
        reference: Value(reference), createdAt: _now(),
      ));
      await (db.update(db.cashAccounts)..where((t) => t.id.equals(accountId)))
          .write(CashAccountsCompanion(
              balance: Value(freshAccount.balance + amount.minor)));
      final id = await _insertTxn(
        category: TxnCategory.otherIncome, amount: amount,
        description: description.isEmpty ? 'Income — $category' : description,
        reference: reference, date: ts, imagePaths: imagePaths,
      );
      await _ledger(id, 'cash', accountId, amount, Money.zero,
          Money(freshAccount.balance + amount.minor), ts, 'Income');
      await _ledger(id, 'income', category, Money.zero, amount, amount,
          ts, 'Income');
      return id;
    });
    return Ok(txnId);
  }

  Future<Result<String>> transferFunds({
    required String fromAccountId,
    required String toAccountId,
    required Money amount,
    String reference = '',
    String notes = '',
    int? date,
  }) async {
    if (fromAccountId == toAccountId) {
      return const Err('Accounts must be different');
    }
    if (amount <= Money.zero) return const Err('Invalid amount');
    final from = await _account(fromAccountId);
    final to = await _account(toAccountId);
    if (from == null || to == null) return const Err('Account not found');
    final ts = date ?? _now();
    String txnId;
    try {
      txnId = await db.transaction(() async {
        // C8: both balances + the sufficiency check re-done on fresh data.
        final freshFrom = (await _account(fromAccountId))!;
        final freshTo = (await _account(toAccountId))!;
        if (Money(freshFrom.balance) < amount) {
          throw const _InsufficientBalance();
        }
        await db.into(db.accountTransfers).insert(
            AccountTransfersCompanion.insert(
          date: ts, fromAccountId: fromAccountId, toAccountId: toAccountId,
          amountMinor: amount.minor, reference: Value(reference),
          notes: Value(notes), createdAt: _now(),
        ));
        await (db.update(db.cashAccounts)
              ..where((t) => t.id.equals(fromAccountId)))
            .write(CashAccountsCompanion(
                balance: Value(freshFrom.balance - amount.minor)));
        await (db.update(db.cashAccounts)
              ..where((t) => t.id.equals(toAccountId)))
            .write(CashAccountsCompanion(
                balance: Value(freshTo.balance + amount.minor)));
        final id = await _insertTxn(
          category: TxnCategory.cashTransfer, amount: amount,
          reference: reference,
          description: notes.isEmpty
              ? 'Transfer ${freshFrom.name} → ${freshTo.name}'
              : notes,
          date: ts,
        );
        await _ledger(id, 'cash', fromAccountId, Money.zero, amount,
            Money(freshFrom.balance - amount.minor), ts, 'Transfer out');
        await _ledger(id, 'cash', toAccountId, amount, Money.zero,
            Money(freshTo.balance + amount.minor), ts, 'Transfer in');
        return id;
      });
    } on _InsufficientBalance {
      return const Err('Insufficient balance');
    }
    return Ok(txnId);
  }

  // ---------- production ----------

  Future<Result<String>> createProductionBatch({
    required List<ProductionIO> inputs,
    required List<ProductionIO> outputs,
    Money labourCost = Money.zero,
    Money electricityCost = Money.zero,
    Money otherCost = Money.zero,
    String notes = '',
    int? date,
  }) async {
    if (inputs.isEmpty) return const Err('Add raw materials');
    if (outputs.isEmpty) return const Err('Add finished outputs');
    // stock check on inputs
    for (final i in inputs) {
      final stock = await stockOf(i.productId);
      final need = await _toBase(i.productId, i.unitId, i.qty);
      if (Qty.of(stock.num, stock.den) < need) {
        final p = await _product(i.productId);
        return Err('Insufficient stock: ${p?.name ?? i.productId}');
      }
    }
    final id = _uid();
    final ts = date ?? _now();
    await db.transaction(() async {
      // C9: batch number consumed inside the transaction.
      final batchNo = await db.nextDocNo('batch');
      await db.into(db.productionBatches).insert(
          ProductionBatchesCompanion.insert(
        id: id, batchNo: batchNo, date: ts, notes: Value(notes),
        labourCostMinor: Value(labourCost.minor),
        electricityCostMinor: Value(electricityCost.minor),
        otherCostMinor: Value(otherCost.minor),
        createdAt: _now(),
      ));
      for (final i in inputs) {
        final base = await _toBase(i.productId, i.unitId, i.qty);
        await db.into(db.productionInputs).insert(
            ProductionInputsCompanion.insert(
              batchId: id, productId: i.productId,
              qtyNum: base.num, qtyDen: Value(base.den),
              unitCostMinor: Value(i.unitCostMinor),
            ));
        await db.into(db.inventoryMovements).insert(
            InventoryMovementsCompanion.insert(
              productId: i.productId, date: ts,
              qtyNum: -base.num, qtyDen: Value(base.den),
              movementType: 'production_in', refKind: 'production', refId: id,
              unitCostMinor: Value(i.unitCostMinor),
            ));
      }
      for (final o in outputs) {
        final base = await _toBase(o.productId, o.unitId, o.qty);
        await db.into(db.productionOutputs).insert(
            ProductionOutputsCompanion.insert(
              batchId: id, productId: o.productId,
              qtyNum: base.num, qtyDen: Value(base.den),
              unitCostMinor: Value(o.unitCostMinor),
            ));
        await db.into(db.inventoryMovements).insert(
            InventoryMovementsCompanion.insert(
              productId: o.productId, date: ts,
              qtyNum: base.num, qtyDen: Value(base.den),
              movementType: 'production_out', refKind: 'production', refId: id,
              unitCostMinor: Value(o.unitCostMinor),
            ));
      }
      await _insertTxn(
        category: TxnCategory.production, amount: Money.zero,
        reference: batchNo, description: 'Production $batchNo', date: ts,
      );
    });
    return Ok(id);
  }

  // ---------- returns ----------

  /// Sales return with validation + refund handling (C2, C3, C9).
  ///
  /// Validation (all inside the transaction, on fresh reads): items must
  /// belong to the invoice, return qty (base units, cumulative across
  /// earlier returns) must not exceed the sold qty, the return price must
  /// match an invoice line price, the total must not exceed the
  /// not-yet-returned invoice total, and the invoice must not be draft or
  /// cancelled.
  ///
  /// Refund: the part of the return that the customer already paid for is
  /// refunded in cash when [refundAccountId] is given — a `Payment` row
  /// (direction 'pay'), cash out, and `paidMinor` reduced by the refund.
  /// Without an account the refund stays on the customer's account as
  /// advance credit (negative balance), noted in the transaction
  /// description — never silently lost.
  Future<Result<String>> createSalesReturn({
    required String invoiceId,
    required List<ReturnItemInput> items,
    String notes = '',
    int? date,
    String? refundAccountId,
    String refundMethod = 'cash',
  }) async {
    final inv0 = await (db.select(db.salesInvoices)
          ..where((t) => t.id.equals(invoiceId)))
        .getSingleOrNull();
    if (inv0 == null) return const Err('Invoice not found');
    if (items.isEmpty) return const Err('Add items');
    final id = _uid();
    final ts = date ?? _now();
    try {
      return await db.transaction(() async {
        final inv = (await (db.select(db.salesInvoices)
              ..where((t) => t.id.equals(invoiceId)))
            .getSingleOrNull())!;
        if (inv.status == 'draft' || inv.status == 'cancelled') {
          throw const _ValidationFailed(
              'Cannot return items for a draft or cancelled invoice');
        }
        var total = 0;
        for (final it in items) {
          total += (it.unitPriceMinor * it.qty.asDouble).round();
        }
        // C2: returned total captured BEFORE the new row is inserted,
        // so the status math below counts this return exactly once.
        final prevReturned = await _salesReturnedTotal(invoiceId);
        final invoiced = await _invoicedBaseQty(invoiceId, true);
        final linePrices = await _invoiceLinePrices(invoiceId, true);
        final prevReturnIds = (await (db.select(db.salesReturns)
              ..where((t) => t.invoiceId.equals(invoiceId)))
            .get())
            .map((r) => r.id)
            .toList();
        final alreadyReturned =
            await _returnedBaseQty(prevReturnIds, 'sales_return');
        final validationError = await _validateReturnItems(
          invoiced: invoiced,
          alreadyReturned: alreadyReturned,
          linePrices: linePrices,
          items: items,
          invoiceTotalMinor: inv.totalMinor,
          prevReturnedMinor: prevReturned,
          total: total,
          qtyWord: 'sold',
        );
        if (validationError != null) {
          throw _ValidationFailed(validationError);
        }
        // C9: return number consumed inside the transaction.
        final returnNo = await db.nextDocNo('return');
        await db.into(db.salesReturns).insert(SalesReturnsCompanion.insert(
          id: id, returnNo: returnNo, invoiceId: invoiceId, date: ts,
          totalMinor: total, notes: Value(notes), createdAt: _now(),
        ));
        for (final it in items) {
          final line = (it.unitPriceMinor * it.qty.asDouble).round();
          await db.into(db.salesReturnItems).insert(
              SalesReturnItemsCompanion.insert(
                returnId: id, productId: it.productId,
                qtyNum: it.qty.num, qtyDen: Value(it.qty.den),
                unitPriceMinor: it.unitPriceMinor, lineTotalMinor: line,
              ));
          final base = await _toBase(it.productId, it.unitId, it.qty);
          await db.into(db.inventoryMovements).insert(
              InventoryMovementsCompanion.insert(
                productId: it.productId, date: ts,
                qtyNum: base.num, qtyDen: Value(base.den),
                movementType: 'sales_return', refKind: 'sales_return',
                refId: id,
              ));
        }
        final customer = (await _customer(inv.customerId))!;
        // Balance right after the return leg (before any refund leg).
        final balanceAfterReturn = Accounting.applySalesReturn(
            Money(customer.balance), Money(total));
        var newBal = balanceAfterReturn;
        await (db.update(db.customers)
              ..where((t) => t.id.equals(inv.customerId)))
            .write(CustomersCompanion(balance: Value(newBal.minor)));
        // C3 refund: the part of this return already paid for.
        final netOwedBefore = inv.totalMinor - prevReturned - inv.paidMinor;
        var refund = total - (netOwedBefore > 0 ? netOwedBefore : 0);
        if (refund < 0) refund = 0;
        if (refund > total) refund = total;
        var newPaid = inv.paidMinor;
        var refundIsCredit = false;
        if (refund > 0 && refundAccountId != null) {
          final account = await _account(refundAccountId);
          if (account == null) throw StateError('Account not found');
          if (Money(account.balance) < Money(refund)) {
            throw const _InsufficientBalance();
          }
          final paymentNo = await db.nextDocNo('payment');
          await db.into(db.payments).insert(PaymentsCompanion.insert(
            id: _uid(), paymentNo: paymentNo, date: ts, direction: 'pay',
            partyKind: 'customer', partyId: inv.customerId,
            amountMinor: refund, accountId: refundAccountId,
            method: Value(refundMethod), reference: Value(returnNo),
            notes: const Value('Sales return refund'), createdAt: _now(),
          ));
          await (db.update(db.cashAccounts)
                ..where((t) => t.id.equals(refundAccountId)))
              .write(CashAccountsCompanion(
                  balance: Value(account.balance - refund)));
          newBal = Money(newBal.minor + refund);
          await (db.update(db.customers)
                ..where((t) => t.id.equals(inv.customerId)))
              .write(CustomersCompanion(balance: Value(newBal.minor)));
          newPaid = inv.paidMinor - refund;
          final refundTxnId = await _insertTxn(
            category: TxnCategory.salesReturnRefund, amount: Money(refund),
            partyKind: 'customer', partyId: inv.customerId,
            method: refundMethod, reference: returnNo,
            description: 'Sales return refund $returnNo', date: ts,
          );
          await _ledger(refundTxnId, 'customer', inv.customerId,
              Money(refund), Money.zero, newBal, ts, 'Sales return refund');
          await _ledger(refundTxnId, 'cash', refundAccountId, Money.zero,
              Money(refund), Money(account.balance - refund), ts,
              'Sales return refund');
        } else if (refund > 0) {
          // No refund account: the refund stays as advance credit on the
          // customer's account (negative balance) — documented here and
          // in the transaction description below.
          refundIsCredit = true;
        }
        final newStatus =
            _saleStatus(inv.totalMinor, newPaid, prevReturned + total);
        await (db.update(db.salesInvoices)
              ..where((t) => t.id.equals(invoiceId)))
            .write(SalesInvoicesCompanion(
                paidMinor: Value(newPaid), status: Value(newStatus)));
        final txnId = await _insertTxn(
          category: TxnCategory.salesReturn, amount: Money(total),
          partyKind: 'customer', partyId: inv.customerId,
          reference: returnNo,
          description: 'Sales return $returnNo (${inv.invoiceNo})'
              '${refundIsCredit ? ' — refund held as advance credit' : ''}',
          date: ts,
        );
        // The return leg shows the post-return balance; a cash refund
        // has its own legs (above) moving the balance back up by +refund.
        await _ledger(txnId, 'customer', inv.customerId, Money.zero,
            Money(total), balanceAfterReturn, ts, 'Sales return $returnNo');
        return Ok(id);
      });
    } on _ValidationFailed catch (e) {
      return Err(e.message);
    } on _InsufficientBalance {
      return const Err('Insufficient account balance');
    }
  }

  /// Purchase return (C1): mirrors [createSalesReturn] — reduces the
  /// supplier payable, returns stock, updates the invoice status, and
  /// writes supplier + transaction/ledger rows. Same validation rules as
  /// sales returns. If the supplier was already paid for the returned
  /// goods, the balance goes negative (supplier owes us — advance);
  /// no cash refund is attempted here.
  Future<Result<String>> createPurchaseReturn({
    required String invoiceId,
    required List<ReturnItemInput> items,
    String notes = '',
    int? date,
  }) async {
    final inv0 = await (db.select(db.purchaseInvoices)
          ..where((t) => t.id.equals(invoiceId)))
        .getSingleOrNull();
    if (inv0 == null) return const Err('Invoice not found');
    if (items.isEmpty) return const Err('Add items');
    final id = _uid();
    final ts = date ?? _now();
    try {
      return await db.transaction(() async {
        final inv = (await (db.select(db.purchaseInvoices)
              ..where((t) => t.id.equals(invoiceId)))
            .getSingleOrNull())!;
        if (inv.status == 'draft' || inv.status == 'cancelled') {
          throw const _ValidationFailed(
              'Cannot return items for a draft or cancelled invoice');
        }
        var total = 0;
        for (final it in items) {
          total += (it.unitPriceMinor * it.qty.asDouble).round();
        }
        final prevReturned = await _purchaseReturnedTotal(invoiceId);
        final invoiced = await _invoicedBaseQty(invoiceId, false);
        final linePrices = await _invoiceLinePrices(invoiceId, false);
        final prevReturnIds = (await (db.select(db.purchaseReturns)
              ..where((t) => t.invoiceId.equals(invoiceId)))
            .get())
            .map((r) => r.id)
            .toList();
        final alreadyReturned =
            await _returnedBaseQty(prevReturnIds, 'purchase_return');
        final validationError = await _validateReturnItems(
          invoiced: invoiced,
          alreadyReturned: alreadyReturned,
          linePrices: linePrices,
          items: items,
          invoiceTotalMinor: inv.totalMinor,
          prevReturnedMinor: prevReturned,
          total: total,
          qtyWord: 'purchased',
        );
        if (validationError != null) {
          throw _ValidationFailed(validationError);
        }
        final returnNo = await db.nextDocNo('return');
        await db.into(db.purchaseReturns).insert(
            PurchaseReturnsCompanion.insert(
          id: id, returnNo: returnNo, invoiceId: invoiceId, date: ts,
          totalMinor: total, notes: Value(notes), createdAt: _now(),
        ));
        for (final it in items) {
          final line = (it.unitPriceMinor * it.qty.asDouble).round();
          await db.into(db.purchaseReturnItems).insert(
              PurchaseReturnItemsCompanion.insert(
                returnId: id, productId: it.productId,
                qtyNum: it.qty.num, qtyDen: Value(it.qty.den),
                unitPriceMinor: it.unitPriceMinor, lineTotalMinor: line,
              ));
          // Goods go back to the supplier: stock decreases (negative base).
          final base = await _toBase(it.productId, it.unitId, it.qty);
          await db.into(db.inventoryMovements).insert(
              InventoryMovementsCompanion.insert(
                productId: it.productId, date: ts,
                qtyNum: -base.num, qtyDen: Value(base.den),
                movementType: 'purchase_return', refKind: 'purchase_return',
                refId: id,
              ));
        }
        final supplier = (await _supplier(inv.supplierId))!;
        final newBal = Accounting.applyPurchaseReturn(
            Money(supplier.balance), Money(total));
        await (db.update(db.suppliers)
              ..where((t) => t.id.equals(inv.supplierId)))
            .write(SuppliersCompanion(balance: Value(newBal.minor)));
        final newStatus =
            _saleStatus(inv.totalMinor, inv.paidMinor, prevReturned + total);
        await (db.update(db.purchaseInvoices)
              ..where((t) => t.id.equals(invoiceId)))
            .write(PurchaseInvoicesCompanion(status: Value(newStatus)));
        final txnId = await _insertTxn(
          category: TxnCategory.purchaseReturn, amount: Money(total),
          partyKind: 'supplier', partyId: inv.supplierId,
          reference: returnNo,
          description: 'Purchase return $returnNo (${inv.invoiceNo})',
          date: ts,
        );
        // Payable down = debit leg for the supplier (mirror of the
        // purchase's credit leg).
        await _ledger(txnId, 'supplier', inv.supplierId, Money(total),
            Money.zero, newBal, ts, 'Purchase return $returnNo');
        return Ok(id);
      });
    } on _ValidationFailed catch (e) {
      return Err(e.message);
    }
  }

  // ---------- stock ----------

  /// Current stock of a product in base unit (rational num/den).
  Future<Qty> stockOf(String productId) async {
    final rows = await (db.select(db.inventoryMovements)
          ..where((t) => t.productId.equals(productId)))
        .get();
    var num = 0;
    var den = 1;
    for (final r in rows) {
      // num/den arithmetic with common denominator via Qty
      final cur = Qty.of(num, den);
      final add = Qty.of(r.qtyNum, r.qtyDen);
      final sum = cur + add;
      num = sum.num;
      den = sum.den;
    }
    return Qty.of(num, den);
  }

  /// Convert [qty] in [unitId] to the product's base unit.
  Future<Qty> _toBase(String productId, String unitId, Qty qty) async {
    final product = await _product(productId);
    if (product == null) return qty;
    if (product.baseUnitId == unitId) return qty;
    final conv = await (db.select(db.unitConversions)
          ..where((t) =>
              t.fromUnitId.equals(unitId) &
              t.toUnitId.equals(product.baseUnitId)))
        .getSingleOrNull();
    if (conv == null) {
      // try reverse
      final rev = await (db.select(db.unitConversions)
            ..where((t) =>
                t.fromUnitId.equals(product.baseUnitId) &
                t.toUnitId.equals(unitId)))
          .getSingleOrNull();
      if (rev == null) return qty; // unknown conversion: assume 1:1
      return qty.convert(rev.factorDen, rev.factorNum);
    }
    return qty.convert(conv.factorNum, conv.factorDen);
  }

  Future<Result<bool>> _checkStock(List<SaleItemInput> items,
      {required bool isSale}) async {
    if (!isSale) return const Ok(true);
    final settings = await _settings();
    final policy = settings?.negativeStock ?? 'warn';
    if (policy == 'allow') return const Ok(true);
    for (final it in items) {
      final stock = await stockOf(it.productId);
      final need = await _toBase(it.productId, it.unitId, it.qty);
      if (stock < need) {
        final p = await _product(it.productId);
        final msg = 'Insufficient stock: ${p?.name ?? it.productId} '
            '(have ${stock.display()}, need ${need.display()})';
        if (policy == 'block') return Err(msg);
        // warn: allow but caller may surface message — we allow here.
      }
    }
    return const Ok(true);
  }

  // ---------- helpers ----------

  Future<String> _postTxn({
    required String category,
    required Money amount,
    String? partyKind,
    String? partyId,
    String method = 'cash',
    String reference = '',
    required String description,
    int? date,
    required Money Function(Money balance) apply,
    required String accountKind,
    required String accountId,
    List<String> imagePaths = const [],
  }) async {
    final ts = date ?? _now();
    final txnId = await _insertTxn(
      category: category, amount: amount, partyKind: partyKind,
      partyId: partyId, method: method, reference: reference,
      description: description, date: ts, imagePaths: imagePaths,
    );
    // read current balance
    final cur = await _balanceOf(accountKind, accountId);
    final next = apply(cur);
    await _setBalance(accountKind, accountId, next);
    // Ledger direction follows the signed balance delta, not a fixed debit:
    // a balance increase means the party owes more. For a customer that is
    // DIYE (receivable up); for a supplier that is LIYE (payable up).
    // This keeps opening balances of either sign on the correct side.
    final delta = next.minor - cur.minor;
    final isDebit = accountKind == 'supplier' ? delta < 0 : delta > 0;
    await _ledger(
        txnId,
        accountKind,
        accountId,
        isDebit ? amount : Money.zero,
        isDebit ? Money.zero : amount,
        next,
        ts,
        description);
    return txnId;
  }

  Future<String> _insertTxn({
    required String category,
    required Money amount,
    String? partyKind,
    String? partyId,
    String method = 'cash',
    String reference = '',
    required String description,
    int? date,
    List<String> imagePaths = const [],
  }) async {
    final id = _uid();
    final txnNo = await db.nextDocNo('txn');
    await db.into(db.transactions).insert(TransactionsCompanion.insert(
      id: id, txnNumber: txnNo, date: date ?? _now(), category: category,
      amountMinor: amount.minor,
      partyKind: Value(partyKind), partyId: Value(partyId),
      paymentMethod: Value(method), reference: Value(reference),
      description: Value(description), createdAt: _now(),
      imagePaths: Value(jsonEncode(imagePaths)),
    ));
    return id;
  }

  Future<void> _ledger(String txnId, String accountKind, String accountId,
      Money debit, Money credit, Money balanceAfter, int date,
      String description) async {
    await db.into(db.ledgerEntries).insert(LedgerEntriesCompanion.insert(
      txnId: txnId, accountKind: accountKind, accountId: accountId,
      debitMinor: Value(debit.minor), creditMinor: Value(credit.minor),
      balanceAfterMinor: balanceAfter.minor, date: date,
      description: Value(description),
    ));
  }

  Future<Money> _balanceOf(String kind, String id) async {
    switch (kind) {
      case 'customer':
        final c = await _customer(id);
        return Money(c?.balance ?? 0);
      case 'supplier':
        final s = await _supplier(id);
        return Money(s?.balance ?? 0);
      case 'cash':
        final a = await _account(id);
        return Money(a?.balance ?? 0);
      default:
        return Money.zero;
    }
  }

  Future<void> _setBalance(String kind, String id, Money b) async {
    switch (kind) {
      case 'customer':
        await (db.update(db.customers)..where((t) => t.id.equals(id)))
            .write(CustomersCompanion(balance: Value(b.minor)));
      case 'supplier':
        await (db.update(db.suppliers)..where((t) => t.id.equals(id)))
            .write(SuppliersCompanion(balance: Value(b.minor)));
      case 'cash':
        await (db.update(db.cashAccounts)..where((t) => t.id.equals(id)))
            .write(CashAccountsCompanion(balance: Value(b.minor)));
    }
  }

  Future<Customer?> _customer(String id) =>
      (db.select(db.customers)..where((t) => t.id.equals(id)))
          .getSingleOrNull();
  Future<Supplier?> _supplier(String id) =>
      (db.select(db.suppliers)..where((t) => t.id.equals(id)))
          .getSingleOrNull();
  Future<CashAccount?> _account(String id) =>
      (db.select(db.cashAccounts)..where((t) => t.id.equals(id)))
          .getSingleOrNull();
  Future<Product?> _product(String id) =>
      (db.select(db.products)..where((t) => t.id.equals(id)))
          .getSingleOrNull();
  Future<BusinessSetting?> _settings() =>
      (db.select(db.businessSettings)..where((t) => t.id.equals(1)))
          .getSingleOrNull();

  Future<void> _applyToSaleInvoice(String invoiceId, Money amount) async {
    final inv = await (db.select(db.salesInvoices)
          ..where((t) => t.id.equals(invoiceId)))
        .getSingleOrNull();
    if (inv == null) return;
    final returned = await _salesReturnedTotal(invoiceId);
    final paid = inv.paidMinor + amount.minor;
    await (db.update(db.salesInvoices)
          ..where((t) => t.id.equals(invoiceId)))
        .write(SalesInvoicesCompanion(
            paidMinor: Value(paid),
            status: Value(_saleStatus(inv.totalMinor, paid, returned))));
  }

  Future<void> _applyToPurchaseInvoice(String invoiceId, Money amount) async {
    final inv = await (db.select(db.purchaseInvoices)
          ..where((t) => t.id.equals(invoiceId)))
        .getSingleOrNull();
    if (inv == null) return;
    final paid = inv.paidMinor + amount.minor;
    await (db.update(db.purchaseInvoices)
          ..where((t) => t.id.equals(invoiceId)))
        .write(PurchaseInvoicesCompanion(
            paidMinor: Value(paid),
            status: Value(_saleStatus(inv.totalMinor, paid, 0))));
  }

  Future<int> _salesReturnedTotal(String invoiceId) async {
    final rows = await (db.select(db.salesReturns)
          ..where((t) => t.invoiceId.equals(invoiceId)))
        .get();
    return rows.fold<int>(0, (a, r) => a + r.totalMinor);
  }

  Future<int> _purchaseReturnedTotal(String invoiceId) async {
    final rows = await (db.select(db.purchaseReturns)
          ..where((t) => t.invoiceId.equals(invoiceId)))
        .get();
    return rows.fold<int>(0, (a, r) => a + r.totalMinor);
  }

  /// Base-unit quantities invoiced for one invoice, per product.
  Future<Map<String, Qty>> _invoicedBaseQty(
      String invoiceId, bool isSale) async {
    final out = <String, Qty>{};
    if (isSale) {
      final lines = await (db.select(db.salesInvoiceItems)
            ..where((t) => t.invoiceId.equals(invoiceId)))
          .get();
      for (final l in lines) {
        final base =
            await _toBase(l.productId, l.unitId, Qty.of(l.qtyNum, l.qtyDen));
        out[l.productId] = (out[l.productId] ?? Qty.zero) + base;
      }
    } else {
      final lines = await (db.select(db.purchaseInvoiceItems)
            ..where((t) => t.invoiceId.equals(invoiceId)))
          .get();
      for (final l in lines) {
        final base =
            await _toBase(l.productId, l.unitId, Qty.of(l.qtyNum, l.qtyDen));
        out[l.productId] = (out[l.productId] ?? Qty.zero) + base;
      }
    }
    return out;
  }

  /// Invoice line unit prices per product (a product may appear on
  /// several lines at different prices).
  Future<Map<String, Set<int>>> _invoiceLinePrices(
      String invoiceId, bool isSale) async {
    final out = <String, Set<int>>{};
    if (isSale) {
      final lines = await (db.select(db.salesInvoiceItems)
            ..where((t) => t.invoiceId.equals(invoiceId)))
          .get();
      for (final l in lines) {
        (out[l.productId] ??= <int>{}).add(l.unitPriceMinor);
      }
    } else {
      final lines = await (db.select(db.purchaseInvoiceItems)
            ..where((t) => t.invoiceId.equals(invoiceId)))
          .get();
      for (final l in lines) {
        (out[l.productId] ??= <int>{}).add(l.unitPriceMinor);
      }
    }
    return out;
  }

  /// Base-unit quantities already returned for one invoice, per product.
  /// Read from inventory movements (which store base-converted quantities),
  /// because return-item rows store quantities in the return's own unit and
  /// carry no unitId to convert with. Purchase-return movements are
  /// negative, so the absolute value is used.
  Future<Map<String, Qty>> _returnedBaseQty(
      List<String> returnIds, String movementType) async {
    if (returnIds.isEmpty) return {};
    final rows = await (db.select(db.inventoryMovements)
          ..where((t) =>
              t.refId.isIn(returnIds) & t.movementType.equals(movementType)))
        .get();
    final out = <String, Qty>{};
    for (final r in rows) {
      var q = Qty.of(r.qtyNum, r.qtyDen);
      if (q.isNegative) q = -q;
      out[r.productId] = (out[r.productId] ?? Qty.zero) + q;
    }
    return out;
  }

  /// Validates return [items] against an invoice's lines and cumulative
  /// returns. Returns an error message, or null when valid. Callers run
  /// this INSIDE the transaction so the reads are authoritative (C3).
  Future<String?> _validateReturnItems({
    required Map<String, Qty> invoiced,
    required Map<String, Qty> alreadyReturned,
    required Map<String, Set<int>> linePrices,
    required List<ReturnItemInput> items,
    required int invoiceTotalMinor,
    required int prevReturnedMinor,
    required int total,
    required String qtyWord,
  }) async {
    if (items.isEmpty) return 'Add items';
    final requested = <String, Qty>{};
    for (final it in items) {
      if (it.qty <= Qty.zero) return 'Return quantity must be positive';
      if (!invoiced.containsKey(it.productId)) {
        return 'Item is not on this invoice';
      }
      if (!linePrices[it.productId]!.contains(it.unitPriceMinor)) {
        return 'Return price does not match invoice price';
      }
      final base = await _toBase(it.productId, it.unitId, it.qty);
      requested[it.productId] = (requested[it.productId] ?? Qty.zero) + base;
    }
    for (final e in requested.entries) {
      final already = alreadyReturned[e.key] ?? Qty.zero;
      if (already + e.value > invoiced[e.key]!) {
        return 'Return quantity exceeds $qtyWord quantity';
      }
    }
    if (total > invoiceTotalMinor - prevReturnedMinor) {
      return 'Return total exceeds invoice total';
    }
    return null;
  }

  String _saleStatus(int total, int paid, int returned) {
    final s = Accounting.invoiceStatus(
        Money(total), Money(paid), Money(returned));
    return switch (s) {
      InvoiceStatus.draft => 'draft',
      InvoiceStatus.unpaid => 'unpaid',
      InvoiceStatus.partiallyPaid => 'partially_paid',
      InvoiceStatus.paid => 'paid',
      InvoiceStatus.partiallyReturned => 'partially_returned',
      InvoiceStatus.returned => 'returned',
      InvoiceStatus.cancelled => 'cancelled',
    };
  }

  // ---------- products / accounts ----------

  Future<String> createProduct({
    required String name,
    required String category,
    required String baseUnitId,
    int purchasePriceMinor = 0,
    int salePriceMinor = 0,
    Qty reorderLevel = Qty.zero,
    Money openingStockValue = Money.zero,
    Qty openingStock = Qty.zero,
  }) async {
    final id = _uid();
    final now = _now();
    await db.transaction(() async {
      await db.into(db.products).insert(ProductsCompanion.insert(
        id: id, name: name, category: category, baseUnitId: baseUnitId,
        purchasePrice: Value(purchasePriceMinor),
        salePrice: Value(salePriceMinor),
        reorderNum: Value(reorderLevel.num),
        reorderDen: Value(reorderLevel.den),
        createdAt: now, updatedAt: now,
      ));
      if (!openingStock.isZero) {
        await db.into(db.inventoryMovements).insert(
            InventoryMovementsCompanion.insert(
              productId: id, date: now,
              qtyNum: openingStock.num, qtyDen: Value(openingStock.den),
              movementType: 'opening', refKind: 'product', refId: id,
            ));
      }
    });
    return id;
  }

  Future<String> createCashAccount(
      {required String name,
      required String type,
      Money openingBalance = Money.zero}) async {
    if (openingBalance.isNegative) {
      throw ArgumentError('Opening balance cannot be negative');
    }
    final id = _uid();
    await db.into(db.cashAccounts).insert(CashAccountsCompanion.insert(
      id: id, name: name, type: type,
      openingBalance: Value(openingBalance.minor),
      balance: Value(openingBalance.minor),
      createdAt: _now(),
    ));
    return id;
  }
}

/// Input for a sale/purchase line item.
class SaleItemInput {
  final String productId;
  final Qty qty;
  final String unitId;
  final int unitPriceMinor;
  final int discountMinor;
  SaleItemInput({
    required this.productId,
    required this.qty,
    required this.unitId,
    required this.unitPriceMinor,
    this.discountMinor = 0,
  });
}

class ProductionIO {
  final String productId;
  final Qty qty;
  final String unitId;
  final int unitCostMinor;
  ProductionIO({
    required this.productId,
    required this.qty,
    required this.unitId,
    this.unitCostMinor = 0,
  });
}

class ReturnItemInput {
  final String productId;
  final Qty qty;
  final String unitId;
  final int unitPriceMinor;
  ReturnItemInput({
    required this.productId,
    required this.qty,
    required this.unitId,
    required this.unitPriceMinor,
  });
}

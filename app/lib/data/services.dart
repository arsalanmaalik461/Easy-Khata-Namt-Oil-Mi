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

/// All financial mutations go through this service, each inside ONE
/// database transaction. UI code must never update balances directly.
class AccountingService {
  final AppDatabase db;
  AccountingService(this.db);

  // ---------- parties ----------

  Future<String> createCustomer({
    required String name,
    String phone = '',
    String address = '',
    String code = '',
    String businessName = '',
    String notes = '',
    Money openingBalance = Money.zero,
  }) async {
    final id = _uid();
    final now = _now();
    await db.transaction(() async {
      await db.into(db.customers).insert(CustomersCompanion.insert(
            id: id, name: name, phone: Value(phone), address: Value(address),
            code: Value(code), businessName: Value(businessName),
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
      {String? name, String? phone, String? address, String? code,
       String? businessName, String? notes, bool? active}) async {
    await (db.update(db.customers)..where((t) => t.id.equals(id))).write(
      CustomersCompanion(
        name: name == null ? const Value.absent() : Value(name),
        phone: phone == null ? const Value.absent() : Value(phone),
        address: address == null ? const Value.absent() : Value(address),
        code: code == null ? const Value.absent() : Value(code),
        businessName: businessName == null ? const Value.absent() : Value(businessName),
        notes: notes == null ? const Value.absent() : Value(notes),
        active: active == null ? const Value.absent() : Value(active),
        updatedAt: Value(_now()),
      ),
    );
  }

  Future<String> createSupplier({
    required String name,
    String phone = '',
    String address = '',
    String code = '',
    String businessName = '',
    String notes = '',
    Money openingBalance = Money.zero,
  }) async {
    final id = _uid();
    final now = _now();
    await db.transaction(() async {
      await db.into(db.suppliers).insert(SuppliersCompanion.insert(
            id: id, name: name, phone: Value(phone), address: Value(address),
            code: Value(code), businessName: Value(businessName),
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
      {String? name, String? phone, String? address, String? code,
       String? businessName, String? notes, bool? active}) async {
    await (db.update(db.suppliers)..where((t) => t.id.equals(id))).write(
      SuppliersCompanion(
        name: name == null ? const Value.absent() : Value(name),
        phone: phone == null ? const Value.absent() : Value(phone),
        address: address == null ? const Value.absent() : Value(address),
        code: code == null ? const Value.absent() : Value(code),
        businessName: businessName == null ? const Value.absent() : Value(businessName),
        notes: notes == null ? const Value.absent() : Value(notes),
        active: active == null ? const Value.absent() : Value(active),
        updatedAt: Value(_now()),
      ),
    );
  }

  // ---------- udhaar & payments ----------

  /// Give udhaar: direct credit to customer (no invoice).
  Future<Result<String>> giveUdhaar({
    required String customerId,
    required Money amount,
    String description = '',
    String reference = '',
    int? date,
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
  }) async {
    if (amount <= Money.zero) return const Err('Invalid amount');
    final customer = await _customer(customerId);
    if (customer == null) return const Err('Customer not found');
    final account = await _account(accountId);
    if (account == null) return const Err('Account not found');
    final paymentNo = await db.nextDocNo('payment');
    final id = _uid();
    final ts = date ?? _now();
    await db.transaction(() async {
      final newBal = Accounting.applyCustomerPayment(
          Money(customer.balance), amount);
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
              balance: Value(account.balance + amount.minor)));
      final txnId = await _insertTxn(
        category: TxnCategory.customerPayment, amount: amount,
        partyKind: 'customer', partyId: customerId, method: method,
        reference: reference,
        description: 'Payment received — ${customer.name} ($paymentNo)',
        date: ts,
      );
      await _ledger(txnId, 'customer', customerId, Money.zero, amount,
          newBal, ts, 'Payment received');
      await _ledger(txnId, 'cash', accountId, amount, Money.zero,
          Money(account.balance + amount.minor), ts, 'Payment received');
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
  }) async {
    if (amount <= Money.zero) return const Err('Invalid amount');
    final supplier = await _supplier(supplierId);
    if (supplier == null) return const Err('Supplier not found');
    final account = await _account(accountId);
    if (account == null) return const Err('Account not found');
    if (Money(account.balance) < amount) {
      return const Err('Insufficient account balance');
    }
    final paymentNo = await db.nextDocNo('payment');
    final id = _uid();
    final ts = date ?? _now();
    await db.transaction(() async {
      final newBal = Accounting.applySupplierPayment(
          Money(supplier.balance), amount);
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
              balance: Value(account.balance - amount.minor)));
      final txnId = await _insertTxn(
        category: TxnCategory.supplierPayment, amount: amount,
        partyKind: 'supplier', partyId: supplierId, method: method,
        reference: reference,
        description: 'Payment to supplier — ${supplier.name} ($paymentNo)',
        date: ts,
      );
      await _ledger(txnId, 'supplier', supplierId, amount, Money.zero,
          newBal, ts, 'Supplier payment');
      await _ledger(txnId, 'cash', accountId, Money.zero, amount,
          Money(account.balance - amount.minor), ts, 'Supplier payment');
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
    return Ok(id);
  }

  // ---------- sales ----------

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

    final invoiceNo = await db.nextDocNo('sale');
    final id = _uid();
    final ts = date ?? _now();
    await db.transaction(() async {
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
          Accounting.applyCreditSale(Money(customer.balance), Money(total));
      await (db.update(db.customers)..where((t) => t.id.equals(customerId)))
          .write(CustomersCompanion(balance: Value(newCustBal.minor),
              updatedAt: Value(_now())));
      final txnId = await _insertTxn(
        category: paidNow.minor == total ? TxnCategory.cashSale : TxnCategory.creditSale,
        amount: Money(total), partyKind: 'customer', partyId: customerId,
        method: method, reference: invoiceNo,
        description: 'Sale $invoiceNo — ${customer.name}', date: ts,
      );
      await _ledger(txnId, 'customer', customerId, Money(total), Money.zero,
          newCustBal, ts, 'Sale $invoiceNo');
      if (paidNow > Money.zero) {
        final account = await _account(accountId!);
        if (account == null) throw StateError('Account not found');
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
      if (Money(account.balance) < paidNow) {
        return const Err('Insufficient account balance');
      }
    }
    final invoiceNo = await db.nextDocNo('purchase');
    final id = _uid();
    final ts = date ?? _now();
    await db.transaction(() async {
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
          Money(supplier.balance), Money(total));
      await (db.update(db.suppliers)..where((t) => t.id.equals(supplierId)))
          .write(SuppliersCompanion(balance: Value(newSupBal.minor),
              updatedAt: Value(_now())));
      final txnId = await _insertTxn(
        category: paidNow.minor == total ? TxnCategory.cashPurchase : TxnCategory.creditPurchase,
        amount: Money(total), partyKind: 'supplier', partyId: supplierId,
        method: method, reference: invoiceNo,
        description: 'Purchase $invoiceNo — ${supplier.name}', date: ts,
      );
      await _ledger(txnId, 'supplier', supplierId, Money(total), Money.zero,
          newSupBal, ts, 'Purchase $invoiceNo');
      if (paidNow > Money.zero) {
        final account = (await _account(accountId!))!;
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
  }) async {
    if (amount <= Money.zero) return const Err('Invalid amount');
    final account = await _account(accountId);
    if (account == null) return const Err('Account not found');
    if (Money(account.balance) < amount) {
      return const Err('Insufficient account balance');
    }
    final ts = date ?? _now();
    final txnId = await db.transaction(() async {
      await db.into(db.expenses).insert(ExpensesCompanion.insert(
        date: ts, category: category, amountMinor: amount.minor,
        accountId: accountId, description: Value(description),
        reference: Value(reference), createdAt: _now(),
      ));
      await (db.update(db.cashAccounts)..where((t) => t.id.equals(accountId)))
          .write(CashAccountsCompanion(
              balance: Value(account.balance - amount.minor)));
      final id = await _insertTxn(
        category: TxnCategory.expense, amount: amount,
        description: description.isEmpty ? 'Expense — $category' : description,
        reference: reference, date: ts,
      );
      await _ledger(id, 'cash', accountId, Money.zero, amount,
          Money(account.balance - amount.minor), ts, 'Expense');
      await _ledger(id, 'expense', category, amount, Money.zero, amount,
          ts, 'Expense');
      return id;
    });
    return Ok(txnId);
  }

  Future<Result<String>> recordIncome({
    required String category,
    required Money amount,
    required String accountId,
    String description = '',
    String reference = '',
    int? date,
  }) async {
    if (amount <= Money.zero) return const Err('Invalid amount');
    final account = await _account(accountId);
    if (account == null) return const Err('Account not found');
    final ts = date ?? _now();
    final txnId = await db.transaction(() async {
      await db.into(db.incomeRecords).insert(IncomeRecordsCompanion.insert(
        date: ts, category: category, amountMinor: amount.minor,
        accountId: accountId, description: Value(description),
        reference: Value(reference), createdAt: _now(),
      ));
      await (db.update(db.cashAccounts)..where((t) => t.id.equals(accountId)))
          .write(CashAccountsCompanion(
              balance: Value(account.balance + amount.minor)));
      final id = await _insertTxn(
        category: TxnCategory.otherIncome, amount: amount,
        description: description.isEmpty ? 'Income — $category' : description,
        reference: reference, date: ts,
      );
      await _ledger(id, 'cash', accountId, amount, Money.zero,
          Money(account.balance + amount.minor), ts, 'Income');
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
    if (Money(from.balance) < amount) {
      return const Err('Insufficient balance');
    }
    final ts = date ?? _now();
    final txnId = await db.transaction(() async {
      await db.into(db.accountTransfers).insert(
          AccountTransfersCompanion.insert(
        date: ts, fromAccountId: fromAccountId, toAccountId: toAccountId,
        amountMinor: amount.minor, reference: Value(reference),
        notes: Value(notes), createdAt: _now(),
      ));
      await (db.update(db.cashAccounts)
            ..where((t) => t.id.equals(fromAccountId)))
          .write(CashAccountsCompanion(
              balance: Value(from.balance - amount.minor)));
      await (db.update(db.cashAccounts)
            ..where((t) => t.id.equals(toAccountId)))
          .write(CashAccountsCompanion(
              balance: Value(to.balance + amount.minor)));
      final id = await _insertTxn(
        category: TxnCategory.cashTransfer, amount: amount,
        reference: reference,
        description: notes.isEmpty
            ? 'Transfer ${from.name} → ${to.name}'
            : notes,
        date: ts,
      );
      await _ledger(id, 'cash', fromAccountId, Money.zero, amount,
          Money(from.balance - amount.minor), ts, 'Transfer out');
      await _ledger(id, 'cash', toAccountId, amount, Money.zero,
          Money(to.balance + amount.minor), ts, 'Transfer in');
      return id;
    });
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
    final batchNo = await db.nextDocNo('batch');
    final id = _uid();
    final ts = date ?? _now();
    await db.transaction(() async {
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

  Future<Result<String>> createSalesReturn({
    required String invoiceId,
    required List<ReturnItemInput> items,
    String notes = '',
    int? date,
  }) async {
    final inv = await (db.select(db.salesInvoices)
          ..where((t) => t.id.equals(invoiceId)))
        .getSingleOrNull();
    if (inv == null) return const Err('Invoice not found');
    if (items.isEmpty) return const Err('Add items');
    var total = 0;
    for (final it in items) {
      total += (it.unitPriceMinor * it.qty.asDouble).round();
    }
    final returnNo = await db.nextDocNo('return');
    final id = _uid();
    final ts = date ?? _now();
    await db.transaction(() async {
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
              movementType: 'sales_return', refKind: 'sales_return', refId: id,
            ));
      }
      final customer = (await _customer(inv.customerId))!;
      final newBal = Accounting.applySalesReturn(
          Money(customer.balance), Money(total));
      await (db.update(db.customers)
            ..where((t) => t.id.equals(inv.customerId)))
          .write(CustomersCompanion(balance: Value(newBal.minor)));
      final prevReturned = await _salesReturnedTotal(invoiceId);
      final newStatus =
          _saleStatus(inv.totalMinor, inv.paidMinor, prevReturned + total);
      await (db.update(db.salesInvoices)
            ..where((t) => t.id.equals(invoiceId)))
          .write(SalesInvoicesCompanion(status: Value(newStatus)));
      final txnId = await _insertTxn(
        category: TxnCategory.salesReturn, amount: Money(total),
        partyKind: 'customer', partyId: inv.customerId,
        reference: returnNo,
        description: 'Sales return $returnNo (${inv.invoiceNo})', date: ts,
      );
      await _ledger(txnId, 'customer', inv.customerId, Money.zero,
          Money(total), newBal, ts, 'Sales return $returnNo');
    });
    return Ok(id);
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
  }) async {
    final ts = date ?? _now();
    final txnId = await _insertTxn(
      category: category, amount: amount, partyKind: partyKind,
      partyId: partyId, method: method, reference: reference,
      description: description, date: ts,
    );
    // read current balance
    final cur = await _balanceOf(accountKind, accountId);
    final next = apply(cur);
    await _setBalance(accountKind, accountId, next);
    await _ledger(txnId, accountKind, accountId, amount, Money.zero, next, ts,
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
  }) async {
    final id = _uid();
    final txnNo = await db.nextDocNo('txn');
    await db.into(db.transactions).insert(TransactionsCompanion.insert(
      id: id, txnNumber: txnNo, date: date ?? _now(), category: category,
      amountMinor: amount.minor,
      partyKind: Value(partyKind), partyId: Value(partyId),
      paymentMethod: Value(method), reference: Value(reference),
      description: Value(description), createdAt: _now(),
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

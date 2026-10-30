import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:test/test.dart';
import 'package:namt_oil_mil/core/money.dart';
import 'package:namt_oil_mil/core/units.dart';
import 'package:namt_oil_mil/data/db.dart';
import 'package:namt_oil_mil/data/reports.dart';
import 'package:namt_oil_mil/data/services.dart';

/// Team D: release-blocker ledger fixes (C1, C2, C3, C8, C9, H1).
AppDatabase _testDb() {
  return AppDatabase.forTesting(
      NativeDatabase.memory(logStatements: false));
}

Future<String> _seedProduct(AppDatabase db, String name, int price) async {
  final svc = AccountingService(db);
  return svc.createProduct(
      name: name,
      category: 'raw',
      baseUnitId: 'kg',
      purchasePriceMinor: price,
      salePriceMinor: price);
}

Future<int> _nowPlus() =>
    Future.value(DateTime.now().millisecondsSinceEpoch + 1);

Future<Customer> _customer(AppDatabase db, String id) async =>
    (await (db.select(db.customers)..where((t) => t.id.equals(id))).get())
        .single;

Future<Supplier> _supplier(AppDatabase db, String id) async =>
    (await (db.select(db.suppliers)..where((t) => t.id.equals(id))).get())
        .single;

Future<CashAccount> _account(AppDatabase db, String id) async =>
    (await (db.select(db.cashAccounts)..where((t) => t.id.equals(id))).get())
        .single;

Future<SalesInvoice> _sale(AppDatabase db, String id) async =>
    (await (db.select(db.salesInvoices)..where((t) => t.id.equals(id))).get())
        .single;

Future<PurchaseInvoice> _purchase(AppDatabase db, String id) async =>
    (await (db.select(db.purchaseInvoices)
          ..where((t) => t.id.equals(id)))
        .get())
        .single;

void main() {
  group('Team D: C1 purchase returns', () {
    test('return reduces payable, returns stock, updates status + ledger',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final supId = await svc.createSupplier(name: 'Test Supplier');
      final prodId = await _seedProduct(db, 'Mustard Seed', 20000);

      final pur = await svc.createPurchase(
        supplierId: supId,
        items: [
          SaleItemInput(
              productId: prodId,
              qty: Qty.of(10),
              unitId: 'kg',
              unitPriceMinor: 20000),
        ],
      );
      expect(pur.isOk, true);
      expect((await svc.stockOf(prodId)), Qty.of(10));
      expect((await _supplier(db, supId)).balance, 200000);

      final ret = await svc.createPurchaseReturn(
        invoiceId: pur.value,
        items: [
          ReturnItemInput(
              productId: prodId,
              qty: Qty.of(4),
              unitId: 'kg',
              unitPriceMinor: 20000),
        ],
      );
      expect(ret.isOk, true);

      // Payable reduced by the returned value.
      expect((await _supplier(db, supId)).balance, 120000);
      // Stock returned to the supplier.
      expect((await svc.stockOf(prodId)), Qty.of(6));
      // Invoice status reflects the partial return.
      expect((await _purchase(db, pur.value)).status, 'partially_returned');
      // Supplier ledger leg is a debit (payable down), not a credit.
      final rep = ReportService(db);
      final ledger =
          await rep.partyLedger('supplier', supId, 0, await _nowPlus());
      expect(ledger.last.debitMinor, 80000);
      expect(ledger.last.creditMinor, 0);
      expect(ledger.last.balanceAfterMinor, 120000);
      // Return row persisted.
      final rows = await (db.select(db.purchaseReturns)
            ..where((t) => t.invoiceId.equals(pur.value)))
          .get();
      expect(rows.single.totalMinor, 80000);
    });

    test('purchase return rejects over-returns and wrong prices', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final supId = await svc.createSupplier(name: 'Test Supplier');
      final prodId = await _seedProduct(db, 'Mustard Seed', 20000);
      final pur = await svc.createPurchase(
        supplierId: supId,
        items: [
          SaleItemInput(
              productId: prodId,
              qty: Qty.of(10),
              unitId: 'kg',
              unitPriceMinor: 20000),
        ],
      );
      expect(pur.isOk, true);

      final over = await svc.createPurchaseReturn(
        invoiceId: pur.value,
        items: [
          ReturnItemInput(
              productId: prodId,
              qty: Qty.of(11),
              unitId: 'kg',
              unitPriceMinor: 20000),
        ],
      );
      expect(over.isOk, false);

      final wrongPrice = await svc.createPurchaseReturn(
        invoiceId: pur.value,
        items: [
          ReturnItemInput(
              productId: prodId,
              qty: Qty.of(1),
              unitId: 'kg',
              unitPriceMinor: 19000),
        ],
      );
      expect(wrongPrice.isOk, false);
      // Rejected returns changed nothing.
      expect((await _supplier(db, supId)).balance, 200000);
      expect((await svc.stockOf(prodId)), Qty.of(10));
    });
  });

  group('Team D: C2 sales-return status counts the return once', () {
    test('a 60% return of a part-paid sale is partially_returned, not returned',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'Test Customer');
      final prodId = await _seedProduct(db, 'Oil', 10000);
      final sale = await svc.createSale(
        customerId: custId,
        items: [
          SaleItemInput(
              productId: prodId,
              qty: Qty.of(10),
              unitId: 'kg',
              unitPriceMinor: 10000),
        ],
        paidNow: const Money(30000),
        accountId: 'cash-1',
      );
      expect(sale.isOk, true);

      // Correct returned total is 60000 (< total 100000). The old code
      // queried the returned total AFTER inserting, then added the new
      // return again (120000 >= total) and marked the invoice 'returned'.
      final ret = await svc.createSalesReturn(
        invoiceId: sale.value,
        items: [
          ReturnItemInput(
              productId: prodId,
              qty: Qty.of(6),
              unitId: 'kg',
              unitPriceMinor: 10000),
        ],
      );
      expect(ret.isOk, true);
      expect((await _sale(db, sale.value)).status, 'partially_returned');
    });
  });

  group('Team D: C3 sales-return validation and refunds', () {
    Future<(AccountingService, String, String, String)> _setupSale(
        AppDatabase db, Money paidNow) async {
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'Test Customer');
      final prodId = await _seedProduct(db, 'Oil', 10000);
      final sale = await svc.createSale(
        customerId: custId,
        items: [
          SaleItemInput(
              productId: prodId,
              qty: Qty.of(10),
              unitId: 'kg',
              unitPriceMinor: 10000),
        ],
        paidNow: paidNow,
        accountId: paidNow > Money.zero ? 'cash-1' : null,
      );
      expect(sale.isOk, true);
      return (svc, custId, prodId, sale.value);
    }

    test('over-return, wrong price, foreign item, cancelled invoice rejected',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final (svc, custId, prodId, saleId) =
          await _setupSale(db, Money.zero);
      final otherProd = await _seedProduct(db, 'Ghee', 5000);

      expect(
          (await svc.createSalesReturn(
            invoiceId: saleId,
            items: [
              ReturnItemInput(
                  productId: prodId,
                  qty: Qty.of(11),
                  unitId: 'kg',
                  unitPriceMinor: 10000),
            ],
          ))
              .isOk,
          false);
      expect(
          (await svc.createSalesReturn(
            invoiceId: saleId,
            items: [
              ReturnItemInput(
                  productId: prodId,
                  qty: Qty.of(1),
                  unitId: 'kg',
                  unitPriceMinor: 9000),
            ],
          ))
              .isOk,
          false);
      expect(
          (await svc.createSalesReturn(
            invoiceId: saleId,
            items: [
              ReturnItemInput(
                  productId: otherProd,
                  qty: Qty.of(1),
                  unitId: 'kg',
                  unitPriceMinor: 5000),
            ],
          ))
              .isOk,
          false);
      // Cumulative: 6 ok, then 5 more exceeds the 10 sold.
      expect(
          (await svc.createSalesReturn(
            invoiceId: saleId,
            items: [
              ReturnItemInput(
                  productId: prodId,
                  qty: Qty.of(6),
                  unitId: 'kg',
                  unitPriceMinor: 10000),
            ],
          ))
              .isOk,
          true);
      expect(
          (await svc.createSalesReturn(
            invoiceId: saleId,
            items: [
              ReturnItemInput(
                  productId: prodId,
                  qty: Qty.of(5),
                  unitId: 'kg',
                  unitPriceMinor: 10000),
            ],
          ))
              .isOk,
          false);
      expect((await _customer(db, custId)).balance, 40000);

      // Cancelled invoice rejects returns.
      await (db.update(db.salesInvoices)
            ..where((t) => t.id.equals(saleId)))
          .write(const SalesInvoicesCompanion(status: Value('cancelled')));
      expect(
          (await svc.createSalesReturn(
            invoiceId: saleId,
            items: [
              ReturnItemInput(
                  productId: prodId,
                  qty: Qty.of(1),
                  unitId: 'kg',
                  unitPriceMinor: 10000),
            ],
          ))
              .isOk,
          false);
    });

    test('fully-paid return with an account refunds cash + cuts paidMinor',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final (svc, custId, prodId, saleId) =
          await _setupSale(db, const Money(100000));
      expect((await _account(db, 'cash-1')).balance, 100000);

      final ret = await svc.createSalesReturn(
        invoiceId: saleId,
        items: [
          ReturnItemInput(
              productId: prodId,
              qty: Qty.of(4),
              unitId: 'kg',
              unitPriceMinor: 10000),
        ],
        refundAccountId: 'cash-1',
      );
      expect(ret.isOk, true);
      // Cash handed back, customer square, paidMinor net of the refund.
      expect((await _account(db, 'cash-1')).balance, 60000);
      expect((await _customer(db, custId)).balance, 0);
      final inv = await _sale(db, saleId);
      expect(inv.paidMinor, 60000);
      expect(inv.status, 'partially_returned');
      final pays = await (db.select(db.payments)
            ..where((t) =>
                t.partyId.equals(custId) & t.direction.equals('pay')))
          .get();
      expect(pays.single.amountMinor, 40000);
      expect(pays.single.reference, isNotEmpty);
    });

    test('fully-paid return without an account stays as advance credit',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final (svc, custId, prodId, saleId) =
          await _setupSale(db, const Money(100000));

      final ret = await svc.createSalesReturn(
        invoiceId: saleId,
        items: [
          ReturnItemInput(
              productId: prodId,
              qty: Qty.of(4),
              unitId: 'kg',
              unitPriceMinor: 10000),
        ],
      );
      expect(ret.isOk, true);
      // Negative balance = we owe the customer (advance credit); no
      // cash row was invented.
      expect((await _customer(db, custId)).balance, -40000);
      final pays = await (db.select(db.payments)
            ..where((t) =>
                t.partyId.equals(custId) & t.direction.equals('pay')))
          .get();
      expect(pays, isEmpty);
    });
  });

  group('Team D: C8 balances are computed inside the transaction', () {
    test('two concurrent receipts both apply (no lost update)', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'Test Customer');
      final udhaar = await svc.giveUdhaar(
          customerId: custId, amount: const Money(100000));
      expect(udhaar.isOk, true);

      // Both calls snapshot nothing before their transaction: each
      // re-reads the balance inside it, so neither overwrites the other.
      final results = await Future.wait([
        svc.receivePayment(
            customerId: custId,
            amount: const Money(20000),
            accountId: 'cash-1'),
        svc.receivePayment(
            customerId: custId,
            amount: const Money(30000),
            accountId: 'cash-1'),
      ]);
      expect(results.every((r) => r.isOk), true);
      expect((await _customer(db, custId)).balance, 50000);
      expect((await _account(db, 'cash-1')).balance, 50000);
    });

    test('two concurrent transfers both apply', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      await svc.recordIncome(
          category: 'fund', amount: const Money(100000), accountId: 'cash-1');
      final bankId = await svc.createCashAccount(name: 'Bank', type: 'bank');

      final results = await Future.wait([
        svc.transferFunds(
            fromAccountId: 'cash-1',
            toAccountId: bankId,
            amount: const Money(10000)),
        svc.transferFunds(
            fromAccountId: 'cash-1',
            toAccountId: bankId,
            amount: const Money(10000)),
      ]);
      expect(results.every((r) => r.isOk), true);
      expect((await _account(db, 'cash-1')).balance, 80000);
      expect((await _account(db, bankId)).balance, 20000);
    });
  });

  group('Team D: C9 failed operations burn no document numbers', () {
    test('a sale that fails inside its transaction leaves no gap', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'Test Customer');
      final prodId = await _seedProduct(db, 'Oil', 10000);

      Future<String> makeSale(Money paidNow, String? accountId) async {
        final r = await svc.createSale(
          customerId: custId,
          items: [
            SaleItemInput(
                productId: prodId,
                qty: Qty.of(1),
                unitId: 'kg',
                unitPriceMinor: 10000),
          ],
          paidNow: paidNow,
          accountId: accountId,
        );
        expect(r.isOk, true);
        return r.value;
      }

      final first = await makeSale(Money.zero, null);
      final firstInv = await _sale(db, first);
      expect(firstInv.invoiceNo, 'SALE-000001');

      // Fails inside the transaction (paidNow leg finds no account) and
      // rolls back — the number it consumed must roll back with it.
      var threw = false;
      try {
        await svc.createSale(
          customerId: custId,
          items: [
            SaleItemInput(
                productId: prodId,
                qty: Qty.of(1),
                unitId: 'kg',
                unitPriceMinor: 10000),
          ],
          paidNow: const Money(5000),
          accountId: 'no-such-account',
        );
      } on StateError {
        threw = true;
      }
      expect(threw, true);

      final second = await makeSale(Money.zero, null);
      expect((await _sale(db, second)).invoiceNo, 'SALE-000002');
    });

    test('a failed supplier payment leaves the payment sequence at 1',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'Test Customer');
      final supId = await svc.createSupplier(name: 'Test Supplier');

      // cash-1 is empty: the payment fails on the inside-txn check.
      final failed = await svc.paySupplier(
          supplierId: supId,
          amount: const Money(50000),
          accountId: 'cash-1');
      expect(failed.isOk, false);

      final ok = await svc.receivePayment(
          customerId: custId, amount: const Money(10000), accountId: 'cash-1');
      expect(ok.isOk, true);
      final pay = await (db.select(db.payments)
            ..where((t) => t.id.equals(ok.value)))
          .getSingle();
      expect(pay.paymentNo, 'PAY-000001');
    });
  });

  group('Team D: H1 paidNow writes real Payment rows', () {
    test('sale paidNow appears in payments + allocations + dashboard',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'Test Customer');
      final prodId = await _seedProduct(db, 'Oil', 25000);
      final sale = await svc.createSale(
        customerId: custId,
        items: [
          SaleItemInput(
              productId: prodId,
              qty: Qty.of(2),
              unitId: 'kg',
              unitPriceMinor: 25000),
        ],
        paidNow: const Money(20000),
        accountId: 'cash-1',
      );
      expect(sale.isOk, true);

      final pays = await (db.select(db.payments)
            ..where((t) => t.partyId.equals(custId)))
          .get();
      expect(pays.single.direction, 'receive');
      expect(pays.single.amountMinor, 20000);
      final allocs = await (db.select(db.paymentAllocations)
            ..where((t) => t.paymentId.equals(pays.single.id)))
          .get();
      expect(allocs.single.invoiceKind, 'sale');
      expect(allocs.single.invoiceId, sale.value);
      expect(allocs.single.amountMinor, 20000);

      final rep = ReportService(db);
      final dash = await rep.dashboard();
      expect(dash.todayReceived.minor, 20000);
    });

    test('purchase paidNow appears as a pay Payment + allocation', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      await svc.recordIncome(
          category: 'fund', amount: const Money(100000), accountId: 'cash-1');
      final supId = await svc.createSupplier(name: 'Test Supplier');
      final prodId = await _seedProduct(db, 'Seed', 20000);
      final pur = await svc.createPurchase(
        supplierId: supId,
        items: [
          SaleItemInput(
              productId: prodId,
              qty: Qty.of(5),
              unitId: 'kg',
              unitPriceMinor: 20000),
        ],
        paidNow: const Money(30000),
        accountId: 'cash-1',
      );
      expect(pur.isOk, true);

      final pays = await (db.select(db.payments)
            ..where((t) => t.partyId.equals(supId)))
          .get();
      expect(pays.single.direction, 'pay');
      expect(pays.single.amountMinor, 30000);
      final allocs = await (db.select(db.paymentAllocations)
            ..where((t) => t.paymentId.equals(pays.single.id)))
          .get();
      expect(allocs.single.invoiceKind, 'purchase');
      expect(allocs.single.invoiceId, pur.value);
      expect(allocs.single.amountMinor, 30000);
      expect((await _supplier(db, supId)).balance, 70000);
    });
  });
}

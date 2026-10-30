import 'package:drift/native.dart';
import 'package:test/test.dart';
import 'package:namt_oil_mil/core/money.dart';
import 'package:namt_oil_mil/core/units.dart';
import 'package:namt_oil_mil/data/db.dart';
import 'package:namt_oil_mil/data/reports.dart';
import 'package:namt_oil_mil/data/services.dart';

/// Team A: customer ledger & transactions.
/// Covers: supplier purchase leg direction (LIYE, not DIYE), sale legs
/// incl. udhaar (zero cash paid), opening-balance sides, cash sign guards,
/// manual date recording, and party diye/liye totals reconciliation.
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

void main() {
  group('Team A: buy/sell ledger linkage', () {
    test('credit purchase posts a LIYE (credit) leg for the supplier',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final supId = await svc.createSupplier(name: 'Test Supplier');
      final prodId = await _seedProduct(db, 'Mustard Seed', 0);

      final pur = await svc.createPurchase(
        supplierId: supId,
        items: [
          SaleItemInput(
              productId: prodId,
              qty: Qty.of(100),
              unitId: 'kg',
              unitPriceMinor: 20000),
        ],
      );
      expect(pur.isOk, true);

      final rep = ReportService(db);
      final ledger =
          await rep.partyLedger('supplier', supId, 0, await _nowPlus());
      expect(ledger.length, 1);
      // We owe the supplier: credit side, never debit.
      expect(ledger.single.debitMinor, 0);
      expect(ledger.single.creditMinor, 2000000);
      expect(ledger.single.balanceAfterMinor, 2000000);
      // Item reference rides on the ledger leg.
      expect(ledger.single.description, contains('Mustard Seed'));
    });

    test('supplier payment posts a DIYE (debit) leg', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final supId = await svc.createSupplier(name: 'Test Supplier');
      final prodId = await _seedProduct(db, 'Mustard Seed', 0);
      await svc.createPurchase(
        supplierId: supId,
        items: [
          SaleItemInput(
              productId: prodId,
              qty: Qty.of(100),
              unitId: 'kg',
              unitPriceMinor: 20000),
        ],
      );
      await svc.recordIncome(
          category: 'other',
          amount: const Money(1000000),
          accountId: 'cash-1');
      final pay = await svc.paySupplier(
          supplierId: supId,
          amount: const Money(500000),
          accountId: 'cash-1');
      expect(pay.isOk, true);

      final rep = ReportService(db);
      final ledger =
          await rep.partyLedger('supplier', supId, 0, await _nowPlus());
      expect(ledger.length, 2);
      final paymentLeg = ledger.last;
      expect(paymentLeg.debitMinor, 500000);
      expect(paymentLeg.creditMinor, 0);
      expect(paymentLeg.balanceAfterMinor, 1500000);
    });

    test('credit sale with zero cash paid posts full total as DIYE',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'Test Customer');
      final prodId = await _seedProduct(db, 'Oil 5L', 0);

      // Pure udhaar deal: nothing paid now, full total still owed.
      final sale = await svc.createSale(
        customerId: custId,
        items: [
          SaleItemInput(
              productId: prodId,
              qty: Qty.of(2),
              unitId: 'piece',
              unitPriceMinor: 25000),
        ],
      );
      expect(sale.isOk, true);

      final cust = await (db.select(db.customers)
            ..where((t) => t.id.equals(custId)))
          .getSingle();
      expect(cust.balance, 50000);

      final rep = ReportService(db);
      final ledger =
          await rep.partyLedger('customer', custId, 0, await _nowPlus());
      expect(ledger.length, 1);
      expect(ledger.single.debitMinor, 50000);
      expect(ledger.single.creditMinor, 0);
      expect(ledger.single.description, contains('Oil 5L'));
    });

    test('partial sale: full-total DIYE leg + receipt LIYE leg', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'Test Customer');
      final prodId = await _seedProduct(db, 'Oil 5L', 0);

      final sale = await svc.createSale(
        customerId: custId,
        items: [
          SaleItemInput(
              productId: prodId,
              qty: Qty.of(2),
              unitId: 'piece',
              unitPriceMinor: 25000),
        ],
        paidNow: const Money(20000),
        accountId: 'cash-1',
      );
      expect(sale.isOk, true);

      final rep = ReportService(db);
      final ledger =
          await rep.partyLedger('customer', custId, 0, await _nowPlus());
      expect(ledger.length, 2);
      expect(ledger[0].debitMinor, 50000);
      expect(ledger[0].creditMinor, 0);
      expect(ledger[1].debitMinor, 0);
      expect(ledger[1].creditMinor, 20000);
      expect(ledger.last.balanceAfterMinor, 30000);
    });
  });

  group('Team A: opening balances post on the correct side', () {
    test('supplier opening (we owe) posts LIYE; customer advance posts LIYE',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final rep = ReportService(db);

      final supId = await svc.createSupplier(
          name: 'Owed Supplier', openingBalance: const Money(30000));
      final supLedger =
          await rep.partyLedger('supplier', supId, 0, await _nowPlus());
      expect(supLedger.length, 1);
      expect(supLedger.single.debitMinor, 0);
      expect(supLedger.single.creditMinor, 30000);
      expect(supLedger.single.balanceAfterMinor, 30000);

      // Customer advance: we owe the customer, so also LIYE.
      final custId = await svc.createCustomer(
          name: 'Advance Customer',
          openingBalance: const Money(-10000));
      final custLedger =
          await rep.partyLedger('customer', custId, 0, await _nowPlus());
      expect(custLedger.length, 1);
      expect(custLedger.single.debitMinor, 0);
      expect(custLedger.single.creditMinor, 10000);
      expect(custLedger.single.balanceAfterMinor, -10000);

      // Plain customer opening (owes us) stays DIYE.
      final custId2 = await svc.createCustomer(
          name: 'Owing Customer', openingBalance: const Money(10000));
      final custLedger2 =
          await rep.partyLedger('customer', custId2, 0, await _nowPlus());
      expect(custLedger2.single.debitMinor, 10000);
      expect(custLedger2.single.creditMinor, 0);
    });
  });

  group('Team A: cash sign guards', () {
    test('cash cannot go negative through payments, expenses, or opening',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);

      final supId = await svc.createSupplier(name: 'Test Supplier');
      // cash-1 starts at 0 (seeded by onCreate).
      final pay = await svc.paySupplier(
          supplierId: supId,
          amount: const Money(1000),
          accountId: 'cash-1');
      expect(pay.isOk, false);

      final exp = await svc.recordExpense(
          category: 'other',
          amount: const Money(1000),
          accountId: 'cash-1');
      expect(exp.isOk, false);

      await expectLater(
          svc.createCashAccount(
              name: 'Neg', type: 'cash', openingBalance: const Money(-100)),
          throwsArgumentError);

      final cash = await (db.select(db.cashAccounts)
            ..where((t) => t.id.equals('cash-1')))
          .getSingle();
      expect(cash.balance, 0);
    });
  });

  group('Team A: date & time', () {
    test('manual date is recorded on ledger legs', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'Test Customer');
      final prodId = await _seedProduct(db, 'Oil 5L', 0);

      final ts = DateTime(2026, 10, 20, 14, 30).millisecondsSinceEpoch;
      final udhaar = await svc.giveUdhaar(
          customerId: custId, amount: const Money(5000), date: ts);
      expect(udhaar.isOk, true);

      final ts2 = DateTime(2026, 10, 21, 9, 15).millisecondsSinceEpoch;
      final sale = await svc.createSale(
        customerId: custId,
        items: [
          SaleItemInput(
              productId: prodId,
              qty: Qty.of(1),
              unitId: 'piece',
              unitPriceMinor: 25000),
        ],
        date: ts2,
      );
      expect(sale.isOk, true);

      final rep = ReportService(db);
      final ledger =
          await rep.partyLedger('customer', custId, 0, await _nowPlus());
      expect(ledger.length, 2);
      expect(ledger[0].date, ts);
      expect(ledger[1].date, ts2);
    });

    test('partyLedger keeps entry order for same-timestamp legs', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'Test Customer');
      final ts = DateTime(2026, 10, 20, 14, 30).millisecondsSinceEpoch;
      await svc.giveUdhaar(
          customerId: custId, amount: const Money(1000), date: ts);
      await svc.giveUdhaar(
          customerId: custId, amount: const Money(2000), date: ts);

      final rep = ReportService(db);
      final ledger =
          await rep.partyLedger('customer', custId, 0, await _nowPlus());
      expect(ledger.map((e) => e.debitMinor).toList(), [1000, 2000]);
    });
  });

  group('Team A: party diye/liye totals reconcile', () {
    test('gross totals match the balance delta', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(
          name: 'Test Customer', openingBalance: const Money(10000));
      await svc.giveUdhaar(
          customerId: custId, amount: const Money(5000));
      await svc.receivePayment(
          customerId: custId,
          amount: const Money(3000),
          accountId: 'cash-1');

      final rep = ReportService(db);
      final ledger =
          await rep.partyLedger('customer', custId, 0, await _nowPlus());
      final diye =
          ledger.fold<int>(0, (a, e) => a + e.debitMinor);
      final liye =
          ledger.fold<int>(0, (a, e) => a + e.creditMinor);
      expect(diye, 15000);
      expect(liye, 3000);
      expect(ledger.last.balanceAfterMinor, diye - liye);
    });
  });
}

import 'dart:io';

import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:test/test.dart';
import 'package:namt_oil_mil/core/money.dart';
import 'package:namt_oil_mil/core/units.dart';
import 'package:namt_oil_mil/data/backup.dart';
import 'package:namt_oil_mil/data/db.dart';
import 'package:namt_oil_mil/data/reports.dart';
import 'package:namt_oil_mil/data/services.dart';

AppDatabase _testDb() {
  return AppDatabase.forTesting(
      NativeDatabase.memory(logStatements: false));
}

Future<void> main() async {
  group('Workflow A: customer credit sale + partial payment + ledger', () {
    test('full cycle', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);

      final custId = await svc.createCustomer(
          name: 'Test Customer', openingBalance: const Money(10000));
      var cust = await (db.select(db.customers)
            ..where((t) => t.id.equals(custId)))
          .getSingle();
      expect(cust.balance, 10000);

      // credit sale 500.00
      final saleId = await svc.createSale(
        customerId: custId,
        items: [
          SaleItemInput(
              productId: await _seedProduct(db, 'Oil 5L', 0),
              qty: Qty.of(2),
              unitId: 'piece',
              unitPriceMinor: 25000),
        ],
      );
      expect(saleId.isOk, true);
      cust = await (db.select(db.customers)
            ..where((t) => t.id.equals(custId)))
          .getSingle();
      expect(cust.balance, 60000); // 100 opening + 500 sale

      // partial payment 200
      final pay = await svc.receivePayment(
          customerId: custId,
          amount: const Money(20000),
          accountId: 'cash-1');
      expect(pay.isOk, true);
      cust = await (db.select(db.customers)
            ..where((t) => t.id.equals(custId)))
          .getSingle();
      expect(cust.balance, 40000);

      // ledger reconciles
      final rep = ReportService(db);
      final ledger = await rep.partyLedger(
          'customer', custId, 0, DateTime.now().millisecondsSinceEpoch + 1);
      expect(ledger.isNotEmpty, true);
      expect(ledger.last.balanceAfterMinor, 40000);

      // cash account got the payment
      final cash = await (db.select(db.cashAccounts)
            ..where((t) => t.id.equals('cash-1')))
          .getSingle();
      expect(cash.balance, 20000);
    });
  });

  group('Workflow B: supplier purchase + payment + inventory', () {
    test('full cycle', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);

      final supId = await svc.createSupplier(name: 'Test Supplier');
      final prodId = await _seedProduct(db, 'Mustard Seed', 0);

      final purId = await svc.createPurchase(
        supplierId: supId,
        items: [
          SaleItemInput(
              productId: prodId,
              qty: Qty.of(100),
              unitId: 'kg',
              unitPriceMinor: 20000),
        ],
      );
      expect(purId.isOk, true);
      var sup = await (db.select(db.suppliers)
            ..where((t) => t.id.equals(supId)))
          .getSingle();
      expect(sup.balance, 2000000); // 100kg * 200.00

      // stock increased
      expect(await svc.stockOf(prodId), Qty.of(100));

      // pay 5000.00 — need cash first via income
      await svc.recordIncome(
          category: 'other',
          amount: const Money(1000000),
          accountId: 'cash-1');
      final pay = await svc.paySupplier(
          supplierId: supId,
          amount: const Money(500000),
          accountId: 'cash-1');
      expect(pay.isOk, true);
      sup = await (db.select(db.suppliers)
            ..where((t) => t.id.equals(supId)))
          .getSingle();
      expect(sup.balance, 1500000);
    });
  });

  group('Workflow C: production batch consumes + outputs + yield', () {
    test('full cycle', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);

      final seedId = await _seedProduct(db, 'Mustard Seed', 0);
      final oilId = await _seedProduct(db, 'Mustard Oil', 0);
      final cakeId = await _seedProduct(db, 'Oil Cake', 0);

      // seed 1000 kg raw via purchase from supplier
      final supId = await svc.createSupplier(name: 'S');
      await svc.createPurchase(supplierId: supId, items: [
        SaleItemInput(
            productId: seedId,
            qty: Qty.of(1000),
            unitId: 'kg',
            unitPriceMinor: 20000)
      ]);
      expect(await svc.stockOf(seedId), Qty.of(1000));

      final batch = await svc.createProductionBatch(
        inputs: [
          ProductionIO(productId: seedId, qty: Qty.of(100), unitId: 'kg')
        ],
        outputs: [
          ProductionIO(productId: oilId, qty: Qty.of(35), unitId: 'kg'),
          ProductionIO(productId: cakeId, qty: Qty.of(60), unitId: 'kg'),
        ],
        labourCost: const Money(5000),
      );
      expect(batch.isOk, true);
      expect(await svc.stockOf(seedId), Qty.of(900));
      expect(await svc.stockOf(oilId), Qty.of(35));
      expect(await svc.stockOf(cakeId), Qty.of(60));

      // insufficient stock blocked
      final bad = await svc.createProductionBatch(
        inputs: [
          ProductionIO(
              productId: seedId, qty: Qty.of(99999), unitId: 'kg')
        ],
        outputs: [
          ProductionIO(productId: oilId, qty: Qty.of(1), unitId: 'kg')
        ],
      );
      expect(bad.isOk, false);
    });
  });

  group('Workflow D: transfers are not double counted', () {
    test('cashbook reconciles', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final rep = ReportService(db);

      await svc.recordIncome(
          category: 'other',
          amount: const Money(100000),
          accountId: 'cash-1');
      final bankId =
          await svc.createCashAccount(name: 'Bank', type: 'bank');
      final t = await svc.transferFunds(
          fromAccountId: 'cash-1',
          toAccountId: bankId,
          amount: const Money(40000));
      expect(t.isOk, true);

      final dash = await rep.dashboard();
      expect(dash.cashBalance.minor, 60000);
      expect(dash.bankBalance.minor, 40000);
      // P&L: transfer must not appear as expense or income
      final now = DateTime.now();
      final pnl = await rep.profitLoss(
          DateTime(now.year, now.month, 1).millisecondsSinceEpoch,
          now.millisecondsSinceEpoch);
      expect(pnl.operatingExpenses.minor, 0);
      // income only from the recorded income
      expect(pnl.otherIncome.minor, 100000);
    });
  });

  group('Workflow E: persistence across close/reopen (file db)', () {
    test('data survives close and reopen', () async {
      // Use a temp file database to simulate restart.
      final dir = await _tempDir();
      final path = '${dir.path}/restart_test.sqlite';
      AppDatabase open() => AppDatabase.forTesting(
          NativeDatabase.createInBackground(File(path)));

      var db = open();
      // onCreate seeds settings + cash-1 automatically on first open.
      var svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'Reopen Test');
      await db.close();

      db = open();
      final cust = await (db.select(db.customers)
            ..where((t) => t.id.equals(custId)))
          .getSingleOrNull();
      expect(cust, isNotNull);
      expect(cust!.name, 'Reopen Test');
      await db.close();
    }, timeout: const Timeout(Duration(minutes: 2)));
  });

  group('Backup validation', () {
    test('rejects non-backup files', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      // create minimal rows so db exists
      await svc.createCustomer(name: 'X');
      final dir = await _tempDir();
      final fake = File('${dir.path}/fake.sqlite');
      await fake.writeAsString('not a database');
      final res = await BackupService(db).validate(fake.path);
      expect(res.isOk, false);
    });
  });
}

Future<String> _seedProduct(AppDatabase db, String name, int price) async {
  final svc = AccountingService(db);
  return svc.createProduct(
      name: name, category: 'raw', baseUnitId: 'kg',
      purchasePriceMinor: price, salePriceMinor: price);
}

Future<Directory> _tempDir() async {
  final d = await Directory.systemTemp.createTemp('namt_test_');
  addTearDown(() => d.delete(recursive: true));
  return d;
}

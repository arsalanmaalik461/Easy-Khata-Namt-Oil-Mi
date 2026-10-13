/// Plain-Dart integration tests for database workflows.
/// Run with: dart --packages=.dart_tool/package_config.json test/run_integration.dart
import 'dart:io';

import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:namt_oil_mil/core/money.dart';
import 'package:namt_oil_mil/core/units.dart';
import 'package:namt_oil_mil/data/backup.dart';
import 'package:namt_oil_mil/data/db.dart';
import 'package:namt_oil_mil/data/reports.dart';
import 'package:namt_oil_mil/data/services.dart';

int _passed = 0;
int _failed = 0;
final List<String> _failures = [];

void check(bool condition, String name) {
  if (condition) {
    _passed++;
  } else {
    _failed++;
    _failures.add(name);
    print('FAIL: $name');
  }
}

void checkEq(dynamic actual, dynamic expected, String name) {
  if (actual == expected) {
    _passed++;
  } else {
    _failed++;
    _failures.add('$name (expected $expected, got $actual)');
    print('FAIL: $name (expected $expected, got $actual)');
  }
}

AppDatabase _testDb() =>
    AppDatabase.forTesting(NativeDatabase.memory(logStatements: false));

Future<String> _seedProduct(AppDatabase db, String name) async {
  final svc = AccountingService(db);
  return svc.createProduct(
      name: name,
      category: 'raw',
      baseUnitId: 'kg',
      purchasePriceMinor: 0,
      salePriceMinor: 0);
}

Future<void> workflowA() async {
  print('=== Workflow A: customer credit sale + payment + ledger ===');
  final db = _testDb();
  try {
    final svc = AccountingService(db);

    final custId = await svc.createCustomer(
        name: 'Test Customer', openingBalance: const Money(10000));
    var cust = await (db.select(db.customers)
          ..where((t) => t.id.equals(custId)))
        .getSingle();
    checkEq(cust.balance, 10000, 'A: opening balance');

    final saleId = await svc.createSale(
      customerId: custId,
      items: [
        SaleItemInput(
            productId: await _seedProduct(db, 'Oil 5L'),
            qty: Qty.of(2),
            unitId: 'piece',
            unitPriceMinor: 25000),
      ],
    );
    check(saleId.isOk, 'A: sale created');
    cust = await (db.select(db.customers)
          ..where((t) => t.id.equals(custId)))
        .getSingle();
    checkEq(cust.balance, 60000, 'A: balance after sale');

    final pay = await svc.receivePayment(
        customerId: custId,
        amount: const Money(20000),
        accountId: 'cash-1');
    check(pay.isOk, 'A: payment ok');
    cust = await (db.select(db.customers)
          ..where((t) => t.id.equals(custId)))
        .getSingle();
    checkEq(cust.balance, 40000, 'A: balance after payment');

    final rep = ReportService(db);
    final ledger = await rep.partyLedger('customer', custId, 0,
        DateTime.now().millisecondsSinceEpoch + 1);
    check(ledger.isNotEmpty, 'A: ledger not empty');
    checkEq(ledger.last.balanceAfterMinor, 40000, 'A: ledger reconciles');

    final cash = await (db.select(db.cashAccounts)
          ..where((t) => t.id.equals('cash-1')))
        .getSingle();
    checkEq(cash.balance, 20000, 'A: cash account updated');
  } finally {
    await db.close();
  }
}

Future<void> workflowB() async {
  print('=== Workflow B: supplier purchase + payment + inventory ===');
  final db = _testDb();
  try {
    final svc = AccountingService(db);
    final supId = await svc.createSupplier(name: 'Test Supplier');
    final prodId = await _seedProduct(db, 'Mustard Seed');

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
    check(purId.isOk, 'B: purchase created');
    var sup = await (db.select(db.suppliers)
          ..where((t) => t.id.equals(supId)))
        .getSingle();
    checkEq(sup.balance, 2000000, 'B: payable balance');
    checkEq(await svc.stockOf(prodId), Qty.of(100), 'B: stock increased');

    await svc.recordIncome(
        category: 'other',
        amount: const Money(1000000),
        accountId: 'cash-1');
    final pay = await svc.paySupplier(
        supplierId: supId,
        amount: const Money(500000),
        accountId: 'cash-1');
    check(pay.isOk, 'B: supplier payment ok');
    sup = await (db.select(db.suppliers)
          ..where((t) => t.id.equals(supId)))
        .getSingle();
    checkEq(sup.balance, 1500000, 'B: payable after payment');
  } finally {
    await db.close();
  }
}

Future<void> workflowC() async {
  print('=== Workflow C: production batch ===');
  final db = _testDb();
  try {
    final svc = AccountingService(db);
    final seedId = await _seedProduct(db, 'Mustard Seed');
    final oilId = await _seedProduct(db, 'Mustard Oil');
    final cakeId = await _seedProduct(db, 'Oil Cake');

    final supId = await svc.createSupplier(name: 'S');
    await svc.createPurchase(supplierId: supId, items: [
      SaleItemInput(
          productId: seedId,
          qty: Qty.of(1000),
          unitId: 'kg',
          unitPriceMinor: 20000)
    ]);
    checkEq(await svc.stockOf(seedId), Qty.of(1000), 'C: raw stock');

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
    check(batch.isOk, 'C: batch created');
    checkEq(await svc.stockOf(seedId), Qty.of(900), 'C: input consumed');
    checkEq(await svc.stockOf(oilId), Qty.of(35), 'C: oil produced');
    checkEq(await svc.stockOf(cakeId), Qty.of(60), 'C: cake produced');

    final bad = await svc.createProductionBatch(
      inputs: [
        ProductionIO(
            productId: seedId, qty: Qty.of(99999), unitId: 'kg')
      ],
      outputs: [
        ProductionIO(productId: oilId, qty: Qty.of(1), unitId: 'kg')
      ],
    );
    check(!bad.isOk, 'C: insufficient stock blocked');
  } finally {
    await db.close();
  }
}

Future<void> workflowD() async {
  print('=== Workflow D: transfers not double counted ===');
  final db = _testDb();
  try {
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
    check(t.isOk, 'D: transfer ok');

    final dash = await rep.dashboard();
    checkEq(dash.cashBalance.minor, 60000, 'D: cash balance');
    checkEq(dash.bankBalance.minor, 40000, 'D: bank balance');

    final now = DateTime.now();
    final pnl = await rep.profitLoss(
        DateTime(now.year, now.month, 1).millisecondsSinceEpoch,
        now.millisecondsSinceEpoch);
    checkEq(pnl.operatingExpenses.minor, 0, 'D: no phantom expense');
    checkEq(pnl.otherIncome.minor, 100000, 'D: income correct');
  } finally {
    await db.close();
  }
}

Future<void> workflowE() async {
  print('=== Workflow E: persistence across close/reopen ===');
  final dir = await Directory.systemTemp.createTemp('namt_test_');
  try {
    final path = '${dir.path}/restart_test.sqlite';
    AppDatabase open() =>
        AppDatabase.forTesting(NativeDatabase.createInBackground(File(path)));

    var db = open();
    var svc = AccountingService(db);
    final custId = await svc.createCustomer(name: 'Reopen Test');
    await db.close();

    db = open();
    final cust = await (db.select(db.customers)
          ..where((t) => t.id.equals(custId)))
        .getSingleOrNull();
    check(cust != null, 'E: customer persists');
    checkEq(cust?.name, 'Reopen Test', 'E: name matches');
    await db.close();
  } finally {
    await dir.delete(recursive: true);
  }
}

Future<void> backupTest() async {
  print('=== Backup validation ===');
  final db = _testDb();
  try {
    final svc = AccountingService(db);
    await svc.createCustomer(name: 'X');
    final dir = await Directory.systemTemp.createTemp('namt_test_');
    try {
      final fake = File('${dir.path}/fake.sqlite');
      await fake.writeAsString('not a database');
      final res = await BackupService(db).validate(fake.path);
      check(!res.isOk, 'Backup: rejects invalid file');
    } finally {
      await dir.delete(recursive: true);
    }
  } finally {
    await db.close();
  }
}

Future<void> main() async {
  await workflowA();
  await workflowB();
  await workflowC();
  await workflowD();
  await workflowE();
  await backupTest();

  print('\n=== Results: $_passed passed, $_failed failed ===');
  if (_failures.isNotEmpty) {
    print('Failures:');
    for (final f in _failures) {
      print('  - $f');
    }
    exit(1);
  }
}

import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
// NOTE: package:test is NOT in pubspec dev_dependencies, so every existing
// test file importing it fails to load under flutter test. flutter_test
// (a real dev dependency) re-exports the same test/group/expect API.
import 'package:flutter_test/flutter_test.dart';
import 'package:namt_oil_mil/data/db.dart';
import 'package:namt_oil_mil/data/documents.dart';
import 'package:namt_oil_mil/data/reports.dart';
import 'package:namt_oil_mil/data/services.dart';

AppDatabase _testDb() =>
    AppDatabase.forTesting(NativeDatabase.memory(logStatements: false));

Future<List<String>> _customerCodes(AppDatabase db) async {
  final rows = await (db.select(db.customers)
        ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
      .get();
  return rows.map((c) => c.code).toList();
}

/// One transaction row + one ledger row for [customerId] at [date].
Future<void> _ledgerRow(
  AppDatabase db, {
  required String key,
  required String customerId,
  required int date,
  int debit = 0,
  int credit = 0,
  required int balanceAfter,
}) async {
  await db.into(db.transactions).insert(TransactionsCompanion.insert(
        id: 'txn-$key',
        txnNumber: 'T-$key',
        date: date,
        category: 'test',
        amountMinor: debit + credit,
        createdAt: date,
      ));
  await db.into(db.ledgerEntries).insert(LedgerEntriesCompanion.insert(
        txnId: 'txn-$key',
        accountKind: 'customer',
        accountId: customerId,
        debitMinor: Value(debit),
        creditMinor: Value(credit),
        balanceAfterMinor: balanceAfter,
        date: date,
        description: Value('entry $key'),
      ));
}

int _ms(int y, int m, int d) => DateTime(y, m, d).millisecondsSinceEpoch;

Future<void> main() async {
  group('Team B — automatic party codes', () {
    test('first customer gets code 1', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      expect(await svc.nextPartyCode('customer'), '1');
      final id = await svc.createCustomer(name: 'A', code: '');
      final c = await (db.select(db.customers)
            ..where((t) => t.id.equals(id)))
          .getSingle();
      expect(c.code, '1');
    });

    test('codes increment 1, 2, 3 and next is 4', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      await svc.createCustomer(name: 'A', code: '');
      await svc.createCustomer(name: 'B', code: '');
      await svc.createCustomer(name: 'C', code: '');
      expect(await _customerCodes(db), ['1', '2', '3']);
      expect(await svc.nextPartyCode('customer'), '4');
    });

    test('explicit and non-numeric codes do not break sequencing',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      await svc.createCustomer(name: 'A', code: '10');
      expect(await svc.nextPartyCode('customer'), '11');
      await svc.createCustomer(name: 'B', code: 'ABC');
      expect(await svc.nextPartyCode('customer'), '11');
      await svc.createCustomer(name: 'C', code: '');
      expect((await _customerCodes(db)).last, '11');
    });

    test('deactivated max code is never reused', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      await svc.createCustomer(name: 'A', code: '');
      await svc.createCustomer(name: 'B', code: '');
      await svc.createCustomer(name: 'C', code: '');
      // Deactivate the max-code customer (the app has no hard delete).
      await (db.update(db.customers)
            ..where((t) => t.code.equals('3')))
          .write(const CustomersCompanion(active: Value(false)));
      expect(await svc.nextPartyCode('customer'), '4');
      final id = await svc.createCustomer(name: 'D', code: '');
      final codes = await _customerCodes(db);
      expect(codes.toSet().length, codes.length); // no duplicates
      final d = await (db.select(db.customers)
            ..where((t) => t.id.equals(id)))
          .getSingle();
      expect(d.code, '4');
    });

    test('suppliers have their own independent sequence', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      await svc.createCustomer(name: 'A', code: '');
      await svc.createSupplier(name: 'S', code: '');
      expect(await svc.nextPartyCode('customer'), '2');
      expect(await svc.nextPartyCode('supplier'), '2');
    });
  });

  group('Team B — statement PDF date range', () {
    test('partyLedger returns only in-range rows', () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'A', code: '');
      await _ledgerRow(db,
          key: 'jan', customerId: custId, date: _ms(2026, 1, 10),
          debit: 10000, balanceAfter: 10000);
      await _ledgerRow(db,
          key: 'feb', customerId: custId, date: _ms(2026, 2, 10),
          credit: 4000, balanceAfter: 6000);
      await _ledgerRow(db,
          key: 'mar', customerId: custId, date: _ms(2026, 3, 10),
          debit: 2000, balanceAfter: 8000);
      final reports = ReportService(db);
      final feb = await reports.partyLedger(
          'customer', custId, _ms(2026, 2, 1), _ms(2026, 2, 28));
      expect(feb.length, 1);
      expect(feb.first.description, 'entry feb');
      // Boundary days are inclusive.
      final jan10 = await reports.partyLedger(
          'customer', custId, _ms(2026, 1, 10), _ms(2026, 1, 10));
      expect(jan10.length, 1);
    });

    test('customerStatementPdf renders a range without throwing',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'A', code: '');
      await _ledgerRow(db,
          key: 'feb', customerId: custId, date: _ms(2026, 2, 10),
          debit: 10000, balanceAfter: 10000);
      final docs = DocumentService(db);
      final bytes = await docs.customerStatementPdf(
          custId, _ms(2026, 2, 1), _ms(2026, 2, 28));
      expect(bytes.isNotEmpty, true);
    });

    test('customerStatementPdf survives a long ledger (MultiPage)',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'A', code: '');
      // 60 rows: a single pw.Page would overflow and throw; MultiPage
      // must paginate instead (this was the silent share failure).
      for (var i = 0; i < 60; i++) {
        await _ledgerRow(db,
            key: 'r$i', customerId: custId, date: _ms(2026, 2, 1) + i,
            debit: 1000, balanceAfter: 1000 * (i + 1));
      }
      final docs = DocumentService(db);
      final bytes = await docs.customerStatementPdf(
          custId, _ms(2026, 1, 1), _ms(2026, 12, 31));
      expect(bytes.isNotEmpty, true);
    });

    test('customerStatementPdf renders an empty range without throwing',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'A', code: '');
      await _ledgerRow(db,
          key: 'jan', customerId: custId, date: _ms(2026, 1, 10),
          debit: 10000, balanceAfter: 10000);
      final docs = DocumentService(db);
      final bytes = await docs.customerStatementPdf(
          custId, _ms(2026, 5, 1), _ms(2026, 5, 31));
      expect(bytes.isNotEmpty, true);
    });
  });
}

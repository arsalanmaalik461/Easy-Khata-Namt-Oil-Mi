import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:namt_oil_mil/data/db.dart';
import 'package:namt_oil_mil/data/documents.dart';
import 'package:namt_oil_mil/data/services.dart';

AppDatabase _testDb() =>
    AppDatabase.forTesting(NativeDatabase.memory(logStatements: false));

/// One ledger row for a SUPPLIER at [date] (accountKind 'supplier').
Future<void> _supplierLedgerRow(
  AppDatabase db, {
  required String key,
  required String supplierId,
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
        accountKind: 'supplier',
        accountId: supplierId,
        debitMinor: Value(debit),
        creditMinor: Value(credit),
        balanceAfterMinor: balanceAfter,
        date: date,
        description: Value('entry $key'),
      ));
}

int _ms(int y, int m, int d) => DateTime(y, m, d).millisecondsSinceEpoch;

Future<void> main() async {
  group('Team E — supplier statement PDF (C10) + reminder path (R1)', () {
    test('supplierStatementPdf renders a supplier ledger without throwing',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final supId = await svc.createSupplier(name: 'S', code: '');
      await _supplierLedgerRow(db,
          key: 'sup-feb', supplierId: supId, date: _ms(2026, 2, 10),
          credit: 50000, balanceAfter: 50000);
      final docs = DocumentService(db);
      final bytes = await docs.supplierStatementPdf(
          supId, _ms(2026, 2, 1), _ms(2026, 2, 28));
      expect(bytes.isNotEmpty, true);
    });

    test('supplierStatementPdf renders an empty range without throwing',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final supId = await svc.createSupplier(name: 'S', code: '');
      await _supplierLedgerRow(db,
          key: 'sup-jan', supplierId: supId, date: _ms(2026, 1, 10),
          credit: 50000, balanceAfter: 50000);
      final docs = DocumentService(db);
      final bytes = await docs.supplierStatementPdf(
          supId, _ms(2026, 5, 1), _ms(2026, 5, 31));
      expect(bytes.isNotEmpty, true);
    });

    test('supplierStatementPdf survives a long supplier ledger (MultiPage)',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final supId = await svc.createSupplier(name: 'S', code: '');
      for (var i = 0; i < 60; i++) {
        await _supplierLedgerRow(db,
            key: 'sr$i', supplierId: supId, date: _ms(2026, 2, 1) + i,
            credit: 1000, balanceAfter: 1000 * (i + 1));
      }
      final docs = DocumentService(db);
      final bytes = await docs.supplierStatementPdf(
          supId, _ms(2026, 1, 1), _ms(2026, 12, 31));
      expect(bytes.isNotEmpty, true);
    });

    test('customerStatementPdf still works after the refactor (no regression)',
        () async {
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final custId = await svc.createCustomer(name: 'A', code: '');
      final docs = DocumentService(db);
      final bytes = await docs.customerStatementPdf(
          custId, _ms(2026, 2, 1), _ms(2026, 2, 28));
      expect(bytes.isNotEmpty, true);
    });

    test('the old C10 failure mode is gone: a supplier id is not routed '
        'through the customer-only query', () async {
      // Before the fix, shareStatementPdf/_sendReminder passed a supplier
      // id into customerStatementPdf, whose getSingle() on db.customers
      // threw. The supplier branch must now succeed for the same id.
      final db = _testDb();
      addTearDown(() => db.close());
      final svc = AccountingService(db);
      final supId = await svc.createSupplier(name: 'S', code: '');
      final docs = DocumentService(db);
      // Customer path with a supplier id still throws (it is a different
      // party table) — proving the two paths are genuinely separate.
      await expectLater(
        docs.customerStatementPdf(supId, _ms(2026, 1, 1), _ms(2026, 12, 31)),
        throwsA(anything),
      );
      final bytes = await docs.supplierStatementPdf(
          supId, _ms(2026, 1, 1), _ms(2026, 12, 31));
      expect(bytes.isNotEmpty, true);
    });
  });
}

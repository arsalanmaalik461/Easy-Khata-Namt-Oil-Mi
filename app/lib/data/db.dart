import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';

/// Single-row business settings (id = 1).
class BusinessSettings extends Table {
  IntColumn get id => integer()();
  TextColumn get businessName => text().withDefault(const Constant('Namt Oil Mil'))();
  TextColumn get address => text().withDefault(const Constant(''))();
  TextColumn get phone => text().withDefault(const Constant(''))();
  TextColumn get language => text().withDefault(const Constant('en'))();
  TextColumn get themeMode => text().withDefault(const Constant('system'))();
  TextColumn get salePrefix => text().withDefault(const Constant('SALE-'))();
  TextColumn get purchasePrefix => text().withDefault(const Constant('PUR-'))();
  TextColumn get paymentPrefix => text().withDefault(const Constant('PAY-'))();
  TextColumn get batchPrefix => text().withDefault(const Constant('BATCH-'))();
  /// warn | block | allow
  TextColumn get negativeStock => text().withDefault(const Constant('warn'))();
  BoolColumn get onboarded => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class Units extends Table {
  TextColumn get id => text()();
  TextColumn get nameEn => text()();
  TextColumn get nameUr => text()();
  TextColumn get symbol => text()();
  @override
  Set<Column> get primaryKey => {id};
}

class UnitConversions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fromUnitId => text().references(Units, #id)();
  TextColumn get toUnitId => text().references(Units, #id)();
  IntColumn get factorNum => integer()();
  IntColumn get factorDen => integer()();
}

class Products extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  /// raw | finished_oil | cake | packaging | container | spare | consumable | other
  TextColumn get category => text()();
  TextColumn get baseUnitId => text().references(Units, #id)();
  /// paisa
  IntColumn get purchasePrice => integer().withDefault(const Constant(0))();
  IntColumn get salePrice => integer().withDefault(const Constant(0))();
  IntColumn get reorderNum => integer().withDefault(const Constant(0))();
  IntColumn get reorderDen => integer().withDefault(const Constant(1))();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class Customers extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get phone => text().withDefault(const Constant(''))();
  /// WhatsApp number; empty means "same as phone".
  TextColumn get whatsapp => text().withDefault(const Constant(''))();
  TextColumn get address => text().withDefault(const Constant(''))();
  TextColumn get code => text().withDefault(const Constant(''))();
  TextColumn get businessName => text().withDefault(const Constant(''))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  /// paisa; >0 means customer owes us
  IntColumn get openingBalance => integer().withDefault(const Constant(0))();
  IntColumn get balance => integer().withDefault(const Constant(0))();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  /// 0/1 favorite (heart) toggle
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class Suppliers extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get phone => text().withDefault(const Constant(''))();
  /// WhatsApp number; empty means "same as phone".
  TextColumn get whatsapp => text().withDefault(const Constant(''))();
  TextColumn get address => text().withDefault(const Constant(''))();
  TextColumn get code => text().withDefault(const Constant(''))();
  TextColumn get businessName => text().withDefault(const Constant(''))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  /// paisa; >0 means we owe supplier
  IntColumn get openingBalance => integer().withDefault(const Constant(0))();
  IntColumn get balance => integer().withDefault(const Constant(0))();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class CashAccounts extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  /// cash | bank
  TextColumn get type => text()();
  IntColumn get openingBalance => integer().withDefault(const Constant(0))();
  IntColumn get balance => integer().withDefault(const Constant(0))();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

/// Immutable financial events. Corrections use reversals, never edits.
class Transactions extends Table {
  TextColumn get id => text()();
  TextColumn get txnNumber => text().unique()();
  /// ms since epoch
  IntColumn get date => integer()();
  TextColumn get category => text()();
  IntColumn get amountMinor => integer()();
  TextColumn get partyKind => text().nullable()();
  TextColumn get partyId => text().nullable()();
  TextColumn get paymentMethod => text().withDefault(const Constant('cash'))();
  TextColumn get reference => text().withDefault(const Constant(''))();
  TextColumn get description => text().withDefault(const Constant(''))();
  /// posted | reversed
  TextColumn get status => text().withDefault(const Constant('posted'))();
  TextColumn get reversedBy => text().nullable()();
  /// JSON list of local bill-image file paths, e.g. '["/path/a.jpg"]'
  TextColumn get imagePaths => text().withDefault(const Constant('[]'))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class LedgerEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get txnId => text().references(Transactions, #id)();
  /// customer | supplier | cash | expense | income
  TextColumn get accountKind => text()();
  TextColumn get accountId => text()();
  IntColumn get debitMinor => integer().withDefault(const Constant(0))();
  IntColumn get creditMinor => integer().withDefault(const Constant(0))();
  IntColumn get balanceAfterMinor => integer()();
  IntColumn get date => integer()();
  TextColumn get description => text().withDefault(const Constant(''))();
}

class SalesInvoices extends Table {
  TextColumn get id => text()();
  TextColumn get invoiceNo => text().unique()();
  TextColumn get customerId => text().references(Customers, #id)();
  IntColumn get date => integer()();
  IntColumn get subtotalMinor => integer()();
  IntColumn get discountMinor => integer().withDefault(const Constant(0))();
  IntColumn get taxMinor => integer().withDefault(const Constant(0))();
  IntColumn get totalMinor => integer()();
  IntColumn get paidMinor => integer().withDefault(const Constant(0))();
  /// draft | unpaid | partially_paid | paid | partially_returned | returned | cancelled
  TextColumn get status => text().withDefault(const Constant('unpaid'))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class SalesInvoiceItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get invoiceId => text().references(SalesInvoices, #id)();
  TextColumn get productId => text().references(Products, #id)();
  IntColumn get qtyNum => integer()();
  IntColumn get qtyDen => integer().withDefault(const Constant(1))();
  TextColumn get unitId => text().references(Units, #id)();
  IntColumn get unitPriceMinor => integer()();
  IntColumn get discountMinor => integer().withDefault(const Constant(0))();
  IntColumn get lineTotalMinor => integer()();
}

class PurchaseInvoices extends Table {
  TextColumn get id => text()();
  TextColumn get invoiceNo => text().unique()();
  TextColumn get supplierId => text().references(Suppliers, #id)();
  IntColumn get date => integer()();
  IntColumn get subtotalMinor => integer()();
  IntColumn get discountMinor => integer().withDefault(const Constant(0))();
  IntColumn get taxMinor => integer().withDefault(const Constant(0))();
  IntColumn get totalMinor => integer()();
  IntColumn get paidMinor => integer().withDefault(const Constant(0))();
  TextColumn get status => text().withDefault(const Constant('unpaid'))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class PurchaseInvoiceItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get invoiceId => text().references(PurchaseInvoices, #id)();
  TextColumn get productId => text().references(Products, #id)();
  IntColumn get qtyNum => integer()();
  IntColumn get qtyDen => integer().withDefault(const Constant(1))();
  TextColumn get unitId => text().references(Units, #id)();
  IntColumn get unitPriceMinor => integer()();
  IntColumn get discountMinor => integer().withDefault(const Constant(0))();
  IntColumn get lineTotalMinor => integer()();
}

class Payments extends Table {
  TextColumn get id => text()();
  TextColumn get paymentNo => text().unique()();
  IntColumn get date => integer()();
  /// receive | pay
  TextColumn get direction => text()();
  TextColumn get partyKind => text()();
  TextColumn get partyId => text()();
  IntColumn get amountMinor => integer()();
  TextColumn get accountId => text().references(CashAccounts, #id)();
  TextColumn get method => text().withDefault(const Constant('cash'))();
  TextColumn get reference => text().withDefault(const Constant(''))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  TextColumn get status => text().withDefault(const Constant('posted'))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class PaymentAllocations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get paymentId => text().references(Payments, #id)();
  /// sale | purchase
  TextColumn get invoiceKind => text()();
  TextColumn get invoiceId => text()();
  IntColumn get amountMinor => integer()();
}

class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get date => integer()();
  TextColumn get category => text()();
  IntColumn get amountMinor => integer()();
  TextColumn get accountId => text().references(CashAccounts, #id)();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get reference => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
}

class IncomeRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get date => integer()();
  TextColumn get category => text()();
  IntColumn get amountMinor => integer()();
  TextColumn get accountId => text().references(CashAccounts, #id)();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get reference => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
}

class AccountTransfers extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get date => integer()();
  TextColumn get fromAccountId => text().references(CashAccounts, #id)();
  TextColumn get toAccountId => text().references(CashAccounts, #id)();
  IntColumn get amountMinor => integer()();
  TextColumn get reference => text().withDefault(const Constant(''))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
}

/// Signed qty delta in product base unit (rational num/den).
class InventoryMovements extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productId => text().references(Products, #id)();
  IntColumn get date => integer()();
  IntColumn get qtyNum => integer()();
  IntColumn get qtyDen => integer().withDefault(const Constant(1))();
  TextColumn get movementType => text()();
  TextColumn get refKind => text()();
  TextColumn get refId => text()();
  IntColumn get unitCostMinor => integer().withDefault(const Constant(0))();
  TextColumn get notes => text().withDefault(const Constant(''))();
}

class ProductionBatches extends Table {
  TextColumn get id => text()();
  TextColumn get batchNo => text().unique()();
  IntColumn get date => integer()();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get labourCostMinor => integer().withDefault(const Constant(0))();
  IntColumn get electricityCostMinor => integer().withDefault(const Constant(0))();
  IntColumn get otherCostMinor => integer().withDefault(const Constant(0))();
  /// completed | draft
  TextColumn get status => text().withDefault(const Constant('completed'))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class ProductionInputs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get batchId => text().references(ProductionBatches, #id)();
  TextColumn get productId => text().references(Products, #id)();
  IntColumn get qtyNum => integer()();
  IntColumn get qtyDen => integer().withDefault(const Constant(1))();
  IntColumn get unitCostMinor => integer().withDefault(const Constant(0))();
}

class ProductionOutputs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get batchId => text().references(ProductionBatches, #id)();
  TextColumn get productId => text().references(Products, #id)();
  IntColumn get qtyNum => integer()();
  IntColumn get qtyDen => integer().withDefault(const Constant(1))();
  IntColumn get unitCostMinor => integer().withDefault(const Constant(0))();
}

class SalesReturns extends Table {
  TextColumn get id => text()();
  TextColumn get returnNo => text().unique()();
  TextColumn get invoiceId => text().references(SalesInvoices, #id)();
  IntColumn get date => integer()();
  IntColumn get totalMinor => integer()();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class SalesReturnItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get returnId => text().references(SalesReturns, #id)();
  TextColumn get productId => text().references(Products, #id)();
  IntColumn get qtyNum => integer()();
  IntColumn get qtyDen => integer().withDefault(const Constant(1))();
  IntColumn get unitPriceMinor => integer()();
  IntColumn get lineTotalMinor => integer()();
}

class PurchaseReturns extends Table {
  TextColumn get id => text()();
  TextColumn get returnNo => text().unique()();
  TextColumn get invoiceId => text().references(PurchaseInvoices, #id)();
  IntColumn get date => integer()();
  IntColumn get totalMinor => integer()();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class PurchaseReturnItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get returnId => text().references(PurchaseReturns, #id)();
  TextColumn get productId => text().references(Products, #id)();
  IntColumn get qtyNum => integer()();
  IntColumn get qtyDen => integer().withDefault(const Constant(1))();
  IntColumn get unitPriceMinor => integer()();
  IntColumn get lineTotalMinor => integer()();
}

class DocumentSequences extends Table {
  TextColumn get docType => text()();
  TextColumn get prefix => text()();
  IntColumn get nextNo => integer().withDefault(const Constant(1))();
  @override
  Set<Column> get primaryKey => {docType};
}

class BackupMeta extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get createdAt => integer()();
  IntColumn get formatVersion => integer()();
  TextColumn get fileName => text()();
  TextColumn get checksum => text().withDefault(const Constant(''))();
}

/// Per-customer payment reminders ("Tareekh Rakhein").
class CustomerReminders extends Table {
  IntColumn get id => integer().autoIncrement()();
  /// references Customers.id (kept as text; no FK cascade so history survives)
  TextColumn get customerId => text()();
  /// ms since epoch
  IntColumn get remindAt => integer()();
  TextColumn get note => text().withDefault(const Constant(''))();
  /// 0 = pending, 1 = done
  IntColumn get done => integer().withDefault(const Constant(0))();
  IntColumn get createdAt => integer()();
}

/// Google Drive backup settings (single row, id = 1).
/// Kept as its own table (rather than BusinessSettings columns) so Drive
/// concerns stay isolated from business profile settings.
class BackupSettings extends Table {
  IntColumn get id => integer()();
  TextColumn get googleAccountEmail => text().withDefault(const Constant(''))();
  /// 0/1 — 24h auto-backup enabled
  IntColumn get autoBackupEnabled => integer().withDefault(const Constant(0))();
  /// ms since epoch of last successful auto-backup; 0 = never
  IntColumn get lastAutoBackupAt => integer().withDefault(const Constant(0))();
  TextColumn get driveFolderId => text().withDefault(const Constant(''))();
  IntColumn get updatedAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [
  BusinessSettings,
  Units,
  UnitConversions,
  Products,
  Customers,
  Suppliers,
  CashAccounts,
  Transactions,
  LedgerEntries,
  SalesInvoices,
  SalesInvoiceItems,
  PurchaseInvoices,
  PurchaseInvoiceItems,
  Payments,
  PaymentAllocations,
  Expenses,
  IncomeRecords,
  AccountTransfers,
  InventoryMovements,
  ProductionBatches,
  ProductionInputs,
  ProductionOutputs,
  SalesReturns,
  SalesReturnItems,
  PurchaseReturns,
  PurchaseReturnItems,
  DocumentSequences,
  BackupMeta,
  CustomerReminders,
  BackupSettings,
])
class AppDatabase extends _$AppDatabase {
  /// Opener for the production database file. Set by platform bootstrap
  /// (which may use path_provider); tests use [forTesting] instead.
  static QueryExecutor Function() openProduction =
      () => throw UnsupportedError('openProduction not initialized');

  AppDatabase() : super(openProduction());
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _seed();
        },
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            // v1 -> v2: WhatsApp numbers, bill images, favorites, reminders,
            // Drive backup settings.
            await m.addColumn(customers, customers.whatsapp);
            await m.addColumn(customers, customers.isFavorite);
            await m.addColumn(suppliers, suppliers.whatsapp);
            await m.addColumn(transactions, transactions.imagePaths);
            await m.createTable(customerReminders);
            await m.createTable(backupSettings);
            // Seed the single BackupSettings row for upgraded databases.
            final now = DateTime.now().millisecondsSinceEpoch;
            await into(backupSettings).insert(BackupSettingsCompanion.insert(
              id: const Value(1),
              updatedAt: now,
            ));
          }
        },
      );

  Future<void> _seed() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    // Default units
    const units = [
      ('kg', 'Kilogram', 'کلوگرام', 'kg'),
      ('g', 'Gram', 'گرام', 'g'),
      ('maund', 'Maund', 'من', 'md'),
      ('ton', 'Metric ton', 'میٹرک ٹن', 't'),
      ('litre', 'Litre', 'لیٹر', 'L'),
      ('bag', 'Bag', 'بوری', 'bag'),
      ('piece', 'Piece', 'عدد', 'pc'),
    ];
    for (final u in units) {
      await into(this.units).insert(UnitsCompanion.insert(
        id: u.$1, nameEn: u.$2, nameUr: u.$3, symbol: u.$4));
    }
    // Conversions (configurable defaults; 1 maund = 40 kg)
    Future<void> conv(String f, String t, int n, int d) =>
        into(unitConversions).insert(UnitConversionsCompanion.insert(
            fromUnitId: f, toUnitId: t, factorNum: n, factorDen: d));
    await conv('g', 'kg', 1, 1000);
    await conv('kg', 'g', 1000, 1);
    await conv('maund', 'kg', 40, 1);
    await conv('kg', 'maund', 1, 40);
    await conv('ton', 'kg', 1000, 1);
    await conv('kg', 'ton', 1, 1000);
    // Default cash account
    await into(cashAccounts).insert(CashAccountsCompanion.insert(
      id: 'cash-1', name: 'Cash', type: 'cash', createdAt: now));
    // Settings row
    await into(businessSettings).insert(BusinessSettingsCompanion.insert(
      id: const Value(1), createdAt: now, updatedAt: now));
    // Drive backup settings row (single row, id = 1)
    await into(backupSettings).insert(BackupSettingsCompanion.insert(
      id: const Value(1), updatedAt: now));
    // Document sequences
    for (final s in ['sale', 'purchase', 'payment', 'batch', 'return', 'txn']) {
      final prefix = {
        'sale': 'SALE-', 'purchase': 'PUR-', 'payment': 'PAY-',
        'batch': 'BATCH-', 'return': 'RET-', 'txn': 'TXN-',
      }[s]!;
      await into(documentSequences).insert(
          DocumentSequencesCompanion.insert(docType: s, prefix: prefix));
    }
  }

  /// Next document number for [docType], e.g. SALE-000123. Atomic within caller txn.
  Future<String> nextDocNo(String docType) async {
    final row = await (select(documentSequences)
          ..where((t) => t.docType.equals(docType)))
        .getSingle();
    final no =
        '${row.prefix}${row.nextNo.toString().padLeft(6, '0')}';
    await (update(documentSequences)
          ..where((t) => t.docType.equals(docType)))
        .write(DocumentSequencesCompanion(nextNo: Value(row.nextNo + 1)));
    return no;
  }
}

// Production database opener lives in db_path.dart (uses path_provider)
// to keep this file importable from pure-Dart tests.

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../data/backup.dart';
import '../data/db.dart';
import '../data/reports.dart';
import '../data/services.dart';

/// Core singletons.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final accountingProvider =
    Provider<AccountingService>((ref) => AccountingService(ref.watch(databaseProvider)));

final reportsProvider =
    Provider<ReportService>((ref) => ReportService(ref.watch(databaseProvider)));

final backupProvider =
    Provider<BackupService>((ref) => BackupService(ref.watch(databaseProvider)));

final secureStorageProvider =
    Provider<FlutterSecureStorage>((ref) => const FlutterSecureStorage());

/// Business settings row (id=1). Null while onboarding not done.
final settingsProvider = StreamProvider<BusinessSetting?>((ref) {
  final db = ref.watch(databaseProvider);
  return (db.select(db.businessSettings)..where((t) => t.id.equals(1)))
      .watchSingleOrNull();
});

/// True when a PIN is set and the app is still locked this launch.
final pinLockedProvider = StateProvider<bool>((ref) => true);

final hasPinProvider = FutureProvider<bool>((ref) async {
  final s = await ref.watch(secureStorageProvider).read(key: 'app_pin');
  return s != null && s.isNotEmpty;
});

/// Dashboard data, refreshed on demand.
final dashboardProvider = FutureProvider<DashboardSummary>((ref) async {
  return ref.watch(reportsProvider).dashboard();
});

/// Active customers, searchable.
final customersProvider =
    FutureProvider.family<List<Customer>, String>((ref, query) async {
  final db = ref.watch(databaseProvider);
  final q = db.select(db.customers)
    ..where((t) => t.active.equals(true))
    ..orderBy([(t) => OrderingTerm.asc(t.name)]);
  if (query.isNotEmpty) {
    q.where((t) =>
        t.name.contains(query) |
        t.phone.contains(query) |
        t.code.contains(query));
  }
  return q.get();
});

final suppliersProvider =
    FutureProvider.family<List<Supplier>, String>((ref, query) async {
  final db = ref.watch(databaseProvider);
  final q = db.select(db.suppliers)
    ..where((t) => t.active.equals(true))
    ..orderBy([(t) => OrderingTerm.asc(t.name)]);
  if (query.isNotEmpty) {
    q.where((t) =>
        t.name.contains(query) |
        t.phone.contains(query) |
        t.code.contains(query));
  }
  return q.get();
});

final productsProvider =
    FutureProvider.family<List<Product>, String>((ref, query) async {
  final db = ref.watch(databaseProvider);
  final q = db.select(db.products)
    ..where((t) => t.active.equals(true))
    ..orderBy([(t) => OrderingTerm.asc(t.name)]);
  if (query.isNotEmpty) {
    q.where((t) => t.name.contains(query));
  }
  return q.get();
});

final cashAccountsProvider = FutureProvider<List<CashAccount>>((ref) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.cashAccounts)
        ..where((t) => t.active.equals(true))
        ..orderBy([(t) => OrderingTerm.asc(t.name)]))
      .get();
});

final unitsProvider = FutureProvider<List<Unit>>((ref) async {
  final db = ref.watch(databaseProvider);
  return db.select(db.units).get();
});

/// Invalidate lists after mutations.
void refreshLists(WidgetRef ref) {
  ref.invalidate(customersProvider);
  ref.invalidate(suppliersProvider);
  ref.invalidate(productsProvider);
  ref.invalidate(cashAccountsProvider);
  ref.invalidate(dashboardProvider);
}

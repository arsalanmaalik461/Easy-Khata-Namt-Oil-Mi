/// Production database file opener (Flutter only, uses path_provider).
/// Imported by the app bootstrap, not by pure-Dart tests.
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'db.dart';
import 'backup.dart';

/// Configures [AppDatabase.openProduction] to open the app's database file.
void initProductionDb() {
  AppDatabase.openProduction = () {
    return LazyDatabase(() async {
      final dir = await getApplicationDocumentsDirectory();
      final file = File(p.join(dir.path, 'namt_oil_mil.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  };
  BackupService.dbPathProvider = () async {
    final dir = await getApplicationDocumentsDirectory();
    return p.join(dir.path, 'namt_oil_mil.sqlite');
  };
}

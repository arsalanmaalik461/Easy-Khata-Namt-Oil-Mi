import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import '../core/result.dart';
import 'db.dart';

const int kBackupFormatVersion = 1;

/// Local backup: copies the SQLite file plus a JSON manifest.
/// The backup is stored OUTSIDE the app database directory when the user
/// picks a location (never the only copy inside the live DB folder).
class BackupService {
  final AppDatabase db;
  BackupService(this.db);

  /// Resolves the live database file path. Set by platform bootstrap;
  /// tests use an explicit path or in-memory DB.
  static Future<String> Function() dbPathProvider =
      () => throw UnsupportedError('dbPathProvider not initialized');

  Future<String> get _dbPath => dbPathProvider();

  /// Create a backup in [targetDir]. Returns the backup file path.
  Future<Result<String>> createBackup(String targetDir) async {
    try {
      final src = File(await _dbPath);
      if (!await src.exists()) {
        return const Err('Database file not found');
      }
      // Checkpoint so WAL content is in the main file.
      await db.customSelect('PRAGMA wal_checkpoint(TRUNCATE);').get();
      final stamp =
          DateTime.now().toIso8601String().replaceAll(':', '-').split('.').first;
      final fileName = 'namt-oil-mil-backup-$stamp.sqlite';
      final dest = File(p.join(targetDir, fileName));
      await src.copy(dest.path);
      final checksum = await _checksum(dest);
      final manifest = {
        'app': 'namt-oil-mil',
        'formatVersion': kBackupFormatVersion,
        'createdAt': DateTime.now().millisecondsSinceEpoch,
        'dbFile': fileName,
        'checksum': checksum,
      };
      await File('${dest.path}.json')
          .writeAsString(jsonEncode(manifest), flush: true);
      await db.into(db.backupMeta).insert(BackupMetaCompanion.insert(
            createdAt: DateTime.now().millisecondsSinceEpoch,
            formatVersion: kBackupFormatVersion,
            fileName: fileName,
            checksum: Value(checksum),
          ));
      return Ok(dest.path);
    } catch (e) {
      return Err('Backup failed: $e');
    }
  }

  /// Validate a backup file before restore.
  Future<Result<bool>> validate(String backupPath) async {
    try {
      final manifestFile = File('$backupPath.json');
      if (!await manifestFile.exists()) {
        return const Err('Manifest missing — not a Namt Oil Mil backup');
      }
      final manifest =
          jsonDecode(await manifestFile.readAsString()) as Map<String, dynamic>;
      if (manifest['app'] != 'namt-oil-mil') {
        return const Err('Not a Namt Oil Mil backup');
      }
      final v = manifest['formatVersion'] as int? ?? 0;
      if (v > kBackupFormatVersion) {
        return const Err(
            'Backup was created by a newer app version and cannot be restored');
      }
      final checksum = await _checksum(File(backupPath));
      if (checksum != manifest['checksum']) {
        return const Err('Backup file is corrupted (checksum mismatch)');
      }
      // Open read-only and check a core table exists.
      final probe = AppDatabase.forTesting(
          // ignore: invalid_use_of_visible_for_testing_member
          _probeExecutor(backupPath));
      try {
        await probe.customSelect('SELECT id FROM business_settings LIMIT 1;').get();
      } finally {
        await probe.close();
      }
      return const Ok(true);
    } catch (e) {
      return Err('Invalid backup: $e');
    }
  }

  /// Replace the live database with [backupPath]. The caller must close the
  /// current database first and reopen afterwards.
  Future<Result<void>> restoreIntoPlace(String backupPath) async {
    try {
      final valid = await validate(backupPath);
      if (!valid.isOk) return Err(valid.error);
      final dest = File(await _dbPath);
      await File(backupPath).copy(dest.path);
      // remove WAL sidecars so the restored file opens cleanly
      for (final ext in ['-wal', '-shm', '-journal']) {
        final f = File('${dest.path}$ext');
        if (await f.exists()) await f.delete();
      }
      return const Ok(null);
    } catch (e) {
      return Err('Restore failed: $e');
    }
  }

  Future<String> _checksum(File f) async {
    // FNV-1a 64-bit over file bytes — integrity check, not security.
    var h = 0xcbf29ce484222325;
    await for (final chunk in f.openRead()) {
      for (final b in chunk) {
        h ^= b;
        h = (h * 0x100000001b3) & 0xFFFFFFFFFFFFFFFF;
      }
    }
    return h.toRadixString(16).padLeft(16, '0');
  }
}

// Minimal read-only probe executor for validation.
QueryExecutor _probeExecutor(String path) =>
    LazyDatabase(() async => NativeDatabase(File(path), logStatements: false));

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:path/path.dart' as p;

import '../core/result.dart';
import 'backup.dart';
import 'db.dart';
import 'google_auth.dart';

/// Uploads database backups (and exported reports) to the user's Google Drive.
///
/// Uses the `drive.file` scope, so the app only sees files it created.
/// Backups live in a "Namt Oil Mil Backups" folder; only the newest
/// [keepCount] auto-backups are retained.
class DriveBackupService {
  final AppDatabase db;
  final GoogleAuthService auth;
  final BackupService localBackup;

  static const String folderName = 'Namt Oil Mil Backups';
  static const int keepCount = 7;

  DriveBackupService(this.db, this.auth) : localBackup = BackupService(db);

  Future<drive.DriveApi?> _driveApi() async {
    final account = auth.currentAccount ?? await auth.signInSilently();
    if (account == null) return null;
    try {
      final client = await auth.rawSignIn.authenticatedClient();
      if (client == null) return null;
      return drive.DriveApi(client);
    } catch (_) {
      return null;
    }
  }

  /// Ensures the backup folder exists; caches its id in BackupSettings.
  Future<String?> _folderId(drive.DriveApi api) async {
    final settings = await _settings();
    if (settings?.driveFolderId.isNotEmpty == true) {
      return settings!.driveFolderId;
    }
    // Look for an existing folder first (drive.file scope).
    final found = await api.files.list(
      q: "name = '$folderName' and mimeType = 'application/vnd.google-apps.folder' "
         "and trashed = false",
      $fields: 'files(id, name)',
    );
    if (found.files?.isNotEmpty == true) {
      final id = found.files!.first.id!;
      await _saveFolderId(id);
      return id;
    }
    final created = await api.files.create(
      drive.File()
        ..name = folderName
        ..mimeType = 'application/vnd.google-apps.folder',
      $fields: 'id',
    );
    final id = created.id!;
    await _saveFolderId(id);
    return id;
  }

  /// Uploads a fresh local backup to Drive. Returns the Drive file id.
  /// When [isAuto] is true, old auto-backups beyond [keepCount] are pruned.
  Future<Result<String>> uploadBackup({bool isAuto = false}) async {
    try {
      final api = await _driveApi();
      if (api == null) {
        return const Err('Google account not connected');
      }
      final folderId = await _folderId(api);
      if (folderId == null) return const Err('Could not create Drive folder');

      // Create the sqlite backup in a temp dir, then upload it.
      final tmp = await Directory.systemTemp.createTemp('namt-drive-');
      try {
        final created = await localBackup.createBackup(tmp.path);
        if (!created.isOk) return Err(created.error);
        final file = File(created.value);
        final stamp = DateTime.now().toIso8601String().replaceAll(':', '-').split('.').first;
        final name = isAuto
            ? 'namt-auto-$stamp.sqlite'
            : 'namt-manual-$stamp.sqlite';
        final media = drive.Media(file.openRead(), await file.length());
        final uploaded = await api.files.create(
          drive.File()
            ..name = name
            ..parents = [folderId],
          uploadMedia: media,
          $fields: 'id, name',
        );
        if (isAuto) await _pruneOld(api, folderId);
        await _recordAutoBackup();
        return Ok(uploaded.id!);
      } finally {
        await tmp.delete(recursive: true);
      }
    } catch (e) {
      return Err('Drive upload failed: $e');
    }
  }

  /// Uploads an already-generated file (e.g. a date-range PDF export).
  Future<Result<String>> uploadFile(String localPath, String name) async {
    try {
      final api = await _driveApi();
      if (api == null) {
        return const Err('Google account not connected');
      }
      final folderId = await _folderId(api);
      if (folderId == null) return const Err('Could not create Drive folder');
      final file = File(localPath);
      final media = drive.Media(file.openRead(), await file.length());
      final uploaded = await api.files.create(
        drive.File()
          ..name = name
          ..parents = [folderId],
        uploadMedia: media,
        $fields: 'id, name',
      );
      return Ok(uploaded.id!);
    } catch (e) {
      return Err('Drive upload failed: $e');
    }
  }

  Future<void> _pruneOld(drive.DriveApi api, String folderId) async {
    try {
      final list = await api.files.list(
        q: "name contains 'namt-auto-' and '$folderId' in parents and trashed = false",
        orderBy: 'createdTime desc',
        pageSize: 50,
        $fields: 'files(id)',
      );
      final files = list.files ?? [];
      for (var i = keepCount; i < files.length; i++) {
        await api.files.delete(files[i].id!);
      }
    } catch (_) {
      // Pruning is best-effort; never fail the backup over it.
    }
  }

  Future<BackupSetting?> _settings() async {
    return (db.select(db.backupSettings)..where((t) => t.id.equals(1)))
        .getSingleOrNull();
  }

  Future<void> _saveFolderId(String id) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await (db.update(db.backupSettings)..where((t) => t.id.equals(1))).write(
      BackupSettingsCompanion(
          driveFolderId: Value(id), updatedAt: Value(now)),
    );
  }

  Future<void> _recordAutoBackup() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await (db.update(db.backupSettings)..where((t) => t.id.equals(1))).write(
      BackupSettingsCompanion(
          lastAutoBackupAt: Value(now), updatedAt: Value(now)),
    );
  }

  /// Human-readable last-backup time, or '' when never.
  Future<String> lastBackupLabel() async {
    final s = await _settings();
    final at = s?.lastAutoBackupAt ?? 0;
    if (at == 0) return '';
    final dt = DateTime.fromMillisecondsSinceEpoch(at);
    return '${dt.day}/${dt.month}/${dt.year} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  /// True when auto-backup is enabled AND a Google account is linked.
  Future<bool> autoBackupReady() async {
    final s = await _settings();
    return (s?.autoBackupEnabled ?? 0) == 1 &&
        (s?.googleAccountEmail.isNotEmpty == true);
  }

  Future<void> setAutoBackupEnabled(bool enabled) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await (db.update(db.backupSettings)..where((t) => t.id.equals(1))).write(
      BackupSettingsCompanion(
        autoBackupEnabled: Value(enabled ? 1 : 0),
        updatedAt: Value(now),
      ),
    );
  }
}

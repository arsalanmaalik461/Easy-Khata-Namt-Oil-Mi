import 'package:drift/drift.dart';
import 'package:workmanager/workmanager.dart';

import 'db.dart';
import 'db_path.dart';
import 'drive_backup.dart';
import 'google_auth.dart';

/// 24-hour automatic Google Drive backup.
///
/// Two layers (Pakistani OEM skins aggressively kill background workers):
/// 1. [Workmanager] periodic task (preferred) — runs even when the app is closed.
/// 2. Foreground fallback — [checkAndRun] is called on every app start and
///    resume; if 24h elapsed since the last backup, it uploads immediately.
///
/// The background isolate opens its own database instance (never shares the
/// UI isolate's open DB) and only uploads — it never writes business data.
class AutoBackup {
  static const String taskName = 'namtAutoBackup';
  static const Duration interval = Duration(hours: 24);

  /// Call once at startup (after [initProductionDb]).
  static Future<void> initialize() async {
    try {
      await Workmanager().initialize(_callbackDispatcher, isInDebugMode: false);
    } catch (_) {
      // WorkManager unavailable (e.g. no Play Services) — foreground
      // fallback in checkAndRun() still covers the user.
    }
  }

  /// Enable/disable the periodic task. Call when the Settings toggle changes.
  static Future<void> setEnabled(bool enabled) async {
    try {
      if (enabled) {
        await Workmanager().registerPeriodicTask(
          taskName,
          taskName,
          frequency: interval,
          constraints: Constraints(
            networkType: NetworkType.connected,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresDeviceIdle: false,
            requiresStorageNotLow: false,
          ),
          existingWorkPolicy: ExistingPeriodicWorkPolicy.replace,
        );
      } else {
        await Workmanager().cancelByUniqueName(taskName);
      }
    } catch (_) {
      // Best effort; foreground fallback remains.
    }
  }

  /// Foreground check: upload now if auto-backup is enabled and 24h elapsed
  /// since the last successful backup. Safe to call on every app start.
  static Future<void> checkAndRun() async {
    try {
      initProductionDb();
      final db = AppDatabase();
      try {
        final settings = await (db.select(db.backupSettings)
              ..where((t) => t.id.equals(1)))
            .getSingleOrNull();
        if (settings == null || settings.autoBackupEnabled != 1) return;
        if (settings.googleAccountEmail.isEmpty) return;
        final now = DateTime.now().millisecondsSinceEpoch;
        if (now - settings.lastAutoBackupAt <
            const Duration(hours: 24).inMilliseconds) {
          return;
        }
        final auth = GoogleAuthService(db);
        final drive = DriveBackupService(db, auth);
        await drive.uploadBackup(isAuto: true);
      } finally {
        await db.close();
      }
    } catch (_) {
      // Auto-backup must never crash the app or block startup.
    }
  }
}

/// WorkManager entry point. Must be top-level with the vm:entry-point pragma.
@pragma('vm:entry-point')
void _callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == AutoBackup.taskName) {
      await AutoBackup.checkAndRun();
    }
    return true;
  });
}

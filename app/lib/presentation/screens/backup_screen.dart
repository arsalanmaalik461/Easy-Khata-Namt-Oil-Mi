import 'package:drift/drift.dart' hide Column;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../widgets/ui.dart';

/// Local backup create / restore. The database is closed during restore
/// and reopened afterwards.
class BackupScreen extends ConsumerStatefulWidget {
  const BackupScreen({super.key});
  @override
  ConsumerState<BackupScreen> createState() => _BackupScreenState();
}

class _BackupScreenState extends ConsumerState<BackupScreen> {
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.backup)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SectionCard(
            title: l.backupNow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(l.lastBackup),
                const SizedBox(height: 8),
                FutureBuilder(
                  future: (db.select(db.backupMeta)
                        ..orderBy([
                          (t) => OrderingTerm.desc(t.createdAt)
                        ])
                        ..limit(1))
                      .getSingleOrNull(),
                  builder: (c, snap) => Text(
                    snap.data == null
                        ? l.never
                        : fmtDateTime(context, snap.data!.createdAt),
                    style:
                        const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: _busy ? null : _create,
                  icon: const Icon(Icons.backup_outlined),
                  label: Text(l.backupNow),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SectionCard(
            title: l.restoreBackup,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton.icon(
                  onPressed: _busy ? null : _restore,
                  icon:
                      const Icon(Icons.restore_outlined),
                  label: Text(l.restoreBackup),
                ),
              ],
            ),
          ),
          if (_busy)
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  Future<void> _create() async {
    final l = L(context);
    final dir = await FilePicker.platform.getDirectoryPath();
    if (dir == null) return;
    setState(() => _busy = true);
    try {
      final res =
          await ref.read(backupProvider).createBackup(dir);
      if (!mounted) return;
      showSnack(context,
          res.isOk ? l.backupCreated : res.error,
          error: !res.isOk);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _restore() async {
    final l = L(context);
    final pick = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['sqlite'],
    );
    final path = pick?.files.single.path;
    if (path == null) return;
    final ok = await confirmDialog(context,
        title: l.restoreBackup, body: l.confirmRestore);
    if (!ok) return;
    setState(() => _busy = true);
    try {
      final svc = ref.read(backupProvider);
      final valid = await svc.validate(path);
      if (!valid.isOk) {
        if (mounted) {
          showSnack(context, valid.error, error: true);
          setState(() => _busy = false);
        }
        return;
      }
      // Close DB, replace file, reopen via fresh provider state.
      final db = ref.read(databaseProvider);
      await db.close();
      final r = await svc.restoreIntoPlace(path);
      if (!r.isOk) {
        if (mounted) {
          showSnack(context, r.error, error: true);
          setState(() => _busy = false);
        }
        return;
      }
      // Force providers to rebuild with a fresh database.
      ref.invalidate(databaseProvider);
      ref.invalidate(settingsProvider);
      refreshLists(ref);
      if (mounted) {
        showSnack(context, l.backupRestored);
        setState(() => _busy = false);
      }
    } catch (e) {
      if (mounted) {
        showSnack(context, l.restoreFailed, error: true);
        setState(() => _busy = false);
      }
    }
  }
}

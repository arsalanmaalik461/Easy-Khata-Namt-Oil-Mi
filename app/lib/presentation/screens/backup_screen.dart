import 'dart:io';

import 'package:drift/drift.dart' hide Column;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/documents.dart';
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
          const SizedBox(height: 12),
          _DateRangeExport(
            busy: _busy,
            setBusy: (v) => setState(() => _busy = v),
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
        showSnack(context, l.restoreFailed(e.toString()), error: true);
        setState(() => _busy = false);
      }
    }
  }
}

/// Custom date-range export: pick from/to dates, generate a summary PDF,
/// then share it (WhatsApp etc.) or upload it to Google Drive.
class _DateRangeExport extends ConsumerStatefulWidget {
  final bool busy;
  final void Function(bool) setBusy;
  const _DateRangeExport({required this.busy, required this.setBusy});

  @override
  ConsumerState<_DateRangeExport> createState() => _DateRangeExportState();
}

class _DateRangeExportState extends ConsumerState<_DateRangeExport> {
  DateTime _from = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime _to = DateTime.now();

  String _fmt(DateTime d) => '${d.day}/${d.month}/${d.year}';

  Future<void> _pick(bool isFrom) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isFrom ? _from : _to,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 1)),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          _from = picked;
          if (_to.isBefore(_from)) _to = _from;
        } else {
          _to = picked;
          if (_from.isAfter(_to)) _from = _to;
        }
      });
    }
  }

  Future<String?> _generatePdf() async {
    final db = ref.read(databaseProvider);
    final bytes = await DocumentService(db).dateRangeSummaryPdf(
      DateTime(_from.year, _from.month, _from.day).millisecondsSinceEpoch,
      DateTime(_to.year, _to.month, _to.day, 23, 59, 59)
          .millisecondsSinceEpoch,
    );
    final dir = await getTemporaryDirectory();
    final stamp =
        '${_from.year}${_from.month.toString().padLeft(2, '0')}${_from.day.toString().padLeft(2, '0')}'
        '-${_to.year}${_to.month.toString().padLeft(2, '0')}${_to.day.toString().padLeft(2, '0')}';
    final file = File('${dir.path}/namt-summary-$stamp.pdf');
    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }

  Future<void> _share() async {
    final l = L(context);
    widget.setBusy(true);
    try {
      final path = await _generatePdf();
      if (path == null || !mounted) return;
      await Share.shareXFiles([XFile(path)],
          text: '${l.exportCustomRange}: ${_fmt(_from)} — ${_fmt(_to)}');
    } catch (e) {
      if (mounted) showSnack(context, l.errorGeneric, error: true);
    } finally {
      widget.setBusy(false);
    }
  }

  Future<void> _uploadDrive() async {
    final l = L(context);
    widget.setBusy(true);
    try {
      final path = await _generatePdf();
      if (path == null || !mounted) return;
      final name = 'namt-summary-${DateTime.now().millisecondsSinceEpoch}.pdf';
      final res =
          await ref.read(driveBackupProvider).uploadFile(path, name);
      if (!mounted) return;
      showSnack(
          context, res.isOk ? l.backupUploaded : res.error,
          error: !res.isOk);
    } catch (e) {
      if (mounted) showSnack(context, l.errorGeneric, error: true);
    } finally {
      widget.setBusy(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    return SectionCard(
      title: l.exportCustomRange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: widget.busy ? null : () => _pick(true),
                  icon: const Icon(Icons.calendar_today_outlined, size: 18),
                  label: Text('${l.from}: ${_fmt(_from)}'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: widget.busy ? null : () => _pick(false),
                  icon: const Icon(Icons.calendar_today_outlined, size: 18),
                  label: Text('${l.to}: ${_fmt(_to)}'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: widget.busy ? null : _share,
                  icon: const Icon(Icons.share_outlined),
                  label: Text(l.share),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: widget.busy ? null : _uploadDrive,
                  icon: const Icon(Icons.cloud_upload_outlined),
                  label: Text(l.driveBackup),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

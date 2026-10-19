import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/auto_backup.dart';
import '../../data/biometric_auth.dart';
import '../../data/db.dart';
import '../providers.dart';
import '../widgets/ui.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});
  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final l = L(context);
    final settings = ref.watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.settings)),
      body: settings.when(
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l.errorGeneric)),
        data: (s) {
          if (s == null) {
            return Center(child: Text(l.errorGeneric));
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SectionCard(
                title: l.businessSettings,
                child: Column(children: [
                  _row(l.businessName, s.businessName,
                      () => _editText(l.businessName,
                          s.businessName, (v) => _save({'businessName': v}))),
                  _row(l.phone, s.phone.isEmpty ? '—' : s.phone,
                      () => _editText(l.phone, s.phone,
                          (v) => _save({'phone': v}))),
                  _row(l.address, s.address.isEmpty ? '—' : s.address,
                      () => _editText(l.address, s.address,
                          (v) => _save({'address': v}))),
                ]),
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: l.language,
                child: Column(children: [
                  RadioListTile<String>(
                      value: 'en',
                      groupValue: s.language,
                      title: const Text('English'),
                      onChanged: (v) =>
                          _save({'language': v!})),
                  RadioListTile<String>(
                      value: 'ur',
                      groupValue: s.language,
                      title: const Text('اردو'),
                      onChanged: (v) =>
                          _save({'language': v!})),
                  RadioListTile<String>(
                      value: 'ur-Latn',
                      groupValue: s.language,
                      title: const Text('Roman Urdu'),
                      onChanged: (v) =>
                          _save({'language': v!})),
                  RadioListTile<String>(
                      value: 'sd',
                      groupValue: s.language,
                      title: const Text('سنڌي'),
                      onChanged: (v) =>
                          _save({'language': v!})),
                ]),
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: l.theme,
                child: Column(children: [
                  RadioListTile<String>(
                      value: 'system',
                      groupValue: s.themeMode,
                      title: Text(l.systemTheme),
                      onChanged: (v) =>
                          _save({'themeMode': v!})),
                  RadioListTile<String>(
                      value: 'light',
                      groupValue: s.themeMode,
                      title: Text(l.lightTheme),
                      onChanged: (v) =>
                          _save({'themeMode': v!})),
                  RadioListTile<String>(
                      value: 'dark',
                      groupValue: s.themeMode,
                      title: Text(l.darkTheme),
                      onChanged: (v) =>
                          _save({'themeMode': v!})),
                ]),
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: l.pinLock,
                child: FutureBuilder<bool>(
                  future: ref
                      .read(secureStorageProvider)
                      .containsKey(key: 'app_pin'),
                  builder: (c, snap) {
                    final has = snap.data ?? false;
                    return Column(children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(has
                            ? l.pinSet
                            : l.setPin),
                        trailing: has
                            ? TextButton(
                                onPressed: _removePin,
                                child: Text(l.delete))
                            : null,
                        onTap: has ? null : _setPin,
                      ),
                      const Divider(height: 1),
                      _FingerprintRow(),
                    ]);
                  },
                ),
              ),
              const SizedBox(height: 12),
              _GoogleDriveSection(ref: ref),
            ],
          );
        },
      ),
    );
  }

  Widget _row(String k, String v, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      title: Text(k,
          style: const TextStyle(color: Colors.grey, fontSize: 12)),
      subtitle: Text(v,
          style: const TextStyle(
              color: Colors.black87, fontSize: 15)),
      trailing: const Icon(Icons.edit_outlined, size: 18),
      onTap: onTap,
    );
  }

  Future<void> _save(Map<String, String> kv) async {
    final db = ref.read(databaseProvider);
    final comp = BusinessSettingsCompanion(
      businessName: kv['businessName'] == null
          ? const Value.absent()
          : Value(kv['businessName']!),
      phone: kv['phone'] == null
          ? const Value.absent()
          : Value(kv['phone']!),
      address: kv['address'] == null
          ? const Value.absent()
          : Value(kv['address']!),
      language: kv['language'] == null
          ? const Value.absent()
          : Value(kv['language']!),
      themeMode: kv['themeMode'] == null
          ? const Value.absent()
          : Value(kv['themeMode']!),
      updatedAt:
          Value(DateTime.now().millisecondsSinceEpoch),
    );
    await (db.update(db.businessSettings)
          ..where((t) => t.id.equals(1)))
        .write(comp);
    ref.invalidate(settingsProvider);
  }

  Future<void> _editText(
      String title, String initial, Function(String) onSave) async {
    final l = L(context);
    final c = TextEditingController(text: initial);
    final ok = await showDialog<bool>(
      context: context,
      builder: (d) => AlertDialog(
        title: Text(title),
        content: TextField(
            controller: c,
            decoration:
                InputDecoration(labelText: title)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(d, false),
              child: Text(l.cancel)),
          FilledButton(
              onPressed: () => Navigator.pop(d, true),
              child: Text(l.save)),
        ],
      ),
    );
    if (ok == true) onSave(c.text.trim());
  }

  Future<void> _setPin() async {
    final l = L(context);
    final c1 = TextEditingController();
    final c2 = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (d) => AlertDialog(
        title: Text(l.setPin),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: c1,
                obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration:
                    InputDecoration(labelText: l.setPin)),
            TextField(
                controller: c2,
                obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration:
                    InputDecoration(labelText: l.confirmPin)),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(d, false),
              child: Text(l.cancel)),
          FilledButton(
              onPressed: () => Navigator.pop(d, true),
              child: Text(l.save)),
        ],
      ),
    );
    if (ok != true) return;
    if (c1.text != c2.text || c1.text.length < 4) {
      if (mounted) showSnack(context, l.pinMismatch, error: true);
      return;
    }
    await ref
        .read(secureStorageProvider)
        .write(key: 'app_pin', value: c1.text);
    if (mounted) {
      showSnack(context, l.pinSet);
      setState(() {});
    }
  }

  Future<void> _removePin() async {
    await ref
        .read(secureStorageProvider)
        .delete(key: 'app_pin');
    if (mounted) {
      showSnack(context, L(context).pinRemoved);
      setState(() {});
    }
  }
}

/// Fingerprint / biometric unlock toggle (new scope #2).
///
/// Uses [BiometricAuthService] (Team B) for capability checks + storage;
/// the toggle UI lives here (Team A).
class _FingerprintRow extends ConsumerStatefulWidget {
  @override
  ConsumerState<_FingerprintRow> createState() =>
      _FingerprintRowState();
}

class _FingerprintRowState
    extends ConsumerState<_FingerprintRow> {
  final _svc = BiometricAuthService();
  bool? _canUse;
  bool? _enabled;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final can = await _svc.canUseBiometrics;
    final en = await _svc.isEnabled;
    if (mounted) {
      setState(() {
        _canUse = can;
        _enabled = en;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    if (_canUse == null) {
      return const ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('…'),
      );
    }
    if (_canUse == false) {
      return ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(l.fingerprintLock),
        subtitle: Text(l.fingerprintNotAvailable,
            style: const TextStyle(fontSize: 12)),
      );
    }
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(l.fingerprintLock),
      subtitle: Text(l.fingerprintHint,
          style: const TextStyle(fontSize: 12)),
      value: _enabled ?? false,
      onChanged: (v) async {
        if (v) {
          // Verify the finger before enabling.
          final res = await _svc.authenticate(
              reason: l.fingerprintLock);
          if (!mounted) return;
          if (!res.isOk || !res.value) {
            showSnack(
                context, l.fingerprintFailed,
                error: true);
            return;
          }
        }
        await _svc.setEnabled(v);
        if (mounted) setState(() => _enabled = v);
      },
    );
  }
}

/// Google account + Drive auto-backup section (Team B).
class _GoogleDriveSection extends ConsumerStatefulWidget {
  final WidgetRef ref;
  const _GoogleDriveSection({required this.ref});

  @override
  ConsumerState<_GoogleDriveSection> createState() =>
      _GoogleDriveSectionState();
}

class _GoogleDriveSectionState
    extends ConsumerState<_GoogleDriveSection> {
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    final driveSettings = ref.watch(driveSettingsProvider);
    return SectionCard(
      title: l.googleBackup,
      child: Column(
        children: [
          driveSettings.when(
            loading: () => const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),
            error: (_, __) => Text(l.errorGeneric),
            data: (s) {
              final email = s?.googleAccountEmail ?? '';
              final linked = email.isNotEmpty;
              final autoOn = (s?.autoBackupEnabled ?? 0) == 1;
              return Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.cloud_outlined),
                    title: Text(linked
                        ? l.googleConnectedAs(email)
                        : l.connectGoogle),
                    subtitle: linked ? null : Text(l.googleBackupHint),
                    trailing: _busy
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                                strokeWidth: 2))
                        : TextButton(
                            onPressed: () => linked
                                ? _disconnect()
                                : _connect(),
                            child: Text(linked
                                ? l.disconnectGoogle
                                : l.connectGoogle),
                          ),
                  ),
                  if (linked) ...[
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(l.autoBackup24h),
                      subtitle: Text(l.autoBackup24hHint),
                      value: autoOn,
                      onChanged: _busy ? null : _toggleAuto,
                    ),
                    FutureBuilder<String>(
                      future: ref
                          .read(driveBackupProvider)
                          .lastBackupLabel(),
                      builder: (c, snap) {
                        final label = snap.data ?? '';
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(l.lastAutoBackup),
                          trailing: Text(
                              label.isEmpty ? l.never : label),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FilledButton.tonal(
                        onPressed: _busy ? null : _backupNow,
                        child: Text(l.backupNowDrive),
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _connect() async {
    setState(() => _busy = true);
    try {
      final res =
          await ref.read(googleAuthProvider).signIn();
      if (!mounted) return;
      if (res.isOk) {
        showSnack(context, L(context).googleConnected);
      } else {
        showSnack(context, res.error, error: true);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
      ref.invalidate(driveSettingsProvider);
    }
  }

  Future<void> _disconnect() async {
    final l = L(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (d) => AlertDialog(
        title: Text(l.disconnectGoogle),
        content: Text(l.googleDisconnectConfirm),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(d, false),
              child: Text(l.cancel)),
          FilledButton(
              onPressed: () => Navigator.pop(d, true),
              child: Text(l.ok)),
        ],
      ),
    );
    if (confirm != true) return;
    setState(() => _busy = true);
    try {
      await ref.read(googleAuthProvider).signOut();
      await AutoBackup.setEnabled(false);
      if (mounted) showSnack(context, l.googleDisconnected);
    } finally {
      if (mounted) setState(() => _busy = false);
      ref.invalidate(driveSettingsProvider);
    }
  }

  Future<void> _toggleAuto(bool v) async {
    setState(() => _busy = true);
    try {
      await ref.read(driveBackupProvider).setAutoBackupEnabled(v);
      await AutoBackup.setEnabled(v);
      ref.invalidate(driveSettingsProvider);
      if (mounted && v) {
        // Try an immediate backup so the user sees it working.
        showSnack(context, L(context).autoBackupEnabled);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _backupNow() async {
    setState(() => _busy = true);
    try {
      final res =
          await ref.read(driveBackupProvider).uploadBackup();
      if (!mounted) return;
      final l = L(context);
      if (res.isOk) {
        showSnack(context, l.backupUploaded);
      } else {
        showSnack(context,
            l.backupUploadFailed(res.error), error: true);
      }
      ref.invalidate(driveSettingsProvider);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }
}

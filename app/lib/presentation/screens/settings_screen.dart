import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
                    ]);
                  },
                ),
              ),
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

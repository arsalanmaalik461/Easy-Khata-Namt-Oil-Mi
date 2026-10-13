import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/db.dart';
import '../providers.dart';
import '../widgets/ui.dart';

/// First-launch setup: business name + language. Works fully offline.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});
  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _name = TextEditingController(text: 'Namt Oil Mil');
  final _phone = TextEditingController();
  String _lang = 'en';

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 32),
            const Icon(Icons.oil_barrel_outlined,
                size: 72, color: Color(0xFF0E6B4D)),
            const SizedBox(height: 16),
            Text(l.firstLaunchTitle,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(l.firstLaunchBody,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 32),
            TextField(
                controller: _name,
                decoration:
                    InputDecoration(labelText: l.businessName)),
            const SizedBox(height: 16),
            TextField(
                controller: _phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: l.phone)),
            const SizedBox(height: 16),
            Text(l.language,
                style: Theme.of(context).textTheme.titleSmall),
            RadioListTile<String>(
              value: 'en',
              groupValue: _lang,
              title: const Text('English'),
              onChanged: (v) => setState(() => _lang = v!),
            ),
            RadioListTile<String>(
              value: 'ur',
              groupValue: _lang,
              title: const Text('اردو'),
              onChanged: (v) => setState(() => _lang = v!),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _finish,
              child: Text(l.getStarted),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _finish() async {
    final db = ref.read(databaseProvider);
    final now = DateTime.now().millisecondsSinceEpoch;
    await (db.update(db.businessSettings)
          ..where((t) => t.id.equals(1)))
        .write(BusinessSettingsCompanion(
      businessName: Value(_name.text.trim().isEmpty
          ? 'Namt Oil Mil'
          : _name.text.trim()),
      phone: Value(_phone.text.trim()),
      language: Value(_lang),
      onboarded: const Value(true),
      updatedAt: Value(now),
    ));
    ref.invalidate(settingsProvider);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../widgets/ui.dart';

/// PIN gate. PIN is stored in secure storage (not in the database).
/// Honest scope: keeps casual snoopers out; not server-grade security.
class PinScreen extends ConsumerStatefulWidget {
  const PinScreen({super.key});
  @override
  ConsumerState<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends ConsumerState<PinScreen> {
  final _pin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock_outline,
                  size: 64, color: Color(0xFF0E6B4D)),
              const SizedBox(height: 24),
              Text(l.enterPin,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              TextField(
                controller: _pin,
                obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
                decoration: const InputDecoration(counterText: ''),
                onSubmitted: (_) => _unlock(),
              ),
              const SizedBox(height: 16),
              FilledButton(
                  onPressed: _unlock, child: Text(l.confirm)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _unlock() async {
    final l = L(context);
    final saved =
        await ref.read(secureStorageProvider).read(key: 'app_pin');
    if (_pin.text == saved) {
      ref.read(pinLockedProvider.notifier).state = false;
    } else {
      if (mounted) showSnack(context, l.wrongPin, error: true);
    }
  }
}

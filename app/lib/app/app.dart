import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/providers.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/onboarding_screen.dart';
import '../presentation/screens/pin_screen.dart';
import 'theme.dart';

class NamtApp extends ConsumerWidget {
  const NamtApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final locale = Locale(settings.valueOrNull?.language ?? 'en');
    final mode = switch (settings.valueOrNull?.themeMode) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
    return MaterialApp(
      title: 'Namt Oil Mil',
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      themeMode: mode,
      locale: locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ur')],
      home: const _Gate(),
    );
  }
}

/// Decides: onboarding -> PIN -> home.
class _Gate extends ConsumerWidget {
  const _Gate();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    return settings.when(
      loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(
          body: Center(child: Text('Database error: $e'))),
      data: (s) {
        if (s == null || !s.onboarded) return const OnboardingScreen();
        final hasPin = ref.watch(hasPinProvider);
        final locked = ref.watch(pinLockedProvider);
        return hasPin.when(
          loading: () => const Scaffold(
              body: Center(child: CircularProgressIndicator())),
          error: (_, __) => const HomeScreen(),
          data: (hp) => (hp && locked) ? const PinScreen() : const HomeScreen(),
        );
      },
    );
  }
}

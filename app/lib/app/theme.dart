import 'package:flutter/material.dart';

/// Namt Oil Mil design system.
class AppColors {
  static const emerald = Color(0xFF0E6B4D);
  static const emeraldDark = Color(0xFF0A523B);
  static const emeraldLight = Color(0xFFE3F2EA);
  static const navy = Color(0xFF1B2A4A);
  static const gold = Color(0xFFC9A227);
  static const goldLight = Color(0xFFFBF3DC);
  static const bgLight = Color(0xFFF7F5F0);
  static const surfaceLight = Colors.white;
  static const bgDark = Color(0xFF14171B);
  static const surfaceDark = Color(0xFF1E2228);
  static const danger = Color(0xFFC0392B);
  static const dangerLight = Color(0xFFFDECEA);
  static const success = Color(0xFF1E8449);
  static const warn = Color(0xFFB7791F);
  static const textMuted = Color(0xFF6B7280);
}

ThemeData buildLightTheme() {
  final base = ThemeData.light(useMaterial3: true);
  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.emerald,
    primary: AppColors.emerald,
    secondary: AppColors.navy,
    tertiary: AppColors.gold,
    surface: AppColors.surfaceLight,
  );
  return base.copyWith(
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.bgLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.emerald,
      foregroundColor: Colors.white,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.emerald,
        foregroundColor: Colors.white,
        minimumSize: const Size(48, 48),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}

ThemeData buildDarkTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.emerald,
    brightness: Brightness.dark,
    primary: const Color(0xFF3FB27F),
    secondary: const Color(0xFF8FA3C7),
    tertiary: AppColors.gold,
    surface: AppColors.surfaceDark,
  );
  return base.copyWith(
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.bgDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0A3D2C),
      foregroundColor: Colors.white,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(48, 48),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}

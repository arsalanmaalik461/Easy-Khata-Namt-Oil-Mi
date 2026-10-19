import 'package:flutter/material.dart';

/// Namt Oil Mil design system — EasyKhata-style neutral palette.
///
/// Money semantics: red = "diye" (given / receivable), green = "liye"
/// (received / payable). Everything else is neutral black/white/gray.
class AppColors {
  // EasyKhata tokens
  static const bg = Color(0xFFF4F6F8);
  static const card = Colors.white;
  static const diye = Color(0xFFE53935);
  static const diyeLight = Color(0xFFFDECEA);
  static const liye = Color(0xFF43A047);
  static const liyeLight = Color(0xFFE8F5E9);
  static const ink = Color(0xFF1A1D21);
  static const muted = Color(0xFF8A94A6);
  static const ctaBlack = Color(0xFF111111);
  static const bannerBlue = Color(0xFFE3F2FD);
  static const whatsapp = Color(0xFF25D366);
  static const smsBlue = Color(0xFF1A73E8);

  // Dark-mode equivalents
  static const bgDark = Color(0xFF121417);
  static const cardDark = Color(0xFF1C1F24);
  static const inkDark = Color(0xFFF2F4F7);
  static const mutedDark = Color(0xFF9AA3B2);
  static const diyeDark = Color(0xFFEF6C64);
  static const diyeLightDark = Color(0xFF3A2320);
  static const liyeDark = Color(0xFF66BB6A);
  static const liyeLightDark = Color(0xFF1E3325);

  // ---- Legacy aliases (kept so old screens keep compiling) ----
  /// Prefer [diye]/[liye] for money semantics.
  static const danger = diye;
  static const dangerLight = diyeLight;
  static const success = liye;
  static const warn = Color(0xFFB7791F);
  static const textMuted = muted;
  static const emerald = Color(0xFF1A1D21);
  static const emeraldDark = Color(0xFF111111);
  static const emeraldLight = Color(0xFFE8EAED);
  static const navy = Color(0xFF1A1D21);
  static const gold = Color(0xFF8A94A6);
  static const goldLight = Color(0xFFF4F6F8);
  static const bgLight = bg;
  static const surfaceLight = card;
  static const surfaceDark = cardDark;
}

/// Uppercase letterspaced card label style (e.g. "KULL SALES").
TextStyle ekLabelStyle(BuildContext c, {Color? color}) {
  final muted = Theme.of(c).brightness == Brightness.dark
      ? AppColors.mutedDark
      : AppColors.muted;
  return TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.1,
    color: color ?? muted,
  );
}

ThemeData buildLightTheme() {
  final base = ThemeData.light(useMaterial3: true);
  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.ink,
    primary: AppColors.ink,
    secondary: AppColors.muted,
    surface: AppColors.card,
    error: AppColors.diye,
  );
  return base.copyWith(
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.bg,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bg,
      foregroundColor: AppColors.ink,
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.card,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.card,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.ctaBlack,
        foregroundColor: Colors.white,
        minimumSize: const Size(48, 56),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.card,
      indicatorColor: Colors.transparent,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final sel = states.contains(WidgetState.selected);
        return TextStyle(
            fontSize: 12,
            fontWeight: sel ? FontWeight.w700 : FontWeight.w500,
            color: sel ? AppColors.ink : AppColors.muted);
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final sel = states.contains(WidgetState.selected);
        return IconThemeData(
            color: sel ? AppColors.ink : AppColors.muted, size: 26);
      }),
    ),
  );
}

ThemeData buildDarkTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.inkDark,
    brightness: Brightness.dark,
    primary: AppColors.inkDark,
    secondary: AppColors.mutedDark,
    surface: AppColors.cardDark,
    error: AppColors.diyeDark,
  );
  return base.copyWith(
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.bgDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bgDark,
      foregroundColor: AppColors.inkDark,
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.cardDark,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cardDark,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.ink,
        minimumSize: const Size(48, 56),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.cardDark,
      indicatorColor: Colors.transparent,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final sel = states.contains(WidgetState.selected);
        return TextStyle(
            fontSize: 12,
            fontWeight: sel ? FontWeight.w700 : FontWeight.w500,
            color: sel ? AppColors.inkDark : AppColors.mutedDark);
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final sel = states.contains(WidgetState.selected);
        return IconThemeData(
            color: sel ? AppColors.inkDark : AppColors.mutedDark,
            size: 26);
      }),
    ),
  );
}

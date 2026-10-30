import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:namt_oil_mil/app/app.dart';
import 'package:namt_oil_mil/app/theme.dart';

/// Team C locale tests: Urdu-script detection, RTL direction, and the
/// Jameel Noori Nastaleeq theme application.
void main() {
  test('isUrduScriptLocale: only Urdu in Urdu script', () {
    expect(isUrduScriptLocale(const Locale('ur')), isTrue);
    expect(
      isUrduScriptLocale(
        Locale.fromSubtags(languageCode: 'ur', scriptCode: 'Latn'),
      ),
      isFalse,
    );
    expect(isUrduScriptLocale(const Locale('en')), isFalse);
    expect(isUrduScriptLocale(const Locale('sd')), isFalse);
  });

  test('textDirectionForLocale: RTL only for Urdu script', () {
    expect(textDirectionForLocale(const Locale('ur')), TextDirection.rtl);
    expect(textDirectionForLocale(const Locale('en')), TextDirection.ltr);
    expect(
      textDirectionForLocale(
        Locale.fromSubtags(languageCode: 'ur', scriptCode: 'Latn'),
      ),
      TextDirection.ltr,
    );
  });

  test('themeForLocale applies Jameel only in Urdu mode', () {
    final light = buildLightTheme();
    final urduTheme = themeForLocale(light, const Locale('ur'));
    expect(urduTheme.textTheme.bodyMedium?.fontFamily, 'JameelNooriNastaleeq');
    expect(urduTheme.textTheme.titleLarge?.fontFamily, 'JameelNooriNastaleeq');
    // Other locales keep the base theme untouched.
    expect(identical(themeForLocale(light, const Locale('en')), light), isTrue);
    expect(
      identical(
        themeForLocale(
          light,
          Locale.fromSubtags(languageCode: 'ur', scriptCode: 'Latn'),
        ),
        light,
      ),
      isTrue,
    );
  });

  test('parseLocale maps stored codes', () {
    expect(NamtApp.parseLocale('ur'), const Locale('ur'));
    expect(
      NamtApp.parseLocale('ur-Latn'),
      Locale.fromSubtags(languageCode: 'ur', scriptCode: 'Latn'),
    );
    expect(NamtApp.parseLocale('sd'), const Locale('sd'));
    expect(NamtApp.parseLocale('en'), const Locale('en'));
    expect(NamtApp.parseLocale(null), const Locale('en'));
    expect(NamtApp.parseLocale('xx'), const Locale('en'));
  });
}

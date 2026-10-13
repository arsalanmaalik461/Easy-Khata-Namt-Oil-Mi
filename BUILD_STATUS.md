# Namt Oil Mil — Build & Status Report

**Date:** 2026-10-14
**Status:** Source complete, all tests passing. APK build blocked by sandbox network.

## What's Done ✅

### Source Code (100% complete)
- **Location:** `/home/hatch/workspace/namt-oil-mil/app/`
- **Features:** Customers, suppliers, khata ledgers, sales, purchases, returns,
  inventory, oil-mill production batches, expenses/income, cashbook/bank,
  reports (dashboard, P&L), PDF invoices/receipts/statements, backup/restore,
  PIN security, English/Urdu (RTL) UI, emerald/navy/gold theme.

### Tests (51/51 passing ✅)
- **Unit tests:** 24/24 passed
  - `test/run_unit.dart` — Money (exact paisa arithmetic), Qty (rational quantities),
    Accounting (balance directions, invoice status, transfer conservation, P&L)
- **Integration tests:** 27/27 passed
  - `test/run_integration.dart` — Real SQLite database workflows:
    - Customer credit sale → partial payment → ledger reconciliation
    - Supplier purchase → payment → inventory update
    - Production batch (input consumption, output creation, insufficient-stock rejection)
    - Cash/bank transfers (not double-counted as income/expense)
    - Database persistence across close/reopen
    - Backup file validation (rejects invalid files)

### Code Generation
- **Drift database:** `lib/data/db.g.dart` (928KB, generated via build_runner)
- **Localization:** 300 strings EN/UR in `.dart_tool/flutter_gen/`

### Android Setup
- **SDK:** Platform android-35, build-tools 35.0.1 downloaded
- **Project structure:** `android/` with build.gradle, AndroidManifest.xml, MainActivity.kt
- **Flutter configured:** Android SDK path set

## What's Blocked ❌

### APK Build
**Blocker:** The sandbox's network proxy works for curl/Python but Java's HTTP
client cannot authenticate through it (fails on HTTPS CONNECT tunneling).
Gradle needs to download the Android Gradle Plugin (~100 artifacts) via Java,
which is impossible in this environment.

**Evidence:**
- `curl` downloads work fine (used for SDK, Flutter, Gradle)
- Java `HttpURLConnection` fails with `NoSuchElementException` in `doTunneling0`
- Gradle reports "Unsupported or unrecognized SSL message"
- Tried: proxy config in gradle.properties, GRADLE_OPTS, manual Maven fetch (98 artifacts, but POMs were HTML error pages)

## How to Build the APK

On any machine with direct internet access (no restrictive proxy):

```bash
cd /home/hatch/workspace/namt-oil-mil/app

# 1. Get packages (needs internet once)
flutter pub get

# 2. Generate code (if schema changed)
dart run build_runner build --delete-conflicting-outputs

# 3. Generate localizations
flutter gen-l10n

# 4. Build APK
flutter build apk --release

# APK output:
# build/app/outputs/flutter-apk/app-release.apk
```

**Prerequisites:**
- Flutter 3.47.7+ (or `flutter upgrade`)
- Android SDK with platform-35 and build-tools
- JDK 17

## Test Commands

```bash
cd /home/hatch/workspace/namt-oil-mil/app

# Unit tests (pure Dart, no Flutter needed)
dart --packages=.dart_tool/package_config.json test/run_unit.dart

# Integration tests (needs system sqlite3)
LD_PRELOAD=/lib/x86_64-linux-gnu/libsqlite3.so.0 \
  dart --packages=.dart_tool/package_config.json test/run_integration.dart
```

## Architecture Notes

- **Money:** Integer paisa (no floating point)
- **Quantities:** Rational numbers (exact fractions)
- **Accounting:** Central service, UI never mutates balances directly
- **Customer balance:** Positive = owes business, Negative = advance
- **Supplier balance:** Positive = business owes, Negative = advance
- **Database:** Drift + SQLite, offline-first, no Firebase required

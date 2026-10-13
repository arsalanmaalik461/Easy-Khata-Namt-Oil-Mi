# Easy-Khata-Namt-Oil-Mi

**Namt Oil Mil** — Android-first Flutter/Dart khata & accounting app for an oil-mill business.
Functional reference: Easy Khata (digital khata patterns). Offline-first, no cloud required.

## Features
- Customers & suppliers khata with running balances (udhaar / advance)
- Sales, purchases, sales returns with invoices
- Inventory with rational quantities & unit conversions
- Oil-mill production batches (input consumption → oil + cake output, yield)
- Cashbook / bank accounts, transfers, expenses, other income
- Reports: dashboard, profit & loss, party ledgers & statements
- PDF: sale invoice, payment receipt, customer statement
- Backup & restore (SQLite file + checksum manifest)
- PIN lock, English + Urdu (RTL) UI, emerald/navy/gold theme
- Offline-first: everything works without internet

## Tech
- Flutter 3.47.7, Dart 3.13.5, Riverpod, Drift (SQLite)
- Money as integer paisa — no floating point. Quantities as exact rationals.

## Tests
51/51 passing (verified 2026-10-14):
- `test/run_unit.dart` — 24 unit tests (money, qty, accounting)
- `test/run_integration.dart` — 27 integration tests on real SQLite
  (sale→payment→ledger, purchase→payment→stock, production, transfers,
  close/reopen persistence, backup validation)

Run:
```bash
dart --packages=.dart_tool/package_config.json test/run_unit.dart
LD_PRELOAD=/lib/x86_64-linux-gnu/libsqlite3.so.0 \
  dart --packages=.dart_tool/package_config.json test/run_integration.dart
```

## Build APK
```bash
flutter pub get
flutter gen-l10n            # if ARB strings changed
dart run build_runner build --delete-conflicting-outputs  # if schema changed
flutter build apk --release
# → build/app/outputs/flutter-apk/app-release.apk
```
Requires: Flutter SDK, Android SDK (platform-35, build-tools), JDK 17.

## Project layout
- `app/lib/` — application source (34 Dart files)
- `app/lib/data/` — Drift schema (`db.dart`), services, reports, backup, PDF
- `app/lib/l10n/` — `app_en.arb`, `app_ur.arb` (~300 strings)
- `app/test/` — unit + integration tests
- `DESIGN.md` — architecture & accounting conventions
- `BUILD_STATUS.md` — detailed build/test report

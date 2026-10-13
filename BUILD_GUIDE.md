# BUILD_GUIDE.md — Namt Oil Mil

Step-by-step instructions to build the Namt Oil Mil Android APK on a normal
machine with direct internet access.

## 1. Prerequisites

| Tool | Version | Notes |
|------|---------|-------|
| Flutter SDK | 3.47.7+ (stable) | https://docs.flutter.dev/get-started/install |
| Android SDK | platform-35, build-tools 35.x | Via Android Studio or `sdkmanager` |
| JDK | 17 | Temurin 17 or Oracle 17 |

Verify:
```bash
flutter --version   # Flutter 3.47.7+, Dart 3.13.5+
java -version       # 17.x
```

## 2. Clone

```bash
git clone https://github.com/arsalanmaalik461/Easy-Khata-Namt-Oil-Mi.git
cd Easy-Khata-Namt-Oil-Mi/app
```

## 3. Install dependencies

```bash
flutter pub get
```

This resolves all packages from `pubspec.lock` (drift, riverpod, pdf, etc.).

## 4. Generate code (only needed after schema/ARB changes)

The repo ships with generated files (`lib/data/db.g.dart`) already committed.
Regenerate only if you change `lib/data/db.dart` or `lib/l10n/*.arb`:

```bash
# Drift database code
dart run build_runner build --delete-conflicting-outputs

# Localizations (EN/UR)
flutter gen-l10n
```

## 5. Configure Android SDK path

```bash
cp android/local.properties.template android/local.properties
```

Edit `android/local.properties` with your paths:

```properties
flutter.sdk=/path/to/flutter
sdk.dir=/path/to/android-sdk
```

Alternatively: `flutter config --android-sdk /path/to/android-sdk`

## 6. Build the APK

Debug (fast, for testing):
```bash
flutter build apk --debug
```

Release (for distribution):
```bash
flutter build apk --release
```

Output:
```
build/app/outputs/flutter-apk/app-release.apk
```

For Play Store bundle:
```bash
flutter build appbundle --release
# → build/app/outputs/bundle/release/app-release.aab
```

## 7. Run the tests

Unit tests (pure Dart, no device needed):
```bash
dart test test/unit/
```

Integration tests (real SQLite, needs system sqlite3 on Linux):
```bash
# Linux:
LD_PRELOAD=/lib/x86_64-linux-gnu/libsqlite3.so.0 dart test test/integration/
# Or simply:
flutter test
```

Expected: **51/51 passing** (24 unit + 27 integration).

## 8. Analyze

```bash
flutter analyze
```

Should report 0 errors. (A few `info`-level deprecation hints about the
`Radio` widget API are known and harmless.)

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `flutter pub get` fails | Check internet; delete `pubspec.lock` and retry (but prefer the committed lockfile) |
| `db.g.dart` out of date | Run `dart run build_runner build --delete-conflicting-outputs` |
| Missing localizations | Run `flutter gen-l10n` |
| `Unable to locate Android SDK` | Set `sdk.dir` in `android/local.properties` or `ANDROID_HOME` env |
| Gradle download slow | First build downloads AGP + deps (~200 MB); subsequent builds are fast |
| `local.properties` missing | Copy from `local.properties.template` (step 5) |

## Project layout

```
app/
├── lib/
│   ├── main.dart            # Entry point
│   ├── app/                 # App widget + theme
│   ├── core/                # Money (int paisa), Qty (rational), Result
│   ├── domain/              # Accounting rules
│   ├── data/                # Drift DB, services, reports, backup, PDF
│   ├── l10n/                # app_en.arb, app_ur.arb (~300 strings)
│   └── presentation/        # Screens, widgets, providers
├── test/
│   ├── unit/                # money, units, accounting tests
│   └── integration/         # DB workflow tests
└── android/                 # Android project (package: com.namtoilmil.namt_oil_mil)
```

## Notes

- **Offline-first:** the app works fully without internet. No Firebase required.
- **Money:** stored as integer paisa — never floats.
- **Balances:** customer positive = owes business; supplier positive = business owes.
- **Database:** SQLite via Drift, file at app documents dir (`namt_oil_mil.sqlite`).

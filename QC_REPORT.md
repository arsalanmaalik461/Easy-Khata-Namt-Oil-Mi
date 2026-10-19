# QC Report — Namt Oil Mil App Update

**Date:** 2026-10-19 ~00:50 PKT
**QC Team verdict:** ✅ **READY FOR BUILD**

## 1. Static Analysis

| Check | Result |
|---|---|
| `flutter analyze lib` errors | **0 errors** ✅ |
| Warnings/info | 32 (unused imports, deprecated Radio groupValue — all minor/pre-existing) |

## 2. Unit Tests

| Check | Result |
|---|---|
| `dart run test/run_unit.dart` | **24/24 passed** ✅ |

## 3. Integration Tests

| Check | Result |
|---|---|
| `dart run test/run_integration.dart` | **37/37 passed** ✅ |
| Includes Migration v1→v2 test | ✅ |

## 4. Feature Verification

| # | Feature | Status | Evidence |
|---|---|---|---|
| 1 | EasyKhata theme (neutral palette `0xFFF4F6F8`, red `0xFFE53935`=diye, green `0xFF43A047`=liye, black CTAs) | ✅ | `lib/app/theme.dart` rewritten |
| 2 | 3-tab navigation (Khata/Sales/Account) | ✅ | `home_screen.dart` — 3 tabs |
| 3 | Sales dashboard screen | ✅ | `lib/presentation/screens/sales_dashboard_screen.dart` (Hafta/Maheena/Apni-marzi, 4 stat cards, search, +Sale CTA) |
| 4 | Google Sign-In service | ✅ | `lib/data/google_auth.dart` |
| 5 | Settings Google connect UI | ✅ | `settings_screen.dart` — 21 google refs, connect/disconnect, auto-backup toggle, backup-now |
| 6 | Drive backup service | ✅ | `lib/data/drive_backup.dart` |
| 7 | 24h auto-backup | ✅ | `lib/data/auto_backup.dart` (workmanager + foreground fallback), `AutoBackup.initialize()` called in `main.dart` |
| 8 | WhatsApp number field on customer/supplier form | ✅ | `party_form_screen.dart` — 10 whatsapp refs, defaults to phone |
| 9 | WhatsApp/SMS buttons on party detail | ✅ | `party_detail_screen.dart` — Tareekh/SMS/WhatsApp action row via template picker |
| 10 | Calculator keypad on entry forms | ✅ | `widgets/ek.dart` (CalculatorKeypad), `txn_form_screen.dart`, `sale_form_screen.dart` |
| 11 | Bill image picker | ✅ | `widgets/ek.dart` (BillImagePicker), Camera/Gallery bottom sheet in txn form |
| 12 | Roman Urdu (`ur-Latn`) locale | ✅ | `lib/l10n/app_ur_Latn.arb` + generated `app_localizations_ur_Latn.dart`, parsed in `app.dart` |
| 13 | Sindhi (`sd`) locale | ✅ | `lib/l10n/app_sd.arb` + generated `app_localizations_sd.dart`, parsed in `app.dart` |
| 14 | Fingerprint auth backend | ✅ | `lib/data/biometric_auth.dart`, toggle in settings |
| 15 | Custom date-range export | ✅ | `documents.dart: dateRangeSummaryPdf`, `ek.dart: DateRangeField`, wired in backup screen |
| 16 | DB schema v2 (whatsapp cols, reminders table, imagePaths) | ✅ | `schemaVersion => 2`, migration test passes |
| 17 | Pakistani number normalization (03XX→923XX) | ✅ | `lib/core/phone.dart` |
| 18 | Reminder message templates (UR/EN) | ✅ | `lib/core/message_templates.dart` |
| 19 | Contact picker | ✅ | `lib/data/contact_picker.dart` |
| 20 | WhatsApp `<queries>` in AndroidManifest | ✅ | 2 refs for Android 11+ visibility |

## 5. Team A + Team B Integration

- Both commits present: `ae6df21` (Team A UI), `7a6a121` (Team B features)
- No merge conflicts; tree compiles with 0 analyzer errors
- Team B services consumed by Team A UI (message templates, PartyActions.shareStatementPdf, reminders, biometric, contact picker)
- Note: Team B's uncommitted files were left untouched by Team A; `db.g.dart` was regenerated against v2 schema

## 6. Known Limitations (not blockers)

1. **Google Drive backup needs OAuth client:** App works fully offline; Drive shows "not connected" until a Google Cloud OAuth client with the release SHA-1 is configured. Documented in BUILD_GUIDE.md. Rehan action required post-build.
2. **Fingerprint requires device hardware:** Gracefully absent on unsupported devices.
3. **Deprecated Radio warnings:** Pre-existing Flutter 3.47 deprecation notices; do not affect builds.

## Final Verdict

✅ **READY FOR BUILD** — All checks pass. Proceed to GitHub Actions APK build (`flutter build apk --release`), then sign, verify signature/package, upload to Drive, and deliver the link.

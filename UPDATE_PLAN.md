# Namt Oil Mil — Update Plan (EasyKhata UI + 4 New Features)

**Date:** 2026-10-18
**Status:** PLANNING — ready for execution teams
**Note:** `UPDATE_RESEARCH.md` was not present when this plan was written. The planner
analyzed all 10 EasyKhata screenshots from Rehan's message directly. When the research
team's file lands, both execution teams MUST merge any conflicting findings before coding.

---

## 1. What Rehan asked for (from his message + 10 screenshots)

1. **EasyKhata look & feel** — whole app recolored/restyled like the screenshots:
   light gray-blue background, white rounded cards, red/green money semantics,
   big black rounded CTA buttons, bottom nav **Khata / Sales / Account**.
2. **All screenshot features the app lacks** — Sales dashboard (KULL SALES / ORDERS /
   NAQAD / UDHAAR cards, Hafta-Maheena-Apni marzi filters), customer detail with
   **Tareekh Rakhein / SMS / WhatsApp** action row, TIME/DIYE/LIYE ledger table,
   red **"Mainey Diye"** + green **"Mainey Liye"** bottom action bar, bill-photo
   attach ("Add bills"), date picker on entries.
3. **Google account connect in Settings** — a button that opens Google's sign-in
   screen in-app and connects the account.
4. **Auto-backup to Google Drive every 24h** — full day's data exported automatically.
5. **Export button with custom date range** — pick from/to dates, export hisaab-kitaab.
6. **Customer WhatsApp numbers** — field per customer; from a khata entry, press
   WhatsApp → opens that customer's chat directly → bill/details sent **as PDF**.

---

## 2. Team split

### TEAM A — UI overhaul (EasyKhata theme)
**Scope:** theme system, all tab screens, customer detail screen, shared widgets,
new Sales dashboard screen, localization strings for UI.

### TEAM B — New features (Google + Drive + WhatsApp)
**Scope:** DB schema v2, Google Sign-In service, Drive backup service, 24h auto-backup,
date-range export, WhatsApp number field + wa.me deep links + PDF-via-WhatsApp,
Settings Google section. Coordinates with Team A on `party_detail_screen.dart`
(Team A owns layout; Team B owns the WhatsApp/SMS action logic).

---

## 3. Team A tasks (UI overhaul)

### A1. New color/design system — `lib/app/theme.dart` (REWRITE)
EasyKhata palette (from screenshots):
| Token | Value | Use |
|---|---|---|
| `bg` | `0xFFF4F6F8` | scaffold background |
| `card` | `Colors.white` | cards, radius 16–20 |
| `diye` (red) | `0xFFE53935` | "Mainey Diye" button, receivable amounts ("lene hain") |
| `diyeLight` | `0xFFFDECEA` | red tinted hero cards |
| `liye` (green) | `0xFF43A047` | "Mainey Liye" button, payable amounts |
| `liyeLight` | `0xFFE8F5E9` | green tinted cards |
| `ink` | `0xFF1A1D21` | primary text |
| `muted` | `0xFF8A94A6` | secondary text |
| `ctaBlack` | `0xFF111111` | big CTA buttons ("+ Sale darj karein") |
| `bannerBlue` | `0xFFE3F2FD` | info banners |

- Keep dark-mode support: map tokens to dark equivalents (do not ship light-only).
- Replace emerald/navy/gold usage app-wide with new tokens.

### A2. Bottom navigation — `lib/presentation/screens/home_screen.dart` (MODIFY)
- Restructure 5 tabs → **3 tabs: Khata / Sales / Account** (matches screenshots).
  - Khata → existing `KhataTab`
  - Sales → NEW `SalesDashboardScreen` (A4)
  - Account → merge of MoreTab + Reports + Settings entry points (rename MoreTab or
    create `AccountTab`; keep all existing destinations reachable).
- **DECISION NEEDED (parent → Rehan):** 3-tab restructure vs keeping 5 tabs with
  new styling. Default: 3-tab per screenshots. If Rehan says no, fall back to
  5-tab restyle — do not block on this; ask once, proceed with 3-tab unless told otherwise.

### A3. Khata tab restyle — `lib/presentation/screens/khata_tab.dart` (MODIFY)
- Total-balance hero: two side-by-side tinted cards (red "lene hain" / green "dene hain").
- Customer rows: avatar circle w/ initials, name, "last transacted" subtitle,
  red `- Rs X` balance.
- Keep search bar + filter + PDF icon row styling like screenshots.
- **Do NOT copy** the "Data not saved — Sign up or log in" upsell banner or the
  "(x/3) entries — EasyKhata 100% free" banner. Our app is offline-first; no account needed.

### A4. NEW Sales dashboard — `lib/presentation/screens/sales_dashboard_screen.dart` (CREATE)
- Filter chips: Hafta / Maheena / Apni marzi (custom range → date pickers).
- 4 stat cards: KULL SALES / KULL ORDERS / KULL NAQAD / KULL UDHAAR (2×2 grid,
  white cards, gray caps labels, big black numbers).
- "Items manage karein" card → navigates to products screen.
- Search field + "HAALI SALES" recent list (reuse sale data from `ReportService`).
- Big black CTA: "+ Sale darj karein" → `SaleFormScreen`.
- Data: add `salesSummary(from, to)` to `ReportService` if missing
  (sum of sales, count, cash vs credit split by payment method).

### A5. Customer detail restyle — `lib/presentation/screens/party_detail_screen.dart` (MODIFY, shared with Team B)
Team A owns:
- Balance hero card: tinted red when receivable ("Maine lene hain"), green/gray when clear.
- Action row: **Tareekh Rakhein / SMS / WhatsApp** (icons + labels, like screenshot 2).
  Team B wires the actual actions; Team A builds the row UI with callbacks.
- Ledger table with columns **TIME | DIYE | LIYE** + running balance chip per row.
- Bottom sticky bar: red **"↑ Mainey Diye"** + green **"↓ Mainey Liye"** buttons.
- Bill-photo thumbnail on entries (entries already support bills — surface the thumbnail).

### A6. Shared widgets — `lib/presentation/widgets/ui.dart` (MODIFY)
Add: `StatCard`, `HeroBalanceCard`, `ActionRowButton`, `BigCtaButton`,
`LedgerTable`, `TintedBanner`. Keep existing `SectionCard`, `MoneyText`, `EmptyState`.

### A7. Localization (UI strings)
Add to `lib/l10n/app_en.arb` + `lib/l10n/app_ur.arb`: sales dashboard labels,
filter chips, diye/liye labels, WhatsApp/SMS/Tareekh labels, export labels.
Run `flutter gen-l10n` after editing (do NOT hand-edit `app_localizations*.dart`).

---

## 4. Team B tasks (new features)

### B1. Database schema v2 — `lib/data/db.dart` (MODIFY) + regenerate `db.g.dart`
- `schemaVersion`: `1` → `2`.
- `Customers`: add `whatsapp` → `text().withDefault(const Constant(''))()`.
- `Suppliers`: add `whatsapp` → `text().withDefault(const Constant(''))()`.
- NEW table `BackupSettings`:
  ```dart
  class BackupSettings extends Table {
    IntColumn get id => integer()(); // single row, id = 1
    TextColumn get googleAccountEmail => text().withDefault(const Constant(''))();
    IntColumn get autoBackupEnabled => integer().withDefault(const Constant(0))(); // 0/1
    IntColumn get lastAutoBackupAt => integer().withDefault(const Constant(0))(); // epoch ms
    TextColumn get driveFolderId => text().withDefault(const Constant(''))();
    IntColumn get updatedAt => integer()();
  }
  ```
- Migration: `onUpgrade: from 1 → 2`: `ALTER TABLE customers ADD COLUMN whatsapp TEXT NOT NULL DEFAULT ''`,
  same for suppliers, `CREATE TABLE backup_settings (...)`.
- Regenerate: `dart run build_runner build --delete-conflicting-outputs`
  (tooling/flutter at `~/workspace/namt-oil-mil/tooling/flutter`).
- Update `BackupMeta`? No change needed.

### B2. Google Sign-In service — `lib/data/google_auth.dart` (CREATE)
- `google_sign_in` package. Scopes: `email`, `https://www.googleapis.com/auth/drive.file`.
- `GoogleAuthService`: `signIn()`, `signOut()`, `currentAccount`, `authHeaders`.
- Persist account email in `BackupSettings.googleAccountEmail`; tokens stay with
  the plugin + `flutter_secure_storage` (already a dependency).
- Handle: user cancels, no Play Services, network off → localized error via `showSnack`.

### B3. Drive backup service — `lib/data/drive_backup.dart` (CREATE)
- `googleapis` drive v3 client built from `GoogleAuthService.authHeaders`.
- Reuse `BackupService.createBackup()` to make the `.sqlite` + manifest locally,
  then upload to Drive folder "Namt Oil Mil Backups" (create once, store id in
  `BackupSettings.driveFolderId`; use `drive.file` scope so only app-created files visible).
- Filename: `namt-auto-YYYY-MM-DD-HHmm.sqlite` for auto, keep manual naming.
- Return `Result<String>` with Drive file id.

### B4. 24h auto-backup — `lib/data/auto_backup.dart` (CREATE) + `lib/main.dart` (MODIFY)
- `workmanager` periodic task `namtAutoBackup`, frequency 24h, constraints:
  `requiresCharging: false`, `requiresDeviceIdle: false`, existing network not required
  (upload retries when online; keep last-success timestamp regardless).
- Task body: if `autoBackupEnabled` and `now - lastAutoBackupAt >= 24h` → run B3.
- **Fallback (mandatory):** on every app foreground/start, `AutoBackup.checkAndRun()`
  — covers devices where WorkManager is killed (common on Pakistani OEM skins).
- Toggle lives in Settings (B6) and Backup screen.

### B5. Custom date-range export — `lib/presentation/screens/backup_screen.dart` (MODIFY)
- Add "Export (custom range)" section: from/to date pickers (default: this month),
  format choice (PDF), Export button.
- Uses `ReportService` for data + `DocumentService` for PDF → `Share.shareXFiles`
  (already via share_plus) or save via file_picker.
- Also used by Team A A4 "Apni marzi" filter? No — A4 filters the dashboard view;
  B5 exports a file. Keep separate.

### B6. Settings — Google section — `lib/presentation/screens/settings_screen.dart` (MODIFY)
- NEW `SectionCard`: "Google / Drive Backup"
  - Row 1: Connect/Disconnect Google button → opens Google sign-in (B2).
    Shows connected account email when linked.
  - Row 2: "24h auto-backup" switch → `BackupSettings.autoBackupEnabled`
    (schedules/cancels B4).
  - Row 3: "Last auto-backup: <time>" (read-only).
- All strings localized (en/ur).

### B7. WhatsApp number + PDF via WhatsApp
- `party_form_screen.dart` (MODIFY): add "WhatsApp number" text field
  (phone keyboard, optional; defaults from phone field if empty).
- `party_detail_screen.dart` (MODIFY — coordinate with Team A):
  - WhatsApp button → `wa.me/<digits>?text=<encoded bill summary>` via `url_launcher`
    (`launchUrl`, `LaunchMode.externalApplication`). Strip non-digits; if empty → snackbar.
  - "Send bill as PDF": generate customer statement PDF via `DocumentService`
    (add `customerStatementPdf(partyId, from, to)` if missing), save to temp,
    `Share.shareXFiles([pdf], text: ...)` — WhatsApp appears in the sheet; this is the
    reliable cross-device path (wa.me cannot attach files).
  - SMS button → `sms:<number>?body=...` via url_launcher.
- `url_launcher` package needed.

### B8. `DocumentService` — `lib/data/documents.dart` (MODIFY)
- Ensure `customerStatementPdf` exists with: business header, customer name/phone,
  date range, TIME/DIYE/LIYE rows, totals. Bilingual labels via existing l10n.

---

## 5. New Flutter packages (add to `app/pubspec.yaml`)

```yaml
  # Google Sign-In + Drive
  google_sign_in: ^6.2.2
  googleapis: ^13.2.0
  googleapis_auth: ^1.6.0
  extension_google_sign_in_as_googleapis_auth: ^2.0.12

  # Background work
  workmanager: ^0.5.2

  # Deep links (WhatsApp, SMS)
  url_launcher: ^6.3.1
```

Compatibility notes (Flutter 3.47.7, Dart >=3.8.0):
- `google_sign_in` 6.x is the safe line for this Flutter; do NOT jump to 7.x without
  checking the changelog (7.x raised the Flutter minimum).
- `googleapis` ^13.x works with Dart 3.8.
- `workmanager` ^0.5.2 supports Android 14+; note OEM battery-killer fallback (B4).
- `share_plus`, `pdf`, `printing`, `file_picker`, `flutter_secure_storage` already present.
- Android: no new manifest permissions required (WorkManager + url_launcher handled by plugins).
  `minSdk` from Flutter default is fine for workmanager (21+).

After adding: `flutter pub get` (deletes nothing; lockfile regenerates on CI).

---

## 6. Localization — new keys (both ARBs, then `flutter gen-l10n`)

`googleBackup`, `connectGoogle`, `disconnectGoogle`, `googleConnectedAs`,
`autoBackup24h`, `lastAutoBackup`, `exportCustomRange`, `fromDate`, `toDate`,
`whatsappNumber`, `sendViaWhatsapp`, `sendBillPdf`, `openWhatsappChat`,
`backupUploaded`, `backupUploadFailed`, `signInCancelled`, `noWhatsappNumber`,
`salesDashboard`, `kullSales`, `kullOrders`, `kullNaqad`, `kullUdhaar`,
`hafta`, `maheena`, `apniMarzi`, `haaliSales`, `saleDarjKarein`, `itemsManageKarein`,
`tareekhRakhein`, `maineyDiye`, `maineyLiye`, `hisaabClearHai`, `leneHain`, `deneHain`.

(Urdu translations to be written by the executing team — keep the terse EasyKhata register.)

---

## 7. Testing checklist (both teams)

- [ ] `flutter analyze` — 0 errors on all touched files.
- [ ] Existing unit harness (24) + SQLite integration harness (27) still pass —
      schema migration 1→2 covered by a new migration test (old DB file → open → columns exist).
- [ ] Manual smoke on the signed-APK path later: Google sign-in flow, Drive upload,
      24h scheduler toggle, WhatsApp deep link with/without number, PDF share sheet.
- [ ] Dark mode: new theme tokens render correctly (no white-on-white).
- [ ] No EasyKhata branding copied: no "EasyKhata 100% free" banners, no sign-up upsell.

---

## 8. Build & delivery

- Both teams work on the same repo/branch (`~/workspace/namt-oil-mil`, GitHub main).
- Coordinate on `party_detail_screen.dart` (A5/B7) and ARB keys (A7/B6) to avoid conflicts:
  Team A merges first, Team B rebases.
- Final build via GitHub Actions workflow (`.github/workflows/build-apk.yml`) as before;
  verify with the `verify_apk_delivery` skill before announcing.
- **Out of scope:** iOS, web, desktop; FBR invoicing; real-time sync. Google Sign-In is
  for Drive backup only — NOT an app login (app stays offline-first, PIN-gated).

---

## 9. Open decisions for parent → Rehan (ask once, don't block)

1. Bottom nav: 3 tabs (Khata/Sales/Account, like screenshots) or keep 5 tabs restyled?
   → Default: 3 tabs.
2. WhatsApp number: separate field, or reuse phone field when WhatsApp == phone?
   → Default: separate optional field, prefilled from phone.

---

## 10. Research merge — deltas from UPDATE_RESEARCH.md (2026-10-18)

The research team's file landed after this plan's first draft. The following items
were in research but missing/underspecified above. Both execution teams treat this
section as authoritative additions (no conflicts found — only additions).

### 10.1 Extra packages
Add to the §5 list:
```yaml
  image_picker: ^1.0.8   # camera+gallery for bill images (better than file_picker for this)
```
Note: research flags `google_sign_in` 7.x may need newer Flutter — pin `^6.2.2`
first; only try 7.x if the resolver accepts it on Flutter 3.47.7.

### 10.2 Extra schema changes (schemaVersion 1 → 2)
In addition to §4/B1:
- NEW table `customer_reminders` (for "Tareekh Rakhein"):
  `id` (auto-inc), `customerId` text ref, `remindAt` int (epoch ms),
  `note` text default '', `done` int default 0.
- `transactions`: add `imagePaths` → `text().withDefault(const Constant('[]'))()`
  (JSON list of local file paths; copy picked images into app documents dir).
- `business_settings` vs `BackupSettings`: research suggests adding
  `google_account_email`, `last_drive_backup_at`, `drive_backup_enabled` columns
  to `business_settings`. This plan keeps the separate `BackupSettings` table (§4/B1)
  for cleaner separation — **either is acceptable, but pick ONE before coding**
  (Team B decides, documents the choice in code comment).
- Migration must cover all: 2 new tables + `customers.whatsapp` +
  `suppliers.whatsapp` + `transactions.imagePaths` (+ chosen settings columns).

### 10.3 Extra UI/feature tasks from screenshots
Assign to teams as follows:

**Team A (UI):**
- A8. Calculator keypad widget — custom numeric keypad (C ÷ × ⌫ / 7-9 / 4-6 / 1-3 /
  0 00 . = / −/+) replacing keyboard input on `txn_form_screen.dart` and
  `sale_form_screen.dart`. Large amount display on top.
- A9. "Add bills" image attach — bottom sheet (Camera / Gallery) via `image_picker`,
  thumbnail row in entry forms, thumbnail visible in party detail ledger rows.
  (Team B owns the DB column + file-copy logic; Team A owns the UI.)
- A10. Sort options on Khata list + Sales list (name / date / amount, asc/desc).
- A11. Favorite (heart) toggle on customer detail — DB: add `isFavorite` int column
  to `customers` (default 0) in the v2 migration; UI: heart icon in detail AppBar.

**Team B (features):**
- B9. Customer reminders ("Tareekh Rakhein") — date-picker dialog from party detail,
  CRUD on `customer_reminders`, "Reminders (N overdue)" card on Khata tab,
  overdue badge. Local notifications (`flutter_local_notifications`) deferred to
  phase 2 if time-constrained — note the deferral in the plan, don't silently drop.
- B10. Customer-list PDF export — whole-list PDF via existing `pdf` package,
  wired to the PDF icon on the Khata tab (research F11).

### 10.4 Android manifest — `app/android/app/src/main/AndroidManifest.xml` (MODIFY)
Add inside `<manifest>` (for WhatsApp visibility on Android 11+):
```xml
<queries>
  <package android:name="com.whatsapp" />
  <package android:name="com.whatsapp.w4b" />
</queries>
```
Verify `INTERNET` permission present. If 24h backup must survive reboot, add
`RECEIVE_BOOT_COMPLETED` (Team B decides based on workmanager behavior).

### 10.5 Google OAuth setup note (critical for release APK)
The SHA-1 in the Google Cloud OAuth client MUST be the **release** keystore's,
not debug — otherwise sign-in fails on the installed APK. Team B: document the
release SHA-1 retrieval command in `BUILD_GUIDE.md` when implementing B2.
(`keytool -list -v -keystore <release-keystore>`; the debug keystore used for
local builds is at `~/.android/debug.keystore`.)

### 10.6 Phone normalization (Pakistan)
Strip spaces/dashes; if 10 digits starting with `3`, prepend `92`;
if 11 digits starting with `0`, replace leading `0` with `92`.
Shared helper — put in `lib/core/phone.dart` (CREATE), used by B7/SMS/WhatsApp.

### 10.7 Localization additions (on top of §6)
`reminderDate`, `setReminder`, `reminders`, `overdue`, `addBills`, `takePhoto`,
`chooseFromGallery`, `sortBy`, `sortName`, `sortDate`, `sortAmount`, `favorite`,
`backupNow2` (manual Drive backup), `driveBackup`, `googleDisconnectConfirm`.
All EN + UR in ARBs.

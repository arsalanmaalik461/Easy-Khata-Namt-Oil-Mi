# Namt Oil Mil — EasyKhata UI/Feature Update Research

**Date:** 2026-10-18
**Source:** 10 EasyKhata app screenshots from Rehan + his feature request message
**Goal:** Match EasyKhata's UI/UX, add missing features, add Google Drive auto-backup + WhatsApp PDF sharing

---

## 1. EasyKhata UI Pattern Analysis

### 1.1 Color System (Light Theme Only — No Dark Mode Observed)

| Token | Approx Hex | Usage |
|---|---|---|
| Background | `#F7F8FA` / `#F5F6F8` | Scaffold background (very light gray-blue) |
| Surface/Card | `#FFFFFF` | Cards, bottom sheets, search bars |
| Primary text | `#1A1A1A` / `#111111` | Titles, amounts, names (near-black) |
| Secondary text | `#8A8F98` / `#9AA0A6` | Subtitles, hints, "is maheeney", timestamps |
| Accent red | `#E5484D` / `#F0433A` | "Mainey Diye" button, DIYE amounts, "Maine lene hain" |
| Accent green | `#22B573` / `#34A853` | "Mainey Liye" button, LIYE amounts, "Maine dene hain" |
| Light red bg | `#FDECEA` / `#FEE2E2` | Receivable balance card background |
| Light green bg | `#E6F7ED` / `#DCFCE7` | Payable balance card background |
| Light blue bg | `#E3F2FD` / `#DBEAFE` | Signup/info banner background |
| CTA black | `#111111` / `#000000` | Primary full-width buttons ("+ Sale darj karein", "+ Add customer") |
| WhatsApp green | `#25D366` | WhatsApp action icon |
| SMS blue | `#1A73E8` | SMS action icon |

**Key contrast with Namt Oil Mil:** Current app uses emerald green (`#0E6B4D`) as primary brand color with a dark-green AppBar. EasyKhata is **neutral monochrome** (black/white/gray) with **red/green only for money semantics**. Rehan explicitly asked: "puri app ka color bhi isi tarha karo jaisa iska hai" — this means **replacing the emerald brand theme with EasyKhata's neutral + red/green semantic palette**.

### 1.2 Typography

- **Title:** Bold (~700-800), ~22-24sp, near-black. Serif used on entry form title ("Maine diye") — likely a display serif for that screen only.
- **Amount:** Bold, tabular figures, 20-28sp. Red for DIYE/outstanding-receivable, green for LIYE.
- **Card label:** UPPERCASE, letter-spaced, 11-12sp, gray (e.g., "KULL SALES", "TOTAL BALANCE", "CUSTOMERS", "HAALI SALES").
- **Body:** Regular 14-15sp, near-black.
- **Hint/subtitle:** 12-13sp, gray.

### 1.3 Component Patterns

- **Stat cards:** White, radius ~16dp, no visible border, subtle shadow. Label (uppercase gray) → big value → small subtitle ("— is maheeney").
- **Balance hero cards:** Tinted background (light red / light green), rounded ~16dp, icon in solid circle + bold amount + label below.
- **Primary CTA:** Full-width black button, radius ~16dp, height ~56dp, white text, centered ("+ Sale darj karein", "+ Add customer").
- **Dual action buttons:** Two half-width buttons side by side — red "↑ Mainey Diye" / green "↓ Mainey Liye", radius ~12dp.
- **Search bar:** White rounded (~24dp pill or 12dp), magnifier prefix, light hint text. Often paired with small square icon buttons (sort, PDF, filter).
- **List rows:** White cards or plain rows; avatar circle with initials → name (bold) → subtitle (gray "last transacted on…") → amount right-aligned (red/green).
- **Transaction rows:** Direction arrow in tinted circle → "Today 10:08PM" + "Bal: Rs X" pill → amount right (green=LIYE, red=DIYE) → description below.
- **Bottom nav:** 3 tabs — Khata (book icon), Sales (bar-chart icon), Account (person icon). Icons are outline; selected tab is black/bold.
- **Date range selector:** Segmented pill tabs — "Hafta" | "Maheena" (selected, white on gray) | "📅 Apni marzi".
- **Info banner:** Light blue rounded card with centered text + thin progress bar at bottom.
- **Bottom sheet:** White, top drag handle, title in serif bold, list options with blue icons (Camera / Gallery).

### 1.4 Layout / Spacing

- Screen padding ~16dp; card-to-card gap ~12dp.
- No AppBar on main tabs (title is in-body: "Sales" / "GUEST BUSINESS" as large header text).
- Detail screens have a simple back-arrow AppBar (no elevation).
- Sticky bottom CTA above the bottom navigation bar.

---

## 2. Feature Inventory (from Screenshots)

### Sales Dashboard (new — Namt Oil Mil has no equivalent)
- Date range tabs: Hafta / Maheena / Apni marzi (custom range)
- 4 stat cards: Kull Sales (Rs), Kull Orders (count), Kull Naqad (Rs cash), Kull Udhaar (Rs credit)
- "Items manage karein" card → product/item management entry point
- Search sales by name/amount + filter button
- "Haali Sales" (recent sales) list with result count
- Sticky "+ Sale darj karein" black CTA → new sale form

### Khata / Customer List
- "GUEST BUSINESS" header + TOTAL BALANCE with eye toggle
- Two hero cards: "Maine lene hain" (receivable, red) / "Maine dene hain" (payable, green)
- Signup banner with entry-count progress ("(1/3) entries")
- "Reminders (0 overdue)" card
- Search Customer + sort + PDF export buttons
- Customer cards: avatar initials, name, "last transacted on …", balance right
- "Data not saved" warning banner → Sign up or log in
- Sticky "+ Add customer" black CTA

### Customer Detail
- Name + "Customer since …", favorite (heart) + 3-dot menu
- Balance hero card (pink/red when receivable)
- Quick actions row: **Tareekh Rakhein** (set reminder/date), **SMS**, **WhatsApp** ← KEY MISSING FEATURE
- Search + sort + PDF buttons
- Ledger table with TIME / DIYE / LIYE column headers, running balance pills
- Sticky dual buttons: "↑ Mainey Diye" (red) / "↓ Mainey Liye" (green)

### Transaction Entry ("Maine diye" / "Maine liye")
- Large amount input with calculator-style numeric keypad (C ÷ × ⌫, 7-9, 4-6, 1-3, 0 00 . =, −/+)
- Description text field
- Date picker pill ("18th Oct, 26") → calendar dialog
- **"Add bills" button → Camera/Gallery bottom sheet** ("Image add karein") ← image attachment per transaction

### Other Observed
- PDF export button on customer detail and customer list (per-customer statement)
- Sort options on lists
- Reminder/date feature per customer ("Tareekh Rakhein")

---

## 3. Gap Analysis: Namt Oil Mil (Current) vs EasyKhata (Target)

### 3.1 UI Gaps (High Priority — Rehan explicitly requested full re-theme)

| # | Gap | Current State | Target |
|---|---|---|---|
| U1 | **Brand color** | Emerald green `#0E6B4D` theme, green AppBar | Neutral black/white/gray; red/green ONLY for money semantics |
| U2 | **Main tabs** | 5 tabs: Home, Khata, Transactions, Reports, More | 3 tabs: Khata, Sales, Account (EasyKhata IA) |
| U3 | **Home/Dashboard** | Emerald hero card + 8 quick actions + today summary | Replace with **Sales dashboard** (stat cards, date tabs, recent sales, black CTA) |
| U4 | **Khata list** | TabBar (Customers/Suppliers) + FAB | EasyKhata card style: balance heroes, reminders card, search+sort+PDF row, black "+ Add customer" sticky CTA |
| U5 | **Customer detail** | Navy hero card, tonal buttons, generic share | Pink/green balance hero, **SMS/WhatsApp/Tareekh icon row**, DIYE/LIYE column ledger, red/green dual sticky buttons |
| U6 | **Entry forms** | Standard text fields | Large amount display + **calculator keypad**, date pill, "Add bills" image attachment |
| U7 | **Buttons** | Emerald FilledButtons | Black primary CTAs; red/green semantic dual buttons |
| U8 | **Typography** | Default Material | Uppercase letterspaced card labels; tabular-figure amounts; serif display on entry title |
| U9 | **Dark mode** | Supported | EasyKhata appears light-only; keep dark mode but default to new light theme |

### 3.2 Feature Gaps

| # | Feature | Status in Namt Oil Mil | Notes |
|---|---|---|---|
| F1 | Sales dashboard (Kull Sales/Orders/Naqad/Udhaar + Hafta/Maheena/Custom) | ❌ Missing | New screen; needs sales aggregation queries by date range + cash/credit split |
| F2 | Item/product management entry from Sales | ⚠️ Partial | `products_screen.dart` exists; needs linking from Sales dashboard card |
| F3 | SMS button per customer | ❌ Missing | `url_launcher` with `sms:` URI |
| F4 | **WhatsApp button per customer** | ❌ Missing (only generic share) | `url_launcher` with `https://wa.me/<phone>?text=…`; **needs WhatsApp number field per customer** (see F5) |
| F5 | **WhatsApp number field on customer** | ❌ Missing | DB migration: add `whatsapp` column to Customers (default = phone). Form field in party_form_screen |
| F6 | **PDF bill per customer/transaction → share to WhatsApp** | ⚠️ Partial | `pdf` + `printing` + `share_plus` already in pubspec; need per-customer statement PDF + per-transaction bill PDF wired to WhatsApp share |
| F7 | Reminder/date per customer ("Tareekh Rakhein") | ❌ Missing | Needs DB table (customer_reminders: id, customerId, date, note) + list UI + optional local notification |
| F8 | Image attachment per transaction ("Add bills") | ❌ Missing | `file_picker` exists; need DB column (imagePaths) on Transactions/Payments + camera/gallery picker + thumbnail in detail |
| F9 | Calculator keypad on amount entry | ❌ Missing | Custom widget; replaces keyboard input on txn/sale forms |
| F10 | Sort options on lists | ❌ Missing | Sort by name/date/amount asc/desc |
| F11 | PDF export on customer list | ❌ Missing | Whole-customer-list PDF via existing pdf package |
| F12 | **Google Sign-In** | ❌ Missing | New: `google_sign_in` package; Settings button → Google OAuth screen → linked account state |
| F13 | **Google Drive auto-backup every 24h** | ❌ Missing | New: Drive API upload of sqlite file; `workmanager` for background periodic task; stores last-backup timestamp |
| F14 | **Custom date-range export to Drive** | ❌ Missing | Export button + date-range picker → generate statement/backup for range → upload to Drive |
| F15 | Favorite (heart) per customer | ❌ Missing | Minor; DB column + toggle |
| F16 | Entry-count signup banner | N/A | EasyKhata upsell banner; skip (no signup system in Namt Oil Mil) |

### 3.3 What Namt Oil Mil Has That EasyKhata Screenshots Don't Show (Keep)
- Suppliers + purchase flow, production batches, inventory/products, cashbook, full reports tab, PIN lock, Urdu/English localization, local backup/restore. These are oil-mill-specific and must be preserved — put them under the **Account/More** tab.

---

## 4. New Feature Technical Requirements

### 4.1 Google Sign-In (Settings → "Google se connect karein")
- **Package:** `google_sign_in: ^6.2.1` (or latest 6.x/7.x compatible with Flutter 3.47)
- **Setup:**
  - Google Cloud Console: OAuth 2.0 Client ID for Android (package `com.arsu.digikhatabyarsu`, SHA-1 of signing key)
  - Scopes: `email`, `https://www.googleapis.com/auth/drive.file` (app-created files only — least privilege)
  - `android/app/src/main/.../MainActivity.kt` — no change needed (GoogleSignIn handles via Play Services)
- **Flow:** Settings button → `GoogleSignIn().signIn()` → store account (email, displayName) in secure storage / settings table → show connected state + "Disconnect" option
- **Edge:** No Play Services / user cancels → show error snackbar, stay offline (app must keep working fully offline)

### 4.2 Google Drive Auto-Backup (every 24h)
- **Packages:** `googleapis: ^13.x` (drive v3), `googleapis_auth: ^1.6` (or `extension_google_sign_in_as_googleapis_auth` to bridge google_sign_in → authenticated client)
- **Recommended bridge:** `extension_google_sign_in_as_googleapis_auth: ^2.0.12` — converts `GoogleSignInAccount` auth headers to `googleapis_auth` client
- **Upload logic:**
  - Locate sqlite file via existing `db_path.dart`
  - `drive.files.create` with `drive#file` metadata, name `namt-oil-mil-backup-<yyyyMMdd-HHmm>.sqlite`, parent = appDataFolder or a "NamtOilMil" folder (create if missing)
  - Keep last N backups (e.g., 7) → delete older via `drive.files.delete`
  - Record `lastDriveBackupAt` in BusinessSettings table
- **Background scheduling:** `workmanager: ^0.5.2`
  - `Workmanager().registerPeriodicTask("drive-backup", "driveBackup", frequency: Duration(hours: 24), constraints: Constraints(networkType: NetworkType.connected))`
  - Background isolate must re-open DB read-only or copy the sqlite file before upload (DB may be locked)
  - Android: needs `Workmanager().initialize(callbackDispatcher)` in main(); callback entry point must be `@pragma('vm:entry-point')`
- **Manual trigger:** Settings → "Abhi backup karein" button runs same upload immediately

### 4.3 Custom Date-Range Export to Drive
- Reuse Drive upload pipeline; export = filtered statement (PDF or CSV) for custom range
- UI: Settings → "Export" → date-range picker (reuse "Apni marzi" pattern) → format choice (PDF) → upload to Drive + show Drive link / share
- The existing `pdf` package generates the statement; upload the generated file instead of the sqlite

### 4.4 WhatsApp Deep Linking + PDF Bill
- **Package:** `url_launcher: ^6.3.1` (new)
- **Customer WhatsApp number:** DB migration v+1 — `ALTER TABLE customers ADD COLUMN whatsapp TEXT NOT NULL DEFAULT ''`
- **Flow:** Customer detail → WhatsApp icon → build message (balance + recent txns) → generate PDF bill via `pdf` → `wa.me/<number>?text=<encoded>` via `launchUrl`; attach PDF via `share_plus` `Share.shareXFiles` with WhatsApp target if direct attach needed (note: wa.me links can't attach files — use share sheet with text + file, user picks WhatsApp)
- **Practical approach:** `Share.shareXFiles([XFile(pdfPath)], text: message)` — system sheet → user taps WhatsApp → chat opens with PDF attached. Also keep direct `wa.me` chat-open as fallback when no PDF.
- **Phone normalization:** strip spaces/dashes, prepend `92` country code if 10-digit starting with `3`

### 4.5 SMS Button
- `url_launcher` with `sms:<number>?body=<encoded>` — no new package beyond url_launcher

### 4.6 Image Attachment per Transaction
- `file_picker` (already) or `image_picker: ^1.0.8` (better: camera + gallery in one API)
- DB: add `image_paths TEXT DEFAULT '[]'` (JSON list) to Transactions (and optionally Payments)
- UI: "Add bills" button → bottom sheet (Camera / Gallery) → thumbnails row in form → view in detail screen
- Storage: copy picked files into app documents dir (`path_provider` already present)

### 4.7 Reminder per Customer ("Tareekh Rakhein")
- New Drift table: `customer_reminders(id, customer_id, remind_at, note, done)`
- UI: date picker dialog from customer detail; list in Khata tab "Reminders" card; badge on overdue
- Optional: `flutter_local_notifications` for actual alerts (defer to phase 2 if time-constrained)

---

## 5. Package Dependencies — Delta

### Already in pubspec (reuse)
`pdf`, `printing`, `share_plus`, `file_picker`, `path_provider`, `flutter_secure_storage`, `intl`

### To add
| Package | Version | Purpose |
|---|---|---|
| `google_sign_in` | `^6.2.1` | Google OAuth |
| `extension_google_sign_in_as_googleapis_auth` | `^2.0.12` | Bridge sign-in → Drive API client |
| `googleapis` | `^13.2.0` | Drive v3 API |
| `workmanager` | `^0.5.2` | 24h background backup |
| `url_launcher` | `^6.3.1` | WhatsApp/SMS deep links |
| `image_picker` | `^1.0.8` | Camera/gallery for bill images |

### Android manifest additions
- `INTERNET` permission (already? verify)
- WorkManager: no manifest change (Flutter plugin handles); `RECEIVE_BOOT_COMPLETED` if backup must survive reboot
- `queries` for WhatsApp visibility on Android 11+:
```xml
<queries>
  <package android:name="com.whatsapp" />
  <package android:name="com.whatsapp.w4b" />
</queries>
```

### DB migrations needed
1. `customers.whatsapp TEXT DEFAULT ''`
2. New table `customer_reminders`
3. `transactions.image_paths TEXT DEFAULT '[]'`
4. `business_settings`: add `google_account_email`, `last_drive_backup_at`, `drive_backup_enabled`

---

## 6. Implementation Priorities (for Planning Team)

### Phase A — Re-theme to EasyKhata UI (Rehan's explicit #1 ask)
1. New `AppColors` palette (neutral + red/green semantics), remove emerald AppBar
2. Bottom nav → 3 tabs (Khata / Sales / Account); move oil-mill screens under Account
3. New **Sales dashboard** screen (stat cards, Hafta/Maheena/Custom tabs, recent sales, black CTA)
4. Restyle Khata list + customer detail per screenshots (heroes, search/sort/PDF row, dual red/green buttons)
5. Restyle entry forms (calculator keypad, date pill, Add-bills button)
6. Update ~300 l10n strings where labels changed (e.g., "Mainey Diye/Liye")

### Phase B — Communication features
7. WhatsApp number field (DB + form)
8. WhatsApp/SMS buttons on customer detail
9. Per-customer PDF statement → share to WhatsApp
10. Image attachment per transaction (camera/gallery bottom sheet)
11. Sort options, customer-list PDF export, favorite toggle, reminders table + UI

### Phase C — Google Drive backup
12. `google_sign_in` + Settings connect/disconnect UI
13. Drive upload service (sqlite + custom-range PDF export)
14. `workmanager` 24h periodic backup + manual "backup now"
15. Custom date-range export UI

### Risks / Notes
- **google_sign_in 7.x** may require Flutter 3.5x — pin 6.x if resolver conflicts; verify with `flutter pub get` on CI
- **workmanager** background isolate + Drift: do NOT share the open DB; copy the sqlite file first
- **SHA-1 fingerprint:** debug vs release keystores differ — Drive OAuth client must include the release SHA-1 or sign-in fails on the installed APK
- **WhatsApp number:** Pakistani numbers — normalize `03XX` → `923XX`
- **Re-theme scope is large** (~15 screens); consider a shared `EkCard`, `EkButton`, `EkStatCard` widget set first, then migrate screen by screen
- **Bilingual:** all new strings need EN + UR entries in `app_en.arb` / `app_ur.arb`
- **Tests:** existing 51-test harness covers domain logic; add widget tests for new Sales dashboard aggregations

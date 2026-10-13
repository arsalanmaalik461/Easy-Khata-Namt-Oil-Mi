# Namt Oil Mil — Architecture & Design

## Stack
- Flutter 3.47.7 (stable), Dart null-safe
- State: flutter_riverpod
- DB: drift (SQLite), sqlite3_flutter_libs; migrations via drift schema versions
- i18n: flutter_localizations + ARB (en, ur), RTL for Urdu
- Docs: pdf, printing; share: share_plus; files: file_picker, path_provider
- Charts: fl_chart; IDs: uuid v4; PIN secret: flutter_secure_storage

## Layering
lib/
  main.dart                    // bootstrap, error zone
  app/app.dart                 // MaterialApp, locale, theme, router
  app/router.dart              // named routes
  app/theme.dart               // design system (emerald/navy/gold)
  core/money.dart              // Money (int paisa), arithmetic, formatting
  core/ids.dart                // uuid helpers
  core/result.dart             // Result<T> for service errors
  core/units.dart              // Rational qty (num/den), conversions
  domain/models.dart           // pure data models
  domain/accounting.dart       // THE ledger engine: posting rules, balance math
  domain/numbering.dart        // document sequences
  data/db.dart                 // drift database + DAOs
  data/repositories.dart       // repository impls over drift
  l10n/app_en.arb, app_ur.arb
  presentation/
    providers.dart             // riverpod providers
    widgets/                   // design-system components
    screens/                   // home, khata, transactions, reports, more + sub-screens

## Money
- Stored as INTEGER paisa (1 PKR = 100). Never double for money.
- Money class wraps int minor units; +, -, *, allocation; format via intl NumberFormat('PKR #,##0.00' / ur_PK).

## Quantity
- Rational: qtyNum/qtyDen integers, base unit per product.
- unit_conversions: explicit rational factors; no hardcoded maund=40kg (configurable default 40).

## Ledger direction (single source of truth in domain/accounting.dart)
- Customer balance > 0  => customer OWES us (receivable). Credit sale +, payment received -, advance => negative (we owe them).
- Supplier balance > 0  => WE OWE supplier (payable). Credit purchase +, payment to supplier -, supplier advance => negative.
- Cash/bank balance: receipts +, payments -.
- Every financial mutation goes through AccountingService.post() inside ONE drift transaction:
  1 insert ledger_entries (immutable, with balance_after snapshot)
  2 update party/account balance
  3 inventory movements + stock check
  4 document + allocations
- Corrections = reversal entries (never edit/delete posted rows). Status flags: posted | reversed.

## Document numbering
document_sequences(doc_type TEXT PK, prefix TEXT, next_no INTEGER).
sale -> "SALE-000123" (prefix configurable in settings).

## i18n
- All UI strings via AppLocalizations (gen_l10n). No hardcoded user-visible strings.
- Urdu: full RTL, Noto Nastaliq Urdu fallback via fontFamily on ur locale (bundled? use system + Google Fonts NOT allowed offline — ship with default rendering; document limitation).
  Decision: use built-in fonts; Urdu renders with system fonts on Android. Note in docs.
- Numbers/dates: intl with locale; currency symbol "Rs".

## Offline
- No network calls anywhere in v1. Backup = copy sqlite file to user-chosen dir (+ json manifest).

## Tests
- test/unit: money, accounting postings, numbering, unit conversion, P&L math.
- test/integration: drift in-memory (NativeDatabase.memory) workflows A–E from spec.
- No golden UI tests in v1 (time); widget smoke test for app start + locale switch.

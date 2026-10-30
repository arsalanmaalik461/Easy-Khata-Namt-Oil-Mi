# TEAM QA — Bug list, Namt Oil Mil (Flutter, `com.arsu.digikhatabyarsu`)

- **Audit date:** 2026-10-25 (Phase 1)
- **Baseline audited:** committed HEAD `a9fb5bb` ("Fix build #27: restore missing launcher icons").
  Line numbers below refer to that tree unless marked "working tree".
- **Method:** static code review only (no device run, no APK build — per task).
  Three read-only layer audits (data/domain, presentation/screens, core/widgets/theme/localization)
  plus lead-QA verification reads. `app/lib/data/db.g.dart` (30,004 lines, generated) was
  spot-checked only (table list vs `db.dart`), not line-audited.
- **Base path for all file refs:** `~/workspace/namt-oil-mil/app/lib/`
  (written below as `lib/...`).
- **Counts:** **Critical 10 · High 24 · Medium 36 · Low 13 = 83 items.**
- **No files were edited by QA.** Fix teams own: customer/transaction logic,
  PDF/reminder/code logic, theme/localization. Everything below is list-only.

> **⚠ Working tree is dirty — read before using line numbers.**
> At audit time the fix teams were actively editing: 6 files modified
> (`data/documents.dart`, `data/party_actions.dart`, `data/reports.dart`,
> `data/services.dart`, `presentation/screens/party_detail_screen.dart`,
> `presentation/screens/party_form_screen.dart`) plus new `app/test/integration/team_b_test.dart`
> and `app/assets/` (untracked). Items marked **[FIX IN PROGRESS]** were already
> visibly changed in the uncommitted diff; they stay on this list until Phase 2
> verifies the finished fix. All other items were verified against HEAD.

---

## 0. RELEASE-BLOCKING VERIFICATION ISSUE (not a code bug — confirm before shipping)

**V-0 — The 5 screenshots Rehan sent 2026-10-25 11:44 AM are NOT screens from this codebase.**
`git grep` over the entire repo history finds no "Trial Balance", "Monthly Summary",
"Daily Summary" screen, and no Sales screen with Today / This week / This month / All
chips + "Select customer". This repo's equivalents are different screens
(`sales_dashboard_screen.dart` uses Hafta / Maheena / Apni-marzi chips;
receivables/payables are `DataTable` reports in `report_view_screen.dart`, not cards).
The screenshots show a dark-theme app with a green header that matches none of our
screens in any commit. **Most likely Rehan is running a different khata app**
(e.g. the reference EasyKhata app) **or an old build that predates this repo.**
Consequences:
- The wrapping defects visible in the screenshots ("Receivabl es", "Rs 1,1 00.00")
  are defects **of that other app, not of this code** — do not attribute them to us.
  Our equivalent risk is the unconstrained-text pattern (H17), which is real but
  unverified on device.
- The live figures in the screenshots (Nadeem Rs 1,100 receivable, Cash Rs −1,100,
  Oct 2026 received Rs 900) cannot be used to validate this app's math.
- **Before the final APK ships, confirm with Rehan: (a) which app those screenshots
  are from, (b) whether build #28 actually installed on his phone** (an older build
  with a different signing cert refuses install-over — uninstall-old-first applies).
- His 8 complaints still map to real gaps in THIS code (see mapping at the end),
  so they stay valid requirements regardless of which app the screenshots show.

---

## CRITICAL (10)

### C1. Purchase returns: tables + helper exist, but no service method at all
- **Screen/feature:** Purchase returns.
- **Files:** `lib/data/services.dart` (no `createPurchaseReturn` anywhere);
  `lib/data/db.dart:345-370` (`PurchaseReturns`/`PurchaseReturnItems`);
  `lib/domain/accounting.dart:40-41` (`applyPurchaseReturn`, never called).
- **Wrong:** a purchase return updates nothing — supplier balance, stock, purchase-invoice
  status and ledger are all untouched.
- **Correct:** mirror `createSalesReturn` (`services.dart:745+`): reduce supplier payable,
  return stock, update invoice status, write supplier + transaction/ledger rows.

### C2. Sales-return status double-counts the return just inserted
- **Screen/feature:** Sales returns / invoice status.
- **File:** `lib/data/services.dart:790-792` — `prevReturned = _salesReturnedTotal(invoiceId)`
  is queried *after* the new `SalesReturns` row is inserted in the same transaction,
  then `_saleStatus(inv.totalMinor, inv.paidMinor, prevReturned + total)`.
- **Wrong example:** total 1000, paid 300, return 400 → correct status is `partiallyPaid`
  (net 600, paid 300 < 600), but the inflated returned value (800) makes net 200 and
  marks it `paid`.
- **Correct:** capture returned-total *before* inserting, or pass the already-inclusive
  total without adding `total` again. (A later payment can self-correct the status via
  `_applyToSaleInvoice`, which computes returned correctly — the wrong status persists
  until then.)

### C3. Sales returns have no validation and no cash/paid adjustment
- **Screen/feature:** Sales returns.
- **File:** `lib/data/services.dart:745-805`.
- **Wrong:** no check that return qty ≤ invoiced qty, unit price matches the invoice,
  items belong to that invoice, invoice isn't draft/cancelled, or total ≤ invoice total;
  `paidMinor` is never reduced and no refund/cash row is written, so a fully-paid-then-
  returned sale leaves `paidMinor` intact and the customer balance simply goes negative.
- **Correct:** validate against invoice lines and cumulative returns, reject over-returns,
  and handle refunds (cash out + `paidMinor` adjustment) or document advance-credit
  explicitly.

### C4. Supplier purchase is posted as a debit — purchase and payment are BOTH debits
- **Screen/feature:** Purchase ledger / supplier statement.
- **File:** `lib/data/services.dart:520` (purchase writes debit), `:534` (payment also debit).
- **Wrong:** supplier ledger debits − credits = `total + paidNow`, but the supplier balance
  is `total − paidNow`. The ledger can never reconcile with the balance. (Customer side is
  correct: sale debit `:413`, receipt credit `:428`.)
- **Correct:** a credit purchase increasing a payable is a *credit*; payment reducing it
  is a debit. This also fixes the UI side: today a supplier purchase renders on the
  DIYE (given) side when it should render on the LIYE (taken) side.

### C5. Inventory valuation divides total purchase cost by NET stock
- **Screen/feature:** Inventory valuation.
- **File:** `lib/data/reports.dart:143-160` — `costNum` sums only positive movements with
  cost, but `qtyBase` sums *all* movements (including negative sales).
- **Wrong example:** buy 100 @ Rs 10 (cost 1000), sell 50 → avg = 1000/50 = Rs 20,
  value = 50 × 20 = Rs 1000 instead of Rs 500.
- **Correct:** divide by total *purchased/produced* qty (or maintain weighted-average per
  movement), using each movement's historical unit cost. Sale movements carry
  `unitCostMinor: 0`, so they must not enter the denominator.

### C6. Drive backups cannot be restored by the app's own validator — manifest never uploaded
- **Screen/feature:** Drive backup / restore.
- **Files:** `lib/data/drive_backup.dart:70-98` (only the `.sqlite` file is uploaded; the
  temp dir, manifest included, is deleted) vs `lib/data/backup.dart:66-69`
  (rejects a backup with "Manifest missing"). `localBackup.createBackup()` writes
  `*.sqlite` + `*.sqlite.json` (`backup.dart:44-51`).
- **Correct:** upload the manifest alongside the file (or embed checksum/version in Drive
  file metadata) and make restore accept Drive downloads.

### C7. Restore is destructive with no safety copy and no enforcement that the live DB is closed
- **Screen/feature:** Backup restore.
- **File:** `lib/data/backup.dart:101-117` — `restoreIntoPlace` copies over the live file,
  deleting only `-wal`/`-shm`/`-journal` sidecars; no backup of the current DB is taken
  first, and the doc comment ("caller must close first") is unenforced.
- **Correct:** snapshot the current DB before overwriting, refuse/fail if the DB
  connection is still open, and only then replace.

### C8. Balance updates use pre-transaction snapshots — concurrent operations lose updates
- **Screen/feature:** All payments/expenses/transfers/sales/purchases (also the most
  plausible explanation for the reported Cash Rs −1,100, together with M3).
- **Files:** `lib/data/services.dart:209-267` (`receivePayment`), `:269-330` (`paySupplier`),
  `:543-580` (`recordExpense`), `:618-669` (`transferFunds`) — account/party rows are
  read *before* `db.transaction()`, the sufficiency check uses that snapshot, and the
  write inside is `snapshot ± amount`.
- **Wrong:** two overlapping operations both write from the same snapshot; the second
  silently overwrites the first, and a sufficiency check can pass on stale data.
- **Correct:** re-read balances *inside* the transaction (as `createPurchase` partially
  does) and re-check sufficiency there, or use atomic `balance = balance ± amount` updates.

### C9. Document numbers are consumed outside the transaction — duplicates possible
- **Screen/feature:** Invoice/payment/batch/return numbering.
- **Files:** `lib/data/db.dart:529-540` (`nextDocNo`: select-then-update, comment claims
  "Atomic within caller txn") vs callers `lib/data/services.dart:225, 288, 368, 473, 691, 760`,
  all *before* `db.transaction()`.
- **Wrong:** a duplicate `invoiceNo`/`txnNumber` (unique columns, `db.dart:128, 204`)
  surfaces as an unhandled SQLite exception, not a `Result`; rollback leaves gaps.
- **Correct:** call `nextDocNo` inside the transaction, or make numbering atomic
  (single UPDATE…RETURNING / sequence-table lock).

### C10. Supplier statement PDF always fails
- **Screen/feature:** Party detail (supplier view) → PDF share button.
- **Files:** `lib/presentation/screens/party_detail_screen.dart:659-682` (`_sharePdf` passes
  `widget.partyId` as `customerId` regardless of customer/supplier);
  `lib/data/documents.dart:185-196` (`customerStatementPdf` queries only `db.customers`
  with `.getSingle()`); `lib/data/party_actions.dart:57-72` (no supplier branch).
- **Wrong:** a supplier id is never in `customers`, so `getSingle()` throws and the user
  only gets "Could not share statement".
- **Correct:** branch on customer/supplier (supplier statement path) or hide/disable the
  button for suppliers with an explanation. Never route a supplier id through the
  customer-only query.

---

## HIGH (24)

### H1. `paidNow` on a sale/purchase creates no `Payment` row
- **Files:** `lib/data/services.dart:333-435` (`createSale`), `:437-541` (`createPurchase`);
  `lib/data/reports.dart:53-62` (`sumPayments` reads only the `payments` table).
- **Wrong:** only invoice `paidMinor`, cash balance and ledger rows are written, so
  dashboard today-received/today-paid miss these receipts/payments, payment history
  undercounts, and no receipt PDF exists for them.
- **Correct:** insert a `Payments` row (+ allocation) for every `paidNow`, exactly as
  `receivePayment`/`paySupplier` do.

### H2. Payment allocations are uncapped and unchecked
- **Files:** `lib/data/services.dart:255-262, 318-325, 983-1008`
  (`_applyToSaleInvoice`/`_applyToPurchaseInvoice`).
- **Wrong:** full `amount` is inserted and added to `paidMinor` with no check that the
  invoice belongs to that party, is unpaid/partial, or that `paid + amount ≤ total − returned`
  (purchase version ignores returns entirely, `:1007` passes `0`). A missing invoice
  silently inserts an orphan allocation (FKs are not enforced by default).
- **Correct:** validate party + invoice kind + remaining balance, cap or reject
  over-allocation, return `Err` on a missing invoice.

### H3. P&L revenue and COGS use inconsistent filters and ignore returns
- **File:** `lib/data/reports.dart:166-215`.
- **Wrong:** revenue excludes `returned` (`:171`) but includes `partially_returned` at
  *full* `totalMinor` (no return subtraction); COGS query excludes only draft/cancelled
  (`:184`), so fully-returned invoices still count COGS; COGS = qty × *current*
  `product.purchasePrice` (`:193`), ignoring unit conversion (maund vs kg), historical
  cost and discounts; `ProductionBatches` labour/electricity/other costs are never added
  to expenses or COGS. (`Accounting.profitLoss` formula itself, `domain/accounting.dart:62-70`,
  is correct; its inputs are not.)
- **Correct:** revenue = Σ totals − Σ returns; COGS from historical movement unit costs in
  base units; production overhead included in COGS/expenses.

### H4. Sales-summary `naqad`/`udhaar` are wrong; recent list includes drafts/cancelled
- **File:** `lib/data/reports.dart:234-260`.
- **Wrong:** doc comment claims "cash received against those invoices (payments in range)",
  but `naqad` = `paidMinor` sum (invoice-date basis, includes sale-time `paidNow`,
  excludes timing of later allocations, excludes unallocated receipts);
  `udhaar = total − paid` ignores returns; recent list (`:248-252`) has no
  draft/cancelled exclusion, unlike the totals query (`:242`).
- **Correct:** `naqad` from `payments`/`paymentAllocations` in range,
  `udhaar = total − paid − returned`, same status filter on both queries.

### H5. Opening-balance ledger entry always records a debit, even for a negative (advance) opening
- **Files:** `lib/data/services.dart:873-905` (`_postTxn` always
  `_ledger(…, amount, Money.zero, …)`), called with `amount: openingBalance.abs()` at
  `:47` and `:102`, while `apply: (b) => b + openingBalance` applies the signed value.
- **Wrong:** statement debit/credit columns do not reconcile with `balanceAfter` for
  advance openings; also causes M8 (wrong DIYE/LIYE rendering).
- **Correct:** debit when the opening increases the balance, credit when it decreases it.

### H6. Negative-stock policy "warn" is silently "allow"
- **Files:** `lib/data/services.dart:851-871` (`_checkStock` builds `msg` on `warn` but
  returns `Ok(true)` and discards it); `createSale` (`:365-366`) only checks `isOk`.
  Each line is also checked individually, so duplicate lines for the same product each
  pass while their sum exceeds stock; the check runs before the transaction, so stock can
  change before the write.
- **Correct:** return the warning to the caller (or a `Warn` result), aggregate duplicate
  product lines, re-check inside the transaction. `block` and `allow` paths are correct.

### H7. Unknown unit conversion silently assumes 1:1 — maund/kg stock corruption
- **File:** `lib/data/services.dart:829-849` (`_toBase`): `if (rev == null) return qty;`.
- **Correct:** return an error for an unmapped unit pair; never silently equate units.

### H8. No reversal/cancel path exists despite schema support
- **Files:** `lib/data/db.dart:132-135` (`Transactions.status: posted | reversed`,
  `reversedBy`) and `:166` (invoice `cancelled`); no service method ever writes
  `reversed`, `reversedBy` or `cancelled`.
- **Wrong:** a wrong entry can only be offset by a new manual entry with no audit link,
  despite the "corrections use reversals" design claim.
- **Correct:** implement reversal (compensating transaction + ledger + balance + invoice
  status) or remove the claim.

### H9. Reminders never notify — rows are stored, nothing schedules them
- **Files:** `lib/data/services.dart:138-177` (`addCustomerReminder`/`pendingReminders`/
  `overdueReminders` only); no notification plugin, scheduling call or due-date worker
  exists anywhere in `lib/` (only Workmanager for backup, `data/auto_backup.dart`).
- **Correct:** schedule a local notification at `remindAt` on creation (and reschedule on
  reboot), or label the feature in-app-only.

### H10. Production batch costs never touch cash/expenses; output cost is caller-supplied
- **File:** `lib/data/services.dart:671-743`.
- **Wrong:** no cash/expense/ledger rows for `labourCost`/`electricityCost`/`otherCost`;
  output `unitCostMinor` is whatever the caller passes (not derived from input + overhead
  cost); no rejection of negative qty/cost, zero qty, nonexistent products or duplicate
  lines (per-line stock check only, same flaw as H6).
- **Correct:** derive output unit cost from total batch cost ÷ output qty, post overhead
  to cash/expenses (or document it as non-cash), validate signs/products.

### H11. Backup validation is too weak to catch a bad restore
- **File:** `lib/data/backup.dart:64-92, 131-133`.
- **Wrong:** accepts `formatVersion` 0/missing (only `> 1` rejected); never checks
  `manifest['dbFile']` against the actual file; probes only
  `SELECT id FROM business_settings LIMIT 1` (no `PRAGMA integrity_check`, no
  table/schema completeness check); the probe executor opens the backup read-write, so
  validation itself can mutate the file it just checksummed. `kBackupFormatVersion = 1`
  is decoupled from DB `schemaVersion = 2` (`db.dart:455`), so no manifest field records
  which DB schema a backup contains.
- **Correct:** store schema version in the manifest, verify filename + integrity_check +
  required tables, probe read-only.

### H12. Drive auto-backup bookkeeping bugs
- **File:** `lib/data/drive_backup.dart:97-98` (`_recordAutoBackup()` runs even for *manual*
  uploads, resetting the 24 h timer); `:132-147` (`_pruneOld` lists `pageSize: 50`, so
  beyond 50 auto-backups the oldest are never seen or pruned despite `keepCount = 7`);
  `:47-60` (`_folderId` — a cached `driveFolderId` is returned forever, no recovery if
  that folder was deleted/trashed on Drive).
- **Correct:** record last-auto time only when `isAuto`, page through the full listing
  when pruning, re-discover/recreate the folder on a stale-id failure.

### H13. Auto-backup runs a second DB connection and swallows all failures, yet reports success
- **File:** `lib/data/auto_backup.dart:57-95` — `checkAndRun` calls `initProductionDb()` and
  opens a *new* `AppDatabase` while the UI isolate's DB may be open (SQLite lock /
  WAL-checkpoint race with `backup.dart:35`), catches and discards every exception, and
  `_callbackDispatcher` (`:88-94`) unconditionally returns `true`.
- **Correct:** coordinate single-writer access (or accept the race explicitly),
  surface/log failures, return `false`/retry from the Workmanager task on failure.

### H14. Statement PDF: no date filter in UI; `to` ignored (HEAD); no opening row; single-page truncation
- **Files:** `lib/presentation/screens/party_detail_screen.dart:659-682, 321-332`
  (PDF icon calls `_sharePdf` directly; no `showDatePicker`/`DateRangeField` in the screen
  except the reminder picker `:502`); `lib/data/party_actions.dart:50-66`
  (accepts `from`/`to` but passes `nowMs` as `to`, ignoring caller's `to`);
  `lib/data/documents.dart:185-220` (no opening-balance row, labels current `cust.balance`
  as "Outstanding" instead of period-end, orders by `date` only, single `pw.Page` so long
  statements overflow/clip instead of paginating; same single-page pattern in all five
  PDFs `:100, 157, 199, 238, 274`).
- **Correct:** add from/to pickers before generating, honour `to`, show opening balance +
  period-end outstanding, order by `date, id`, paginate with `MultiPage`.
- **[FIX IN PROGRESS — working tree]:** the uncommitted diff already converts the
  statement PDF to `MultiPage`, adds opening/closing balances and an empty-range line,
  and honours `to` via `_endOfDay`/`_startOfDay`. Phase 2 must verify the finished
  version; the UI date pickers and the supplier branch (C10) are still open.

### H15. Khata tab PDF button is a placeholder that produces no PDF
- **File:** `lib/presentation/screens/khata_tab.dart:244-247` — `_exportPdf` only shows
  a "coming soon" snackbar ("Team B wires the full customer-list PDF (B10)"), while the
  `customerListPdf()` generator already exists in `documents.dart` and is never called.
- **Correct:** wire the button to `customerListPdf()` + share sheet, or remove/hide it
  until wired.

### H16. Party detail shows only the net balance — no total DIYE / total LIYE
- **File:** `lib/presentation/screens/party_detail_screen.dart:184-252` (`_balanceHero`
  shows only `balance.abs()` + one label `leneHain`/`deneHain`) and `:337-388`
  (`_ledgerTable` shows per-row amounts only, no sum row).
- **Correct:** show "Total diye: Rs X • Total liye: Rs Y • Net: Rs Z" above the ledger,
  computed from the same `partyLedger` rows. (Per-row sides exist; only the totals are
  missing — this is Rehan's complaint #4.)

### H17. Overflow/wrap risk is systemic: no text-constraint handling + fixed grids + large money fonts
- **Files:** `lib/presentation/widgets/ek.dart:30-57` (`StatCard` value `fontSize: 24`,
  no `FittedBox`/`maxLines`/`overflow`/`softWrap` — grep returns zero matches across
  `ek.dart`, `ui.dart`, `theme.dart`); `ek.dart:92-120` (`HeroBalanceCard` 22pt);
  `lib/presentation/widgets/ui.dart:40-57` (`MoneyText` plain `Text`);
  `lib/presentation/screens/sales_dashboard_screen.dart:271-296`
  (2-column grid, `childAspectRatio: 1.35`, 24pt values);
  `lib/presentation/screens/dashboard_tab.dart:77-92` (hero amount 20pt in half-width
  `Expanded`), `:99-103` (4-column grid with no `childAspectRatio` — 56dp icon + label
  exceeds the default square cell on narrow phones).
- **Wrong:** a value like `Rs 1,234,567.89` at 24pt bold does not fit a half-width card;
  release shows overflow/clipping, debug shows the overflow banner.
- **Correct:** wrap amount `Text` in `FittedBox(fit: BoxFit.scaleDown)` (keeping
  `FontFeature.tabularFigures()`), `maxLines: 1`, and give the 4-column grid an explicit
  aspect ratio sized for icon + two-line label.
- **Note:** this is a verified code pattern, not the screenshot defect (V-0) — exact wrap
  points depend on phone width and font scaling.

### H18. PIN lock is silently bypassed when secure-storage lookup errors
- **File:** `lib/app/app.dart:78-84` (`_Gate`): `error: (_, __) => const HomeScreen(),`
  on `hasPinProvider`.
- **Wrong:** any secure-storage failure opens the app unlocked instead of failing closed.
- **Correct:** on PIN-check error, show an error/locked screen and retry; never route to
  `HomeScreen` on an error branch. (Separate minor leak: settings-load error at
  `app.dart:73-75` shows raw `Database error: $e` — show a generic message.)

### H19. "Customer Ledger" / "Supplier Ledger" reports ignore the party entirely
- **Files:** `lib/presentation/screens/reports_tab.dart:30-31` (entries `cust_ledger`,
  `sup_ledger`); `lib/presentation/screens/report_view_screen.dart:194-209`
  (`_txnReport`'s category switch has no `cust_ledger`/`sup_ledger` case, falling to
  `_ => null` = all categories, all parties; no party picker on the screen).
- **Correct:** add a party picker for these two kinds and filter by
  `partyKind`/`partyId`, or remove the entries.

### H20. Backup restore failure leaves the database closed with no recovery path
- **File:** `lib/presentation/screens/backup_screen.dart:112-159` (`_restore`:
  `await db.close()` then `restoreIntoPlace`; on failure it only shows a snackbar and
  resets `_busy` — the database is never reopened, so the app is unusable until
  force-restart; the failure path also skips the `finally` other actions use).
- **Correct:** reopen/recreate the database (or restart-guard) on restore failure, and
  keep the explicit confirm dialog for this destructive path.

### H21. Reminder is plain text only — no ledger PDF attached (Rehan complaint #6)
- **Files:** `lib/presentation/screens/party_detail_screen.dart:631-654` (`_sendReminder`
  builds only a text string via `_pickTemplate` and opens `sms:` / `wa.me` links);
  `lib/core/message_templates.dart:10-21` (`buildReminderMessage`). Neither link can
  carry a file.
- **Correct:** the reminder action must send/share the full ledger as a PDF (as the
  separate share-sheet button already does). At minimum offer "reminder + full statement
  PDF" via the system share sheet; a wa.me/sms link alone can never satisfy this.
- **[FIX IN PROGRESS — working tree]:** `party_actions.dart` now has a
  `shareReminderWithLedgerPdf` method (message + full-ledger PDF via share sheet).
  Phase 2 must verify the party-detail buttons actually call it.

### H22. The "Urdu" reminder/bill templates are Roman Urdu, not Urdu script
- **File:** `lib/core/message_templates.dart:25-28` (`kReminderTemplateUr =
  'Assalam-o-Alaikum {name}! {business} ki taraf se yaad dehani…'`) and `:36-38`
  (`kBillShareTemplateUr`, same pattern). No Urdu-script template constant exists
  anywhere in the file.
- **Correct:** when the app locale is `ur` (Urdu script), templates must be in Urdu script
  (e.g. السلام علیکم…). Roman Urdu text must appear only if the user explicitly
  selected Roman Urdu, never as the "Urdu" template.

### H23. English locale contains Roman Urdu strings — "pure English" fails in English mode
- **File:** `lib/l10n/app_en.arb` — verified examples: `kullSales: "KULL SALES"` (`:323`),
  `hafta: "Hafta"` (`:327`), `saleDarjKarein: "Sale darj karein"` (`:331`),
  `maineyDiye: "Mainey Diye"` (`:334`), `maineyLiye: "Mainey Liye"` (`:335`),
  `leneHain: "Maine lene hain"` (`:337`).
- **Wrong:** choosing English does not give pure English. (`app_ur.arb` is pure Urdu
  script for those keys; the mixing problem is the English locale, not the Urdu one.)
- **Correct:** rewrite all `app_en.arb` values in pure English.

### H24. No unified party: the same person as customer AND supplier has two separate ledgers
- **Files:** `lib/data/db.dart:65` (`Customers`) and `:87` (`Suppliers`) are separate
  tables with separate balances; sale flows write customer ledger rows, purchase flows
  write supplier ledger rows, with no link between them.
- **Wrong (Rehan complaint #7):** if he buys from someone who is a customer, that
  purchase never appears in that party's customer transactions/balance (it would need a
  separate supplier record), so neither ledger shows the person's true position.
  Same-role flows DO write ledger entries with references ("Sale $invoiceNo",
  "Purchase $invoiceNo") — the gap is cross-role only.
- **Correct:** either a unified party model, or an explicit "same person" link that
  surfaces both ledgers/balances from one party view (and states which balance is owed
  overall). At minimum, document the intended behaviour before release — today the app
  silently splits the person in two.

---

## MEDIUM (36)

### M1. Party ledger / statement queries are unbounded; dashboard recents are hard-capped with no paging
- **Files:** `lib/data/reports.dart:217-226` (`partyLedger`: no `limit`, no opening row);
  `:90-94` (dashboard recent transactions `limit(10)`), `:248-252` (sales recent
  `limit(20)`) with no offset/cursor API.
- **Correct:** add limit/offset (or cursor) parameters; keep 10/20 only as first-page sizes.

### M2. Sale/purchase validation gaps
- **Files:** `lib/data/services.dart:333-435, 437-541`.
- **Wrong:** product existence never checked (`_toBase` returns qty unchanged for a missing
  product, `:829-833`, and the movement is still inserted); party/product `active` flags
  never checked; zero-qty lines pass (`lineTotal = 0`, not `< 0`); negative
  `unitPriceMinor`/`discountMinor` only caught indirectly when a line total goes negative
  (a zero-price negative-qty line passes and *adds* stock on a sale).
- **Correct:** validate product/party existence and `active`, require qty > 0 and
  prices/discounts ≥ 0, reject unknown products.

### M3. Opening stock value ignored; opening cash has no ledger row; negative openings allowed
- **Files:** `lib/data/services.dart:1033-1065` (`createProduct`: `openingStockValue`
  parameter is never referenced; the opening movement is inserted with default
  `unitCostMinor: 0`, so valuation of opening stock is Rs 0); `:1066-1081`
  (`createCashAccount`: no transaction/ledger row for the opening balance, unlike
  customer/supplier openings, so cashbook/ledger cannot reconcile opening cash;
  negative `openingBalance` accepted with no check).
- **Correct:** store `openingStockValue` as the opening movement's unit cost, write an
  opening ledger entry for cash accounts, validate opening balances ≥ 0 or handle
  advances explicitly. (Negative openings are a second plausible contributor to the
  reported Cash Rs −1,100, alongside C8.)

### M4. Expense/income ledger `balanceAfter` is fake for pseudo-accounts
- **File:** `lib/data/services.dart:575, 611` — passes the *transaction amount* as
  `balanceAfterMinor`, not a running balance.
- **Correct:** maintain a running total per expense/income category, or store `0`/null
  and document that `balanceAfter` is only meaningful for customer/supplier/cash accounts.

### M5. Production yields sum unlike units, include drafts, omit material cost
- **File:** `lib/data/reports.dart:272-310` — input/output quantities summed as raw doubles
  with no base-unit conversion (kg + maund added directly); batches not filtered to
  `completed` (drafts included, as in dashboard `todayBatches`, `:121-124`); `totalCost`
  is only labour + electricity + other, excluding input material cost.
- **Correct:** convert to base units first, filter `status = 'completed'`, include input
  cost in total cost (or rename the field overhead-only).

### M6. Crash risks: unguarded throws instead of `Result`
- **Files:** `lib/data/services.dart:417` (`createSale`: `throw StateError('Account not
  found')` inside the transaction when a non-null but nonexistent `accountId` is passed;
  purchase mirror `:525` uses `!` on the same lookup);
  `lib/data/documents.dart:81-145, 185-220` (all PDF methods use `getSingle()` and throw
  `StateError` for a deleted invoice/customer instead of returning `Result`);
  `lib/core/units.dart:14-31` (`Qty.parse`: `int.parse` throws `FormatException` on
  malformed input, `"1/2/3"` silently parses as 1/2, `"1."` throws);
  `lib/core/units.dart:7-8` (`Qty.of` relies on `assert(d != 0)`, stripped in release, so
  a zero denominator yields an infinite/NaN quantity);
  `lib/core/result.dart:7-8` (`Result.value`/`error` cast unchecked — calling `.value`
  on an `Err` throws `TypeError`).
- **Correct:** return `Err` for missing accounts/invoices, validate/try-parse quantities,
  enforce `den != 0` without `assert`, guard `Result` accessors.

### M7. Dashboard aggregates hide advances and inactive records; free-text account types can vanish
- **File:** `lib/data/reports.dart:28-32` (receivables/payables sum only `balance > 0`
  over *all* customers/suppliers including inactive; negative advance balances disappear
  from both totals with no "advances" line); `:80-88` (cash/bank sums over all accounts
  including inactive, and only exact `type == 'cash'`/`'bank'` — `createCashAccount`,
  `services.dart:1066+`, accepts any free-text `type`, so a mistyped account's money is
  invisible on the dashboard).
- **Correct:** filter `active`, show advances as a separate line, constrain account `type`
  to an enum.

### M8. Ledger rows can show the wrong side (DIYE vs LIYE)
- **File:** `lib/presentation/screens/party_detail_screen.dart:368-381` —
  `final isDiye = debit > 0;` with `amountLabel` from debit-or-credit. Root cause is H5:
  `_postTxn` always writes `debit = amount, credit = 0` even when `apply` *reduces* the
  balance (e.g. a negative opening balance), so such a row renders as DIYE. An entry with
  both sides zero renders as a "Rs 0.00 LIYE" row.
- **Correct:** classify by the sign of the balance movement / debit-credit pair, not
  `debit > 0` alone.

### M9. Ledger refetches (and flashes a spinner) on every keystroke; ledger queried twice per build
- **File:** `lib/presentation/screens/party_detail_screen.dart:287-306` (search `onChanged`
  → `setState`) + `:339-344` (`FutureBuilder` with an inline `Future.wait([...])` future,
  recreated on every rebuild) + `:391-396` (`_imageMap()` calls `partyLedger(...)` a
  second time).
- **Wrong:** while searching, history flickers/disappears behind a spinner; every rebuild
  runs two full ledger queries.
- **Correct:** hoist the future into state / cache it and re-run only when the party
  changes; call `partyLedger` once and derive the image map from that result.

### M10. Search with no matches looks like a broken/empty screen
- **File:** `lib/presentation/screens/party_detail_screen.dart:354-385` — when `filtered` is
  empty, `LedgerTable` still renders headers with zero rows and no message (the
  `EmptyState` at `:354-356` only fires when the *unfiltered* list is empty).
- **Correct:** show "No matching entries" when the filtered list is empty.

### M11. No error state on party detail; nested Scaffold
- **File:** `lib/presentation/screens/party_detail_screen.dart:51-59` (`StreamBuilder`
  checks only `!snap.hasData`, never `snap.hasError`; on error it returns a second
  `Scaffold` inside the outer `Scaffold`'s body) and `:346-351` (ledger `FutureBuilder`
  likewise checks only `!snap.hasData`).
- **Wrong:** a deleted party or query error = infinite spinner.
- **Correct:** handle `hasError` with an error message + retry; don't nest Scaffolds.

### M12. Dead sort button on party detail
- **File:** `lib/presentation/screens/party_detail_screen.dart:316-319` —
  `IconButton(icon: const Icon(Icons.sort), onPressed: () {})`.
- **Correct:** wire it to a real sort (date/amount) or remove it — the Khata tab's sort
  sheet (`khata_tab.dart:223-242`) is the working pattern to reuse.

### M13. Below-standard tap targets and tiny secondary text
- **Files:** `lib/presentation/screens/party_detail_screen.dart:309-332` (sort/PDF icon
  containers fixed 44×44, below the 48dp guideline);
  `lib/presentation/screens/sales_dashboard_screen.dart:191-262` (range chips ≈ 37dp tall);
  `lib/presentation/widgets/ek.dart:930-950` (bill-image delete button: 16dp icon inside
  an unpadded `InkWell`, effective target ~16–20dp);
  `lib/presentation/widgets/ek.dart:730-775` (`DateRangeField` pills ≈ 37–38dp high);
  11–12px secondary text in `party_detail_screen.dart:134`,
  `sales_dashboard_screen.dart:153, 461`, `cashbook_screen.dart` history balance.
- **Correct:** 48dp minimum targets; don't use 11px for amounts/balances.

### M14. Sales search ignores customer names
- **File:** `lib/presentation/screens/sales_dashboard_screen.dart:395-403` — filter checks
  only `i.invoiceNo.contains(_q) || i.totalMinor.toString().contains(_q)`; the invoice's
  customer is never matched (and `recentInvoices` carry `customerId`, so the name is
  joinable).
- **Correct:** also match customer name (and invoice status).

### M15. Dead filter button on Sales dashboard; recent-sale rows are not tappable
- **File:** `lib/presentation/screens/sales_dashboard_screen.dart:386-390`
  (`Icons.filter_list`, `onPressed: () {}`) and `:414-470` (recent-sale rows are plain
  `Container`s with no `onTap`/navigation to any invoice detail — no sale-detail view
  exists today).
- **Correct:** implement the filter or remove the button; make rows open a sale-detail view.

### M16. Transactions search is case-sensitive and three filter chips show raw snake_case
- **File:** `lib/presentation/screens/transactions_tab.dart:21-26` (`_cats` includes
  `'customer_advance'`, `'supplier_advance'`, `'adjustment'`) vs `:126-141` (`_catLabel`
  switch has no cases for those three, falling through to `_ => c`), and `:118-122`
  (search uses `t.description.contains(_q)` with `_q` only trimmed, not lowercased —
  unlike Khata/Sales which lowercase).
- **Correct:** add the three labels; lowercase both sides of the search.

### M17. Transfer ignores the manual date the user just picked
- **File:** `lib/presentation/screens/txn_form_screen.dart:172-203` (date pill shown for
  every mode) vs `:390-396` — the `transfer` branch calls `transferFunds(...)` with no
  `date:` argument, while the other five branches pass `date: _dateMs` (`:354-388`).
- **Correct:** pass `date: _dateMs` for transfers too (the service already accepts it).

### M18. Sale and purchase forms have no date control; transaction-form dates are date-only (time forced to midnight)
- **Files:** `lib/presentation/screens/sale_form_screen.dart` (no `showDatePicker`
  anywhere — date is always "now" from the service);
  `lib/presentation/screens/production_screen.dart` (batch form likewise has no date field);
  `lib/presentation/screens/txn_form_screen.dart:184-187`
  (`_dateMs = DateTime(picked.year, picked.month, picked.day)` — time discarded).
- **Wrong (Rehan complaint #1, in part):** detail-screen `fmtDateTime` *can* show time,
  but every manually-dated transaction displays 12:00 AM; sales/production cannot be
  backdated at all.
- **Correct:** add a date picker to sale/production forms, and add an optional time picker
  (or preserve current time-of-day) in the transaction form.

### M19. Supplier "Liye" flow drops the supplier the user came from
- **File:** `lib/presentation/screens/party_detail_screen.dart:484-494` — `_goLiye()` for
  suppliers opens `const SaleFormScreen(mode: DocMode.purchase)` with no party preset,
  while `_goDiye()` (`:470-482`) correctly passes `presetPartyId`/`presetKind` to
  `TxnFormScreen`. `SaleFormScreen` has no preset-party parameter at all.
- **Correct:** add a preset-supplier parameter to `SaleFormScreen` and pass
  `widget.partyId` here.

### M20. Sale-form validation gaps
- **File:** `lib/presentation/screens/sale_form_screen.dart:97-117` (discount/tax
  `TextFormField`s have no `validator`; `parseAmountMinor` returns 0 for garbage);
  `:66-69` (`grand = total - discount + tax` can go negative and is displayed as-is;
  the service rejects it only at save); `:171-195` (party picker shows a bare
  `LinearProgressIndicator` while loading — no form field — so `_save`'s
  `_form.currentState!.validate()` can pass and then `_partyId!` at `:385`/`:394` throws).
- **Correct:** validate discount/tax/paid as numbers, clamp/show an error when discount
  exceeds subtotal, disable Save until the party list has loaded.

### M21. Dismissible line items use index keys — swipe-delete can remove the wrong row
- **File:** `lib/presentation/screens/sale_form_screen.dart:216-225` —
  `key: ValueKey('line$i')` where `i` is the list index; after `removeAt(i)` the
  remaining rows' keys shift.
- **Correct:** key by a stable per-line id (product + insertion counter), not the index.

### M22. Product/unit pickers display a stale unit after product selection
- **Files:** `lib/presentation/screens/sale_form_screen.dart:280-289` and
  `lib/presentation/screens/production_screen.dart:231` — unit dropdown uses
  `initialValue: uid`; picking a product sets `uid` to the product's base unit, but
  `initialValue` is only read once, so the dropdown still shows blank/previous while the
  saved line uses the new `uid`.
- **Correct:** use `value: uid` (controlled) instead of `initialValue`.

### M23. Receivables/Payables reports ignore the on-screen date range
- **File:** `lib/presentation/screens/report_view_screen.dart:143-158` — receivables query
  has no `date.isBetweenValues(_f, _t)` filter; same for payables — unlike every other
  report on the same screen, changing From/To does nothing here.
- **Correct:** either filter by date (e.g. balance as of To) or hide the date controls for
  these two reports with a note.

### M24. Report tables cannot scroll vertically — long reports overflow
- **File:** `lib/presentation/screens/report_view_screen.dart:266-291` — `_table` wraps
  `DataTable` in `SingleChildScrollView(scrollDirection: Axis.horizontal)` only, inside
  an `Expanded` — vertical overflow has no scroll path.
- **Correct:** nest vertical + horizontal scroll views (or use `PaginatedDataTable`/
  `ListView`).

### M25. Settings rows are near-invisible in dark mode
- **File:** `lib/presentation/screens/settings_screen.dart:148` — subtitle
  `TextStyle(color: Colors.black87, fontSize: 15)` hardcoded regardless of theme (the
  title next to it correctly uses grey).
- **Correct:** use a theme-aware color (`AppColors.ink`/`inkDark` or
  `Theme.of(context).textTheme`).

### M26. Product stock flashes "In stock: 0" / false low-stock warnings while loading
- **File:** `lib/presentation/screens/products_screen.dart:70-79` — a per-row
  `FutureBuilder<Qty>` defaults `s.data ?? Qty.zero` before the query completes, so every
  row briefly shows 0 stock and the orange low-stock state, plus one query per visible
  row on every rebuild.
- **Correct:** show a placeholder while loading and cache/batch stock lookups.

### M27. `BillImagePicker` calls `setState` after awaits without a `mounted` check
- **File:** `lib/presentation/widgets/ek.dart:840-875` (`_showSheet`) — after
  `await showModalBottomSheet…`, `setState(() => _busy = true)` runs unguarded (`:851`);
  after `await pickImage…/copy…`, `setState(() => _paths.add(…))` runs unguarded (`:866`).
  Only the `catch`/`finally` blocks check `mounted` (`:869, 873`).
- **Wrong:** `setState() called after dispose()` crash if the screen is popped mid-pick.
- **Correct:** check `if (!mounted) return;` after every await before each `setState`.

### M28. Reminder template-picker labels are swapped for English-locale users
- **File:** `lib/presentation/screens/party_detail_screen.dart:549-553` —
  `final isUr = Localizations.localeOf(context).languageCode != 'en';` then
  `[(l.templateUrdu, isUr ? kReminderTemplateUr : kReminderTemplateEn),
    (l.templateEnglish, isUr ? kReminderTemplateEn : kReminderTemplateUr)]`.
  In English locale (`isUr == false`) the row labelled "Urdu message" previews the
  English template and vice versa.
- **Correct:** label and template must always pair ("Urdu message" → Urdu template,
  "English message" → English template), regardless of current locale.

### M29. Roman Urdu is still offered as a language, contradicting "pure English + pure Urdu script with a toggle"
- **Files:** `lib/presentation/screens/settings_screen.dart:66-70`
  (`value: 'ur-Latn', title: Text('Roman Urdu')`), enabled by `lib/app/app.dart:17-30`
  (`parseLocale`) and `:57-66` (`supportedLocales` includes `ur-Latn`).
- **Correct:** language toggle offers exactly English and Urdu script (Sindhi is a
  separate question for the user). Remove the `ur-Latn` option, or keep it only if the
  user explicitly re-approves Roman Urdu.

### M30. Roman Urdu locale is incomplete — 253 of 370 strings fall back to Urdu script
- **File:** `lib/l10n/app_localizations_ur.dart:1155`
  (`class AppLocalizationsUrLatn extends AppLocalizationsUr`, only 117 overrides vs 370
  keys; `app_ur_Latn.arb` has only 118 keys vs 375 in `app_en.arb`).
- **Wrong:** inheritance fallback means untranslated Roman keys render in Arabic script —
  a Roman-Urdu user sees Urdu-script strings for most screens (mixed-script UI).
- **Correct:** either complete the Roman Urdu translation (all 370 keys) or remove the
  locale so no user gets a half-Roman/half-script UI.

### M31. Sindhi locale is mostly English — 247 of 370 strings are untranslated English
- **File:** `lib/l10n/app_localizations_sd.dart` (all getters; `app_sd.arb` has only 107
  keys, and 247 generated getters contain pure English text such as
  `accountName => 'Account name'`).
- **Correct:** either complete the Sindhi translation or remove/hide the Sindhi option
  until it is complete. (Not part of the user's EN+UR requirement, but Settings offers
  Sindhi as if it were a full language.)

### M32. No Urdu font is set anywhere — Urdu renders in the system default, not Jameel Noori Nastaleeq
- **Files:** `lib/app/theme.dart` (both `buildLightTheme` and `buildDarkTheme` define no
  `textTheme`/`fontFamily`) + `pubspec.yaml` (`flutter:` section has only
  `uses-material-design: true` and `generate: true`; no `fonts:` block, no `.ttf` asset
  in the repo at HEAD). Grep for `fontFamily` across `theme.dart`, `widgets/*.dart`,
  `pubspec.yaml` returns nothing.
- **Correct:** bundle Jameel Noori Nastaleeq, declare it in `pubspec.yaml`, set it as the
  font for the `ur` locale (English stays Arial/Arial Bold per the user's standing font
  rule). Note: untracked `app/assets/` appeared in the working tree during the audit —
  it may be the font landing; Phase 2 must verify it is wired, not just present.

### M33. Date pickers allow future dates up to +365 days
- **Files:** `lib/presentation/screens/txn_form_screen.dart` (date pill: `lastDate` now +
  365 days), `lib/presentation/screens/report_view_screen.dart` (same),
  `lib/presentation/widgets/ek.dart` (`DateRangeField._pick`, same).
- **Wrong:** a future-dated transaction/sale inflates "this month" and "today" summaries
  before the date arrives, and a future-dated ledger row sorts above real entries.
- **Correct:** cap manual dates at today (or warn explicitly when a future date is chosen).

### M34. Ledger-table amount column is unconstrained
- **File:** `lib/presentation/widgets/ek.dart:248-268` (header: `Expanded(flex: 3/2/2)`) vs
  `:340-372` (row amount is a bare `Column(crossAxisAlignment: end)` with 15pt w800 text,
  not wrapped in `Expanded`/`Flexible`).
- **Correct:** constrain the amount column (`Expanded`/`Flexible` + `FittedBox` scale-down
  or ellipsis) so a long `Rs …` value cannot overflow the row on narrow screens.

### M35. Reminder time is silently fixed at 09:00 with no time picker and no disclosure
- **File:** `lib/presentation/screens/party_detail_screen.dart:501-540` (`_setReminder`:
  date-only `showDatePicker`, then `DateTime(picked.year, picked.month, picked.day, 9)`).
  No `showTimePicker` exists anywhere in the audited widgets/screens.
- **Correct:** either add a time picker or label the dialog that the reminder fires at
  09:00 on the chosen date.

### M36. No auto customer/supplier code at HEAD — a blank code is saved as blank (Rehan complaint #5)
- **Files (HEAD):** `lib/presentation/screens/party_form_screen.dart` (`_code` controller,
  saved as typed, no auto-fill shown); `lib/data/services.dart` at HEAD saved
  `code: Value(code)` verbatim with no `nextPartyCode` function.
- **Wrong at HEAD:** leaving the code field blank stores an empty code, not 1, 2, 3…;
  manually typed codes also have no uniqueness check (`code` column has no unique
  constraint, `db.dart:65-110`), so duplicates are possible.
- **[FIX IN PROGRESS — working tree]:** the uncommitted diff adds `nextPartyCode`
  (max numeric code + 1, inactive rows counted so codes are never reused) and applies it
  inside the transaction when the field is blank, for both customers and suppliers.
  Phase 2 must verify: (a) the form shows/previews the assigned code, (b) manual
  duplicates are rejected or also auto-resolved.

---

## LOW (13)

### L1. Return-item rows lose their unit; sale PDF shows raw fractions and no return line
- **Files:** `lib/data/db.dart:330-343, 357-370` (`SalesReturnItems`/`PurchaseReturnItems`
  have no `unitId` column, unlike `SalesInvoiceItems` `:240-252`, so a stored return qty's
  unit is unrecoverable); `lib/data/documents.dart:100-145` (sale PDF prints qty as
  `"${qtyNum}/${qtyDen}"` with no unit name, shows no returned-amount line, and
  "outstanding" = `total − paid`, ignoring returns).
- **Correct:** add `unitId` to return items, display quantities via `Qty.display()` +
  unit symbol, show returns/outstanding-net-of-returns on the PDF.

### L2. Biometric toggle, phone normalisation, contact pick — small correctness gaps
- **Files:** `lib/data/biometric_auth.dart:36-39` (`setEnabled(true)` writes the flag
  without checking `canUseBiometrics`, so it can be enabled on a device with no enrolled
  biometrics); `lib/core/phone.dart:20-36, 44-52` (`normalizePkPhone`: a 12-digit `92…`
  number is returned as-is even if malformed; an 11-digit landline `042…` is rewritten
  as a mobile `92…` number; `looksLikePhone` accepts any 7+ digits; the fallback
  `return digits;` passes invalid numbers through, producing a `wa.me/<invalid>` link
  that fails at WhatsApp with no in-app explanation);
  `lib/data/contact_picker.dart:20-27, 50-57` (first phone number is taken with no
  mobile-number preference).
- **Correct:** gate `setEnabled` on `canUseBiometrics`; validate length/prefix after the
  `92` branch (return `''` + "invalid number" otherwise); prefer mobile numbers in
  contact picks.

### L3. No trial-balance report exists
- **File:** `lib/data/reports.dart` (whole file) — dashboard, P&L, valuation, sales summary
  and party ledger exist, but no trial-balance aggregation over `ledgerEntries`
  (debits vs credits by account), so the books cannot be proven to balance.
- **Correct:** add a trial-balance query (sum debit/credit per account kind/id, with
  opening balances) — the ledger schema already supports it.

### L4. `fmtMoney`'s `compact` flag is dead code
- **File:** `lib/presentation/widgets/ui.dart:10-18` — `fmtMoney(BuildContext c, int minor,
  {bool compact = false})` never reads `compact`, always uses `decimalDigits: 2`, and no
  caller passes `compact` (verified across `presentation/`).
- **Correct:** either implement `compact` and use it on narrow cards, or remove the
  parameter so callers are not misled.

### L5. Wrong error message on the SMS path when no number exists
- **File:** `lib/presentation/screens/party_detail_screen.dart:631-650` (`_sendReminder`:
  `if (digits.isEmpty) showSnack(context, l.noWhatsappNumber, error: true)` regardless
  of `viaSms`).
- **Correct:** show a phone-number message for SMS and the WhatsApp message only for the
  WhatsApp path.

### L6. Locale mapping collapses Sindhi and Roman Urdu into English/Urdu formatting
- **File:** `lib/presentation/widgets/ui.dart:10-30` (`fmtMoney`, `fmtDate`, `fmtDateTime`:
  `loc == 'ur' ? 'ur_PK' : 'en_PK'`) — `sd` formats as `en_PK`, and `ur-Latn` formats as
  `ur_PK` (Urdu-script conventions) even though the UI is Roman.
- **Correct:** map each supported locale to its own formatting locale, or document the
  fallback explicitly.

### L7. Onboarding offers only English/Urdu while Settings offers four languages; MoreTab is dead code
- **Files:** `lib/presentation/screens/onboarding_screen.dart:52-66` (only `en` + `ur`
  radios; a second language section is also cited at `:731-742`) vs
  `lib/presentation/screens/settings_screen.dart:287-311` (four options);
  `lib/presentation/screens/more_tab.dart` (never imported by `home_screen.dart`, which
  uses only Khata/Sales/Account; it also redefines `AboutScreen`, which
  `account_tab.dart:380` already defines — a future joint import would collide).
- **Correct:** offer the same language set in both places (ideally just English + Urdu
  script, per M29); delete `more_tab.dart` or route to it.

### L8. Dead dashboard alerts
- **File:** `lib/presentation/screens/dashboard_tab.dart:179-203` — low-stock alert
  `onTap: () {}` and the outstanding-invoices row has no `onTap` at all.
- **Correct:** navigate to Products (low stock) and the relevant invoice/report list.

### L9. Cashbook shows a bare empty card when there are no accounts; empty account name silently does nothing
- **File:** `lib/presentation/screens/cashbook_screen.dart:28-70` (accounts `SectionCard`
  renders an empty `Column` when `accs` is empty — no `EmptyState`/hint, unlike every
  other list screen) and `:92-105` (`_addAccount` only creates when
  `nameC.text.trim().isNotEmpty`, otherwise the dialog just closes with no message).
- **Correct:** show an empty state with an Add action; validate the name field in-dialog.

### L10. Form validation is mostly absent outside the name/party fields
- **Files:** `lib/presentation/screens/party_form_screen.dart:76-122` (phone/WhatsApp/
  address/code/business/notes have no validators; opening balance uses
  `double.tryParse(...) ?? 0`, silently turning garbage into 0);
  `lib/presentation/screens/products_screen.dart:191-215` (price/reorder fields
  unvalidated, garbage → 0 via `parseAmountMinor`).
- **Correct:** numeric validators + phone-format check where a number is required.

### L11. TextEditingControllers are never disposed in most forms (minor leak)
- **Files:** `lib/presentation/screens/party_form_screen.dart` (7 controllers, no `dispose`),
  `sale_form_screen.dart` (4), `production_screen.dart` (4), `onboarding_screen.dart` (2),
  `pin_screen.dart` (1). Only `txn_form_screen.dart:48-52` and `khata_tab.dart:39-41` dispose.
- **Correct:** add `dispose()` overrides.

### L12. Raw exception text is shown to users on two error paths
- **Files:** `lib/presentation/screens/dashboard_tab.dart:30` and
  `lib/presentation/screens/report_view_screen.dart:79`
  (`Text('${l.errorGeneric}\n$e')`).
- **Correct:** show only the localized message; log the exception.

### L13. Settings-load error shows a raw database error (minor leak)
- **File:** `lib/app/app.dart:73-75` (settings-load error branch shows
  `Database error: $e`).
- **Correct:** show a generic message; log the detail.

---

## VERIFIED CORRECT — do not "fix" (checked, not assumed)

- **Core money math** (`core/money.dart`): integer paisa arithmetic, no doubles in
  financial totals; `percent()` and `allocate()` (last-share remainder) sound.
- **Balance conventions** (`domain/accounting.dart:16-41`): customer balance > 0 =
  receivable, supplier balance > 0 = payable, cash = funds on hand; sale/payment/return
  helpers match the docs. `Accounting.profitLoss` formula and `yieldPercent`
  null-on-zero-input are correct — P&L defects are in its inputs (H3), not the formula.
- **Rational quantities** (`core/units.dart:33-86`): `Qty` reduce/add/sub/mul/div and
  `stockOf` (`services.dart:815-827`) correct for base-unit stock; seeded conversions
  (1 maund = 40 kg, g↔kg, ton↔kg, `db.dart:494-506`) correct.
- **Cash sides of receive/pay/transfer/expense/income** (`services.dart:251-253, 314-316,
  573, 609, 660-662`): cash debit on receipt/transfer-in/income, credit on
  payment/transfer-out/expense — correct; supplier *payment* debit side is also correct
  (only the purchase side, C4, is wrong).
- **Invoice status mapping for the common path** (`domain/accounting.dart:47-58` +
  `services.dart:1017-1031`): unpaid → partially_paid → paid via `paidMinor` correct;
  the defect is only the return interaction (C2, H3).
- **Sale/purchase total arithmetic** (`services.dart:347-360, 452-465`): line total =
  qty × price − line discount, total = subtotal − discount + tax, with negative-total
  and paid-exceeds-total rejection — correct; defects are the missing validations and
  missing `Payment` rows (M2, H1), not the arithmetic.
- **Migration v1→v2** (`db.dart:455-483`): adds exactly the v2 columns/tables named in
  the comment and seeds the single `BackupSettings` row; `_seed` (default units, cash
  account, settings, document sequences) is complete for fresh installs.
- **Backup integrity intent** (`backup.dart:35, 41-53, 75-82`): WAL checkpoint before copy,
  FNV checksum in manifest, rejection of newer-format backups — right design; gaps are
  the weak probe and missing Drive manifest (H11, C6), not the checksum.
- **Same-role ledger entries exist with references:** sales and purchases DO create ledger
  entries ("Sale $invoiceNo", "Purchase $invoiceNo") — complaint #7's gap is cross-role
  only (H24), not a total absence.
- **Full-range ledger query:** `party_detail_screen.dart:341-342` calls
  `partyLedger(kind, partyId, 0, now)` — no pagination/limit truncates history;
  `reports.dart` orders ascending and the screen reverses to newest-first.
- **Date+time is displayed on detail rows:** `party_detail_screen.dart:374` uses
  `fmtDateTime` (date + time, `ui.dart`); new records stamp `DateTime.now()` automatically.
  The defect is upstream: manual dates carry midnight (M18), sale/production forms have
  no date control at all (M18).
- **Customer statement PDF path is wired end-to-end** for customers
  (`_sharePdf` → `shareStatementPdf` → `customerStatementPdf` → share sheet); only the
  supplier branch (C10) and the missing date filter (H14) break it.
- **Pure English and pure Urdu-script localizations exist and are complete:**
  `app_en.arb` and `app_ur.arb` both have 375 keys; generated `AppLocalizationsEn` and
  `AppLocalizationsUr` both expose all 370 getters. The EN+UR requirement breaks in the
  message templates (H22), the English locale's Roman strings (H23), and the extra
  Roman/Sindhi options (M29–M31) — not in the `.arb` files themselves.
- **No hardcoded Roman Urdu UI strings in shared widgets:** grep over `ek.dart`/`ui.dart`/
  `theme.dart` found Roman-Urdu words only in code comments; all user-visible strings go
  through `AppLocalizations`.
- **Reminder/transaction date pickers exist and work** (date-only); the gap is
  sale/production forms having none (M18).
- **Calculator keypad is crash-guarded:** `evaluateExpression` returns `null` on
  divide-by-zero and invalid input, wrapped in `try/catch`.
- **Bill-image busy state cannot stick:** `ek.dart:873` resets `_busy` in a
  `mounted`-guarded `finally` (the crash risk is the unguarded `setState` calls, M27,
  not the busy flag).
- **Phone normalisation for the common cases is correct:** `0300…` → `92…`, `+92…` →
  `92…`, `0092…` → `92…`, 10-digit `3…` handling — only the landline/malformed edge
  cases (L2) fail.
- **Auth/contact error handling shape:** permission denial, cancelled sign-in and
  biometric failure all return `Err` rather than throwing (except the toggle gap, L2);
  Drive `drive.file` scope and `keepCount = 7` pruning intent are appropriate.
- **Scrolling is present on nearly all screens** (`ListView`/`SingleChildScrollView` in
  Khata, Sales, Dashboard, forms, Settings, Backup, Products, Production, Cashbook
  history); the only scroll defect found is the report table (M24).
- **Loading/empty/error states exist on most list screens** via `async.when` (Khata party
  lists, Cashbook, Dashboard, Settings, Products, Transactions empty state) — the gaps
  are specifically party-detail (M11) and Khata heroes (error → silent `SizedBox.shrink()`,
  `khata_tab.dart:161`).
- **Dual action buttons are both present and correctly sized**
  (`party_detail_screen.dart:412-468`, 56dp, both "Mainey Diye" and "Mainey Liye" wired to
  the right form modes for customers; supplier "liye" mapping itself is right — only the
  preset is lost, M19).
- **Unknown stored language codes fail safe:** `app.dart:17-30` defaults any unrecognized
  language code to English rather than crashing on an unsupported locale.

---

## REHAN'S 8 COMPLAINTS → QA ITEMS (traceability)

| # | His complaint | QA items | Status |
|---|---|---|---|
| 1 | Customer detail: full history with date + time (auto real-time + manual option) | M18 (manual dates forced to midnight; sale/prod forms have no date control), M9 (search flicker), M35 (reminder time fixed 09:00); full-range query + date+time display verified OK | Open |
| 2 | PDF button + date selection shows nothing | H14 (no date filter in UI; `to` ignored at HEAD), H15 (Khata PDF placeholder), C10 (supplier PDF always fails) | Partly fixed in working tree (H14 service/PDF parts); UI pickers + C10 still open |
| 3 | Responsive: wrapping mid-word / mid-number, small buttons | H17 (systemic overflow risk), M34 (ledger amount column), M13 (tap targets) | Open. Screenshot defects themselves belong to another app (V-0) |
| 4 | Single party: only that party's dena + lena | H16 (no diye/liye totals, only net), H5/M8 (side correctness) | Open |
| 5 | Auto customer code 1, 2, 3… | M36 (missing at HEAD) | Fix in progress in working tree |
| 6 | Reminder must carry full ledger as PDF, not plain text | H21 (plain-text only at HEAD) | Method added in working tree; screen wiring still open |
| 7 | Buy/sell must appear in the party ledger with reference | H24 (no unified party — cross-role gap); same-role ledger entries verified present | Open (needs a product decision: unified party vs linked view) |
| 8 | Pure English + pure Urdu script (NOT Roman Urdu), with toggle | H22 (Roman templates), H23 (English locale has Roman strings), M29 (Roman offered), M30 (Roman incomplete), M31 (Sindhi incomplete), M32 (no Jameel font), L6/L7 | Open |

---

## PHASE 2 NOTE (for the re-check run)

Re-check every item above plus every fix the other teams claim, against the
post-fix tree (not HEAD line numbers — the fix teams' edits shift lines). Verify with
`flutter test` (unit + integration) and targeted code reads; nothing passes on word
alone. Pay special attention to: C4 (supplier ledger side — changes every supplier
statement), C8 (snapshot balances — needs a concurrency reasoning check, not just a
single-thread test), C6/C7/H20 (backup/restore round-trip), H14/H21/M36 (items already
moving in the working tree), and V-0 (confirm with Rehan which app the screenshots are
from before any release sign-off).

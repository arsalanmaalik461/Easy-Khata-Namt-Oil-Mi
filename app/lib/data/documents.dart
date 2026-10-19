import 'package:drift/drift.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../core/money.dart';
import 'db.dart';
import 'reports.dart';

/// Generates branded PDF documents. English layout in v1; Urdu layout
/// follows the same structure (textDirection set per locale).
class DocumentService {
  final AppDatabase db;
  DocumentService(this.db);

  Future<String> _businessName() async {
    final s = await (db.select(db.businessSettings)
          ..where((t) => t.id.equals(1)))
        .getSingleOrNull();
    return s?.businessName ?? 'Namt Oil Mil';
  }

  String _money(int minor) =>
      'Rs ${(minor / 100).toStringAsFixed(2)}';
  String _date(int ms) =>
      DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(ms));

  pw.Widget _header(String business, String title, String docNo,
      String date) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(business,
            style: pw.TextStyle(
                fontSize: 22, fontWeight: pw.FontWeight.bold)),
        pw.Text(title,
            style: pw.TextStyle(
                fontSize: 14, color: PdfColors.grey700)),
        pw.SizedBox(height: 8),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(docNo),
            pw.Text(date),
          ],
        ),
        pw.Divider(),
      ],
    );
  }

  pw.Widget _totals(List<(String, int)> rows, int grand) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        ...rows.map((r) => pw.Row(
              mainAxisAlignment:
                  pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(r.$1),
                pw.Text(_money(r.$2)),
              ],
            )),
        pw.Divider(),
        pw.Row(
          mainAxisAlignment:
              pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('Total',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold)),
            pw.Text(_money(grand),
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Future<List<int>> saleInvoicePdf(String invoiceId) async {
    final inv = await (db.select(db.salesInvoices)
          ..where((t) => t.id.equals(invoiceId)))
        .getSingle();
    final cust = await (db.select(db.customers)
          ..where((t) => t.id.equals(inv.customerId)))
        .getSingle();
    final items = await (db.select(db.salesInvoiceItems)
          ..where((t) => t.invoiceId.equals(invoiceId)))
        .get();
    final business = await _businessName();
    final doc = pw.Document();
    final prodNames = <String, String>{};
    for (final it in items) {
      final p = await (db.select(db.products)
            ..where((t) => t.id.equals(it.productId)))
          .getSingleOrNull();
      prodNames[it.productId] = p?.name ?? it.productId;
    }
    doc.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (_) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _header(business, 'Sale Invoice', inv.invoiceNo,
              _date(inv.date)),
          pw.Text('Customer: ${cust.name}'),
          if (cust.phone.isNotEmpty)
            pw.Text('Phone: ${cust.phone}'),
          pw.SizedBox(height: 12),
          pw.TableHelper.fromTextArray(
            headers: ['Item', 'Qty', 'Price', 'Total'],
            data: items
                .map((it) => [
                      prodNames[it.productId] ?? '',
                      '${it.qtyNum}/${it.qtyDen}',
                      _money(it.unitPriceMinor),
                      _money(it.lineTotalMinor),
                    ])
                .toList(),
          ),
          pw.SizedBox(height: 12),
          _totals([
            ('Subtotal', inv.subtotalMinor),
            ('Discount', -inv.discountMinor),
            ('Tax', inv.taxMinor),
            ('Paid', -inv.paidMinor),
          ], inv.totalMinor - inv.paidMinor),
          pw.SizedBox(height: 8),
          pw.Text('Status: ${inv.status}'),
          if (inv.notes.isNotEmpty)
            pw.Text('Notes: ${inv.notes}'),
        ],
      ),
    ));
    return doc.save();
  }

  Future<List<int>> paymentReceiptPdf(String paymentId) async {
    final pay = await (db.select(db.payments)
          ..where((t) => t.id.equals(paymentId)))
        .getSingle();
    final business = await _businessName();
    String partyName = pay.partyId;
    if (pay.partyKind == 'customer') {
      final c = await (db.select(db.customers)
            ..where((t) => t.id.equals(pay.partyId)))
          .getSingleOrNull();
      if (c != null) partyName = c.name;
    } else {
      final s = await (db.select(db.suppliers)
            ..where((t) => t.id.equals(pay.partyId)))
          .getSingleOrNull();
      if (s != null) partyName = s.name;
    }
    final doc = pw.Document();
    doc.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (_) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _header(business, 'Payment Receipt', pay.paymentNo,
              _date(pay.date)),
          pw.Text(
              pay.direction == 'receive'
                  ? 'Received from: $partyName'
                  : 'Paid to: $partyName',
              style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 8),
          pw.Text('Amount: ${_money(pay.amountMinor)}',
              style: const pw.TextStyle(fontSize: 18)),
          pw.Text('Method: ${pay.method}'),
          if (pay.reference.isNotEmpty)
            pw.Text('Reference: ${pay.reference}'),
          if (pay.notes.isNotEmpty)
            pw.Text('Notes: ${pay.notes}'),
        ],
      ),
    ));
    return doc.save();
  }

  Future<List<int>> customerStatementPdf(
      String customerId, int from, int to) async {
    final cust = await (db.select(db.customers)
          ..where((t) => t.id.equals(customerId)))
        .getSingle();
    final entries = await (db.select(db.ledgerEntries)
          ..where((t) =>
              t.accountKind.equals('customer') &
              t.accountId.equals(customerId) &
              t.date.isBetweenValues(from, to))
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .get();
    final business = await _businessName();
    final doc = pw.Document();
    doc.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (_) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _header(business, 'Customer Statement', cust.name,
              '${_date(from)} — ${_date(to)}'),
          pw.TableHelper.fromTextArray(
            headers: ['Date', 'Description', 'Debit', 'Credit', 'Balance'],
            data: entries
                .map((e) => [
                      _date(e.date),
                      e.description,
                      _money(e.debitMinor),
                      _money(e.creditMinor),
                      _money(e.balanceAfterMinor),
                    ])
                .toList(),
          ),
          pw.SizedBox(height: 12),
          pw.Text(
              'Outstanding: ${_money(cust.balance)}',
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold)),
        ],
      ),
    ));
    return doc.save();
  }

  /// Whole customer-list PDF (for the Khata tab PDF export button).
  /// Lists all active customers with phone and current balance.
  Future<List<int>> customerListPdf() async {
    final customers = await (db.select(db.customers)
          ..where((t) => t.active.equals(true))
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .get();
    final business = await _businessName();
    final doc = pw.Document();
    doc.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (_) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _header(business, 'Customer List', '${customers.length} customers',
              _date(DateTime.now().millisecondsSinceEpoch)),
          pw.TableHelper.fromTextArray(
            headers: ['Name', 'Phone', 'Balance'],
            data: customers
                .map((c) => [
                      c.name,
                      c.phone,
                      _money(c.balance),
                    ])
                .toList(),
          ),
        ],
      ),
    ));
    return doc.save();
  }

  /// Date-range summary PDF: profit/loss totals + transaction list for
  /// [from]..[to] (ms since epoch). Used by the custom-range export.
  Future<List<int>> dateRangeSummaryPdf(int from, int to) async {
    final reports = ReportService(db);
    final pl = await reports.profitLoss(from, to);
    final txns = await (db.select(db.transactions)
          ..where((t) =>
              t.date.isBetweenValues(from, to) &
              t.status.equals('posted'))
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .get();
    final business = await _businessName();
    final doc = pw.Document();
    doc.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (_) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _header(business, 'Summary', '${_date(from)} — ${_date(to)}',
              _date(DateTime.now().millisecondsSinceEpoch)),
          _totals([
            ('Revenue', pl.revenue.minor),
            ('Expenses', pl.operatingExpenses.minor),
          ], pl.profit.minor),
          pw.SizedBox(height: 16),
          pw.Text('Transactions (${txns.length})',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 8),
          pw.TableHelper.fromTextArray(
            headers: ['Date', 'No.', 'Description', 'Amount'],
            data: txns
                .map((t) => [
                      _date(t.date),
                      t.txnNumber,
                      t.description.isEmpty ? t.category : t.description,
                      _money(t.amountMinor),
                    ])
                .toList(),
          ),
        ],
      ),
    ));
    return doc.save();
  }
}

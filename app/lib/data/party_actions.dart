import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/message_templates.dart';
import '../core/phone.dart';
import '../core/result.dart';
import 'db.dart';
import 'documents.dart';

/// WhatsApp / SMS actions for a customer or supplier.
///
/// Team A owns the action-row UI in party_detail_screen.dart; this file owns
/// the deep-link + PDF-share logic behind the buttons.
class PartyActions {
  final AppDatabase db;
  final DocumentService docs;

  PartyActions(this.db) : docs = DocumentService(db);

  /// Effective WhatsApp number: whatsapp field, falling back to phone.
  String effectiveWhatsapp(Customer c) =>
      normalizePkPhone(c.whatsapp.isNotEmpty ? c.whatsapp : c.phone);

  String effectiveWhatsappSupplier(Supplier s) =>
      normalizePkPhone(s.whatsapp.isNotEmpty ? s.whatsapp : s.phone);

  /// Opens the customer's WhatsApp chat with a prefilled message.
  /// Returns Err when no usable number exists or WhatsApp can't open.
  Future<Result<void>> openWhatsAppChat({
    required String digits,
    String message = '',
  }) async {
    if (digits.isEmpty) return const Err('No WhatsApp number');
    final uri = Uri.parse(
        'https://wa.me/$digits${message.isEmpty ? '' : '?text=${Uri.encodeComponent(message)}'}');
    try {
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      return ok ? const Ok(null) : const Err('Could not open WhatsApp');
    } catch (e) {
      return Err('Could not open WhatsApp: $e');
    }
  }

  /// Generates the party's statement PDF and opens the system share sheet
  /// so the user can send it via WhatsApp (wa.me links can't attach files —
  /// the share sheet is the reliable cross-device path).
  ///
  /// [kind] selects the statement path: 'customer' uses the customer
  /// statement, 'supplier' the supplier statement. A supplier id must
  /// never go through the customer-only query (C10).
  ///
  /// [from]/[to] bound the ledger exactly: [from] is start-of-day,
  /// [to] is end-of-day, so a selected date range shows every entry of
  /// both boundary days. Omitting both shares the full statement.
  Future<Result<void>> shareStatementPdf({
    required String customerId,
    required String customerName,
    required int balanceMinor,
    required String businessName,
    String kind = 'customer',
    DateTime? from,
    DateTime? to,
    bool urdu = false,
  }) async {
    try {
      final nowMs = DateTime.now().millisecondsSinceEpoch;
      final fromMs = from == null
          ? DateTime(2000).millisecondsSinceEpoch
          : _startOfDay(from);
      final toMs = to == null ? nowMs : _endOfDay(to);
      final pdfBytes = kind == 'supplier'
          ? await docs.supplierStatementPdf(customerId, fromMs, toMs)
          : await docs.customerStatementPdf(customerId, fromMs, toMs);
      final dir = await getTemporaryDirectory();
      final stamp = DateTime.now().millisecondsSinceEpoch;
      final file = File('${dir.path}/statement-$stamp.pdf');
      await file.writeAsBytes(pdfBytes, flush: true);

      final template = urdu ? kBillShareTemplateUr : kBillShareTemplateEn;
      final text = buildReminderMessage(
        template: template,
        customerName: customerName,
        amount: formatAmountShort(balanceMinor),
        businessName: businessName,
      );
      await Share.shareXFiles([XFile(file.path)], text: text);
      return const Ok(null);
    } catch (e) {
      return Err('Could not share statement: $e');
    }
  }

  /// Shares a payment reminder WITH the party's full ledger as a PDF.
  /// SMS/WhatsApp deep links (sms:/wa.me) cannot carry file attachments,
  /// so the reminder goes through the system share sheet: the message text
  /// plus the generated statement PDF, and the user picks the app (WhatsApp,
  /// SMS, …) there. The PDF covers the party's entire ledger.
  ///
  /// [kind] selects the statement path ('customer' or 'supplier').
  /// Before this fix every party was routed through the customer-only
  /// query, so supplier reminders always failed with "Could not share
  /// reminder" (R1 regression). The caller must still fall back to the
  /// plain-text deep link when this returns Err, so a reminder never
  /// silently dies.
  Future<Result<void>> shareReminderWithLedgerPdf({
    required String customerId,
    required String message,
    String kind = 'customer',
  }) async {
    try {
      final nowMs = DateTime.now().millisecondsSinceEpoch;
      final pdfBytes = kind == 'supplier'
          ? await docs.supplierStatementPdf(
              customerId,
              DateTime(2000).millisecondsSinceEpoch,
              nowMs,
            )
          : await docs.customerStatementPdf(
              customerId,
              DateTime(2000).millisecondsSinceEpoch,
              nowMs,
            );
      final dir = await getTemporaryDirectory();
      final stamp = DateTime.now().millisecondsSinceEpoch;
      final file = File('${dir.path}/ledger-$stamp.pdf');
      await file.writeAsBytes(pdfBytes, flush: true);
      await Share.shareXFiles([XFile(file.path)], text: message);
      return const Ok(null);
    } catch (e) {
      return Err('Could not share reminder: $e');
    }
  }

  /// Opens the SMS app with an exact prefilled message. Used as the
  /// plain-text fallback when the PDF share path fails, so a reminder
  /// still reaches the party instead of failing outright (R1).
  Future<Result<void>> openSmsChat({
    required String digits,
    String message = '',
  }) async {
    if (digits.isEmpty) return const Err('No phone number');
    final uri = Uri.parse(
        'sms:$digits${message.isEmpty ? '' : '?body=${Uri.encodeComponent(message)}'}');
    try {
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      return ok ? const Ok(null) : const Err('Could not open SMS app');
    } catch (e) {
      return Err('Could not open SMS app: $e');
    }
  }

  /// Opens the SMS app with a prefilled payment-reminder message.
  Future<Result<void>> sendSmsReminder({
    required String rawPhone,
    required String customerName,
    required int balanceMinor,
    required String businessName,
    bool urdu = false,
  }) async {
    final digits = normalizePkPhone(rawPhone);
    if (digits.isEmpty) return const Err('No phone number');
    final template = urdu ? kReminderTemplateUr : kReminderTemplateEn;
    final text = buildReminderMessage(
      template: template,
      customerName: customerName,
      amount: formatAmountShort(balanceMinor),
      businessName: businessName,
    );
    final uri = Uri.parse('sms:$digits?body=${Uri.encodeComponent(text)}');
    try {
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      return ok ? const Ok(null) : const Err('Could not open SMS app');
    } catch (e) {
      return Err('Could not open SMS app: $e');
    }
  }
}

int _startOfDay(DateTime d) =>
    DateTime(d.year, d.month, d.day).millisecondsSinceEpoch;
int _endOfDay(DateTime d) =>
    DateTime(d.year, d.month, d.day, 23, 59, 59, 999)
        .millisecondsSinceEpoch;

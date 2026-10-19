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

  /// Generates the customer's statement PDF and opens the system share sheet
  /// so the user can send it via WhatsApp (wa.me links can't attach files —
  /// the share sheet is the reliable cross-device path).
  Future<Result<void>> shareStatementPdf({
    required String customerId,
    required String customerName,
    required int balanceMinor,
    required String businessName,
    DateTime? from,
    DateTime? to,
    bool urdu = false,
  }) async {
    try {
      final nowMs = DateTime.now().millisecondsSinceEpoch;
      final fromMs = (from ?? DateTime(2000)).millisecondsSinceEpoch;
      final pdfBytes = await docs.customerStatementPdf(
        customerId,
        fromMs,
        nowMs,
      );
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

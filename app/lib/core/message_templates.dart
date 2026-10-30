/// Ready-made WhatsApp/SMS message templates for payment reminders.
///
/// Placeholders: {name} = customer name, {amount} = formatted amount,
/// {business} = business name, {date} = due/reminder date.
library;

/// Builds a payment reminder message from a template.
///
/// [template] may contain {name}, {amount}, {business}, {date}.
String buildReminderMessage({
  required String template,
  required String customerName,
  required String amount,
  required String businessName,
  String date = '',
}) {
  return template
      .replaceAll('{name}', customerName)
      .replaceAll('{amount}', amount)
      .replaceAll('{business}', businessName)
      .replaceAll('{date}', date);
}

/// Built-in Urdu template (default) — pure Urdu script, not Roman Urdu.
const String kReminderTemplateUr =
    'السلام علیکم {name}! {business} کی طرف سے یاد دہانی: '
    'آپ کا {amount} روپے کا حساب باقی ہے۔ '
    'براہ مہربانی جلد ادا کر دیں۔ شکریہ!';

/// Built-in English template.
const String kReminderTemplateEn =
    'Hello {name}, reminder from {business}: your balance of Rs {amount} '
    'is pending. Please pay at your earliest. Thank you!';

/// Built-in bill-share template (sent with the PDF statement) — Urdu script.
const String kBillShareTemplateUr =
    'السلام علیکم {name}! {business} سے آپ کے حساب کی تفصیل '
    '(PDF) اس پیغام کے ساتھ ہے۔ کل بقایا: {amount} روپے۔';

const String kBillShareTemplateEn =
    'Hello {name}, your account statement (PDF) from {business} is attached. '
    'Total balance: Rs {amount}.';

/// Formats a minor-unit amount as "12,345" (no decimals when whole).
String formatAmountShort(int minor) {
  final major = minor / 100;
  final s = major.toStringAsFixed(major.truncateToDouble() == major ? 0 : 2);
  // thousands separators
  final parts = s.split('.');
  final digits = parts[0].replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (m) => '${m[1]},',
  );
  return parts.length > 1 ? '$digits.${parts[1]}' : digits;
}

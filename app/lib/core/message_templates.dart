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

/// Built-in Urdu template (default).
const String kReminderTemplateUr =
    'Assalam-o-Alaikum {name}! {business} ki taraf se yaad dehani: '
    'aap ka Rs {amount} ka hisaab baqi hai. '
    'Baraye meherbani jald ada kar dein. Shukriya!';

/// Built-in English template.
const String kReminderTemplateEn =
    'Hello {name}, reminder from {business}: your balance of Rs {amount} '
    'is pending. Please pay at your earliest. Thank you!';

/// Built-in bill-share template (sent with the PDF statement).
const String kBillShareTemplateUr =
    'Assalam-o-Alaikum {name}! {business} se aap ke hisaab ki tafseel '
    '(PDF) is message ke saath hai. Kul baqaya: Rs {amount}.';

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

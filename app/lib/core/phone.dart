/// Pakistani phone number normalization for WhatsApp/SMS deep links.
///
/// Converts local formats to international digits-only format:
/// - `0300 1234567` -> `923001234567`
/// - `+92 300 1234567` -> `923001234567`
/// - `923001234567` -> `923001234567` (unchanged)
library;

/// Strips spaces, dashes, parentheses and leading `+` from [raw],
/// then normalizes Pakistani mobile numbers to `92XXXXXXXXXX`.
/// Returns '' when no usable digits remain.
String normalizePkPhone(String raw) {
  var digits = raw.replaceAll(RegExp(r'[^\d]'), '');
  if (digits.isEmpty) return '';
  // Drop international dial prefix if present.
  if (digits.startsWith('0092')) digits = digits.substring(2);
  if (digits.startsWith('92') && digits.length == 12) return digits;
  if (digits.startsWith('0') && digits.length == 11) {
    return '92${digits.substring(1)}';
  }
  // 10-digit mobile starting with 3 (missing leading 0)
  if (digits.length == 10 && digits.startsWith('3')) {
    return '92$digits';
  }
  return digits;
}

/// True when [raw] contains a plausible phone number (7+ digits).
bool looksLikePhone(String raw) =>
    raw.replaceAll(RegExp(r'[^\d]'), '').length >= 7;

/// WhatsApp number for a party: explicit whatsapp field wins,
/// otherwise falls back to the phone field. Empty when neither set.
String whatsappNumberFor({required String whatsapp, required String phone}) {
  final w = normalizePkPhone(whatsapp);
  if (w.isNotEmpty) return w;
  return normalizePkPhone(phone);
}

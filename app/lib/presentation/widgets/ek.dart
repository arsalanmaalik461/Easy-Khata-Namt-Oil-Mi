import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../app/theme.dart';
import 'ui.dart' show L, fmtDate, showSnack;

/// White stat card: UPPERCASE gray label, big black value, small subtitle.
class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String? subtitle;
  final Color? valueColor;
  const StatCard(
      {super.key,
      required this.label,
      required this.value,
      this.subtitle,
      this.valueColor});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: dark ? AppColors.cardDark : AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(), style: ekLabelStyle(context)),
          const SizedBox(height: 8),
          Text(value,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: valueColor ??
                      (dark ? AppColors.inkDark : AppColors.ink),
                  fontFeatures: const [
                    FontFeature.tabularFigures()
                  ])),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(subtitle!,
                style: TextStyle(
                    fontSize: 12,
                    color: dark
                        ? AppColors.mutedDark
                        : AppColors.muted)),
          ],
        ],
      ),
    );
  }
}

/// Tinted balance hero: icon in solid circle + bold amount + label.
class HeroBalanceCard extends StatelessWidget {
  final String amount;
  final String label;
  final bool isRed; // red = lene hain (receivable), green = dene hain
  final IconData icon;
  const HeroBalanceCard(
      {super.key,
      required this.amount,
      required this.label,
      required this.isRed,
      this.icon = Icons.arrow_downward});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final strong = isRed
        ? (dark ? AppColors.diyeDark : AppColors.diye)
        : (dark ? AppColors.liyeDark : AppColors.liye);
    final tint = isRed
        ? (dark ? AppColors.diyeLightDark : AppColors.diyeLight)
        : (dark ? AppColors.liyeLightDark : AppColors.liyeLight);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: tint, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: strong, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          const SizedBox(height: 10),
          Text(amount,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: strong,
                  fontFeatures: const [
                    FontFeature.tabularFigures()
                  ])),
          const SizedBox(height: 2),
          Text(label,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: strong)),
        ],
      ),
    );
  }
}

/// Icon + label action button (Tareekh Rakhein / SMS / WhatsApp row).
class ActionRowButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final VoidCallback onTap;
  const ActionRowButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.iconColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor, size: 30),
            const SizedBox(height: 4),
            Text(label,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: dark
                        ? AppColors.inkDark
                        : AppColors.ink)),
          ],
        ),
      ),
    );
  }
}

/// Full-width black CTA ("+ Sale darj karein").
class BigCtaButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData icon;
  const BigCtaButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.icon = Icons.add});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 22),
        label: Text(label,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700)),
        style: FilledButton.styleFrom(
          backgroundColor:
              dark ? Colors.white : AppColors.ctaBlack,
          foregroundColor:
              dark ? AppColors.ink : Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}

/// Light-blue info banner (no EasyKhata branding).
class TintedBanner extends StatelessWidget {
  final String text;
  const TintedBanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: dark
            ? const Color(0xFF1E2A38)
            : AppColors.bannerBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14,
              color: dark
                  ? AppColors.inkDark
                  : AppColors.ink)),
    );
  }
}

/// TIME | DIYE | LIYE ledger table with running-balance chips.
class LedgerTable extends StatelessWidget {
  final String diyeHeader;
  final String liyeHeader;
  final String timeHeader;
  final List<LedgerRowData> rows;
  const LedgerTable(
      {super.key,
      required this.diyeHeader,
      required this.liyeHeader,
      required this.timeHeader,
      required this.rows});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final muted =
        dark ? AppColors.mutedDark : AppColors.muted;
    final diyeC =
        dark ? AppColors.diyeDark : AppColors.diye;
    final liyeC =
        dark ? AppColors.liyeDark : AppColors.liye;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 4, vertical: 8),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Text(timeHeader,
                      style: ekLabelStyle(context))),
              Expanded(
                  flex: 2,
                  child: Text(diyeHeader,
                      textAlign: TextAlign.right,
                      style: ekLabelStyle(context))),
              Expanded(
                  flex: 2,
                  child: Text(liyeHeader,
                      textAlign: TextAlign.right,
                      style: ekLabelStyle(context))),
            ],
          ),
        ),
        ...rows.map((r) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:
                    dark ? AppColors.cardDark : AppColors.card,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: r.isDiye
                              ? (dark
                                  ? AppColors.diyeLightDark
                                  : AppColors.diyeLight)
                              : (dark
                                  ? AppColors.liyeLightDark
                                  : AppColors.liyeLight),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                            r.isDiye
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            size: 18,
                            color:
                                r.isDiye ? diyeC : liyeC),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(r.timeLabel,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight:
                                        FontWeight.w600)),
                            if (r.balanceLabel != null)
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 4),
                                padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 3),
                                decoration: BoxDecoration(
                                  color: dark
                                      ? AppColors.bgDark
                                      : AppColors.bg,
                                  borderRadius:
                                      BorderRadius.circular(
                                          8),
                                ),
                                child: Text(r.balanceLabel!,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: muted)),
                              ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.end,
                        children: [
                          if (r.isDiye)
                            Text(r.amountLabel,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight:
                                        FontWeight.w800,
                                    color: diyeC,
                                    fontFeatures: const [
                                      FontFeature
                                          .tabularFigures()
                                    ])),
                          if (!r.isDiye)
                            Text(r.amountLabel,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight:
                                        FontWeight.w800,
                                    color: liyeC,
                                    fontFeatures: const [
                                      FontFeature
                                          .tabularFigures()
                                    ])),
                        ],
                      ),
                    ],
                  ),
                  if (r.description.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(r.description,
                        style: TextStyle(
                            fontSize: 13, color: muted)),
                  ],
                  if (r.imagePaths.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 56,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: r.imagePaths.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(width: 8),
                        itemBuilder: (c, i) {
                          final f = File(r.imagePaths[i]);
                          return ClipRRect(
                            borderRadius:
                                BorderRadius.circular(8),
                            child: FutureBuilder<bool>(
                              future: f.exists(),
                              builder: (c, s) => (s.data ??
                                      false)
                                  ? Image.file(f,
                                      width: 56,
                                      height: 56,
                                      fit: BoxFit.cover)
                                  : Container(
                                      width: 56,
                                      height: 56,
                                      color: muted.withValues(
                                          alpha: 0.2),
                                      child: const Icon(
                                          Icons
                                              .broken_image_outlined,
                                          size: 24),
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            )),
      ],
    );
  }
}

class LedgerRowData {
  final String timeLabel;
  final String? balanceLabel;
  final String description;
  final String amountLabel;
  final bool isDiye;
  final List<String> imagePaths;
  LedgerRowData({
    required this.timeLabel,
    this.balanceLabel,
    this.description = '',
    required this.amountLabel,
    required this.isDiye,
    this.imagePaths = const [],
  });
}

// ---------------------------------------------------------------------------
// Calculator keypad (A8)
// ---------------------------------------------------------------------------

/// Evaluates simple arithmetic expressions: numbers with + - × ÷ (x, *).
/// Returns null on invalid input.
double? evaluateExpression(String expr) {
  var s = expr
      .replaceAll('×', '*')
      .replaceAll('x', '*')
      .replaceAll('÷', '/')
      .replaceAll('−', '-')
      .replaceAll(' ', '');
  if (s.isEmpty) return null;
  try {
    final tokens = <String>[];
    final buf = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      final ch = s[i];
      if ('0123456789.'.contains(ch)) {
        buf.write(ch);
      } else if ('+-*/'.contains(ch)) {
        // unary minus at start or after operator
        if (ch == '-' &&
            buf.isEmpty &&
            (tokens.isEmpty || '+-*/'.contains(tokens.last))) {
          buf.write(ch);
        } else {
          if (buf.isNotEmpty) {
            tokens.add(buf.toString());
            buf.clear();
          }
          tokens.add(ch);
        }
      } else {
        return null;
      }
    }
    if (buf.isNotEmpty) tokens.add(buf.toString());
    if (tokens.isEmpty) return null;
    // * and / first
    final out = <String>[];
    var i = 0;
    while (i < tokens.length) {
      final t = tokens[i];
      if ((t == '*' || t == '/') && out.isNotEmpty && i + 1 < tokens.length) {
        final a = double.tryParse(out.removeLast());
        final b = double.tryParse(tokens[i + 1]);
        if (a == null || b == null) return null;
        if (t == '/' && b == 0) return null;
        out.add((t == '*' ? a * b : a / b).toString());
        i += 2;
      } else {
        out.add(t);
        i++;
      }
    }
    // + and -
    var acc = double.tryParse(out[0]);
    if (acc == null) return null;
    i = 1;
    while (i < out.length) {
      final op = out[i];
      final b = double.tryParse(out[i + 1]);
      if (b == null) return null;
      acc = op == '+' ? acc! + b : acc! - b;
      i += 2;
    }
    return acc;
  } catch (_) {
    return null;
  }
}

/// Calculator-style numeric keypad driving a [TextEditingController].
///
/// Layout: C ÷ × ⌫ / 7 8 9 − / 4 5 6 + / 1 2 3 = / 0 00 . +/-
/// The controller holds the raw expression; call [parseAmountMinor]
/// semantics via [valueMinor].
class CalculatorKeypad extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onChanged;
  final Color? accentColor;
  const CalculatorKeypad(
      {super.key,
      required this.controller,
      this.onChanged,
      this.accentColor});

  void _press(String k) {
    final t = controller.text;
    switch (k) {
      case 'C':
        controller.text = '';
        break;
      case '⌫':
        if (t.isNotEmpty) {
          controller.text = t.substring(0, t.length - 1);
        }
        break;
      case '=':
        final v = evaluateExpression(t);
        if (v != null) {
          controller.text = _trimNum(v);
        }
        break;
      case '+/-':
        if (t.startsWith('-')) {
          controller.text = t.substring(1);
        } else if (t.isNotEmpty) {
          controller.text = '-$t';
        }
        break;
      default:
        // avoid duplicate operators
        if ('+-×÷'.contains(k) &&
            t.isNotEmpty &&
            '+-×÷'.contains(t[t.length - 1])) {
          controller.text = t.substring(0, t.length - 1) + k;
        } else {
          controller.text = t + k;
        }
    }
    onChanged?.call();
  }

  String _trimNum(double v) {
    if (v == v.roundToDouble()) return v.round().toString();
    return v.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final accent = accentColor ?? AppColors.diye;
    final rows = [
      ['C', '÷', '×', '⌫'],
      ['7', '8', '9', '−'],
      ['4', '5', '6', '+'],
      ['1', '2', '3', '='],
      ['0', '00', '.', '+/-'],
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: rows.map((row) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: row.map((k) {
              final isOp = 'C÷×⌫−+=.'.contains(k) && k != '.';
              final isEq = k == '=';
              return Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4),
                  child: SizedBox(
                    height: 56,
                    child: FilledButton(
                      onPressed: () => _press(k),
                      style: FilledButton.styleFrom(
                        backgroundColor: isEq
                            ? accent
                            : (dark
                                ? AppColors.cardDark
                                : const Color(0xFFEFF2F5)),
                        foregroundColor: isEq
                            ? Colors.white
                            : (dark
                                ? AppColors.inkDark
                                : AppColors.ink),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12)),
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      child: Text(k == '−' ? '−' : k),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}

/// Large amount display + calculator keypad for entry forms.
class AmountKeypadInput extends StatelessWidget {
  final TextEditingController controller;
  final String currencyPrefix;
  final Color? accentColor;
  final VoidCallback? onChanged;
  const AmountKeypadInput(
      {super.key,
      required this.controller,
      this.currencyPrefix = 'Rs ',
      this.accentColor,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: dark ? AppColors.cardDark : AppColors.card,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ValueListenableBuilder<TextEditingValue>(
            valueListenable: controller,
            builder: (c, v, _) {
              final txt =
                  v.text.isEmpty ? '0' : v.text;
              return Text('$currencyPrefix$txt',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: dark
                          ? AppColors.inkDark
                          : AppColors.ink,
                      fontFeatures: const [
                        FontFeature.tabularFigures()
                      ]));
            },
          ),
        ),
        const SizedBox(height: 12),
        CalculatorKeypad(
            controller: controller,
            onChanged: onChanged,
            accentColor: accentColor),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Custom date-range picker field (reusable, "Apni marzi")
// ---------------------------------------------------------------------------

/// Reusable from→to date range picker pill row.
class DateRangeField extends StatelessWidget {
  final int fromMs;
  final int toMs;
  final ValueChanged<(int, int)> onChanged;
  final String fromLabel;
  final String toLabel;
  const DateRangeField(
      {super.key,
      required this.fromMs,
      required this.toMs,
      required this.onChanged,
      required this.fromLabel,
      required this.toLabel});

  Future<void> _pick(
      BuildContext c, bool isFrom) async {
    final initial = DateTime.fromMillisecondsSinceEpoch(
        isFrom ? fromMs : toMs);
    final picked = await showDatePicker(
      context: c,
      initialDate: initial,
      firstDate: DateTime(2020),
      lastDate: DateTime.now()
          .add(const Duration(days: 365)),
    );
    if (picked == null) return;
    var from = DateTime.fromMillisecondsSinceEpoch(fromMs);
    var to = DateTime.fromMillisecondsSinceEpoch(toMs);
    if (isFrom) {
      from = DateTime(picked.year, picked.month, picked.day);
      if (from.isAfter(to)) to = from;
    } else {
      to = DateTime(
          picked.year, picked.month, picked.day, 23, 59, 59);
      if (to.isBefore(from)) from = DateTime(to.year, to.month, to.day);
    }
    onChanged((
      from.millisecondsSinceEpoch,
      to.millisecondsSinceEpoch
    ));
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    pill(String label, int ms, bool isFrom) =>
        InkWell(
          onTap: () => _pick(context, isFrom),
          borderRadius: BorderRadius.circular(24),
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: dark
                  ? AppColors.cardDark
                  : AppColors.card,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.calendar_today_outlined,
                    size: 16),
                const SizedBox(width: 6),
                Text('$label: ${fmtDate(context, ms)}',
                    style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
        );
    return Row(
      children: [
        pill(fromLabel, fromMs, true),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.arrow_forward, size: 16),
        ),
        pill(toLabel, toMs, false),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Bill image attachment (A9)
// ---------------------------------------------------------------------------

/// "Add bills" — bottom sheet (Camera / Gallery) + thumbnail row.
///
/// Copies picked images into the app documents directory and reports
/// the stored paths via [onChanged]. Team B persists them in
/// `transactions.imagePaths`.
class BillImagePicker extends StatefulWidget {
  final List<String> initialPaths;
  final ValueChanged<List<String>> onChanged;
  final String title;
  final String cameraLabel;
  final String galleryLabel;
  const BillImagePicker(
      {super.key,
      this.initialPaths = const [],
      required this.onChanged,
      required this.title,
      required this.cameraLabel,
      required this.galleryLabel});

  @override
  State<BillImagePicker> createState() => _BillImagePickerState();
}

class _BillImagePickerState extends State<BillImagePicker> {
  late List<String> _paths = List.of(widget.initialPaths);
  final _picker = ImagePicker();
  bool _busy = false;

  Future<void> _showSheet() async {
    final src = await showModalBottomSheet<ImageSource>(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(20))),
      builder: (c) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2))),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(widget.title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt,
                  color: AppColors.smsBlue, size: 28),
              title: Text(widget.cameraLabel),
              onTap: () =>
                  Navigator.pop(c, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.image,
                  color: AppColors.smsBlue, size: 28),
              title: Text(widget.galleryLabel),
              onTap: () =>
                  Navigator.pop(c, ImageSource.gallery),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
    if (src == null) return;
    setState(() => _busy = true);
    try {
      final x = await _picker.pickImage(
          source: src, imageQuality: 80, maxWidth: 1600);
      if (x == null) return;
      final dir = await getApplicationDocumentsDirectory();
      final bills =
          Directory('${dir.path}/bills');
      if (!await bills.exists()) {
        await bills.create(recursive: true);
      }
      final name =
          'bill_${DateTime.now().millisecondsSinceEpoch}_${_paths.length}.jpg';
      final saved =
          await File(x.path).copy('${bills.path}/$name');
      setState(() => _paths.add(saved.path));
      widget.onChanged(List.of(_paths));
    } catch (e) {
      if (mounted) {
        showSnack(context, e.toString(), error: true);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedButton.icon(
          onPressed: _busy ? null : _showSheet,
          icon: _busy
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child:
                      CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.camera_alt_outlined),
          label: Text(l.addBills),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24)),
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 12),
          ),
        ),
        if (_paths.isNotEmpty) ...[
          const SizedBox(height: 8),
          SizedBox(
            height: 72,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _paths.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(width: 8),
              itemBuilder: (c, i) => Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(File(_paths[i]),
                        width: 72,
                        height: 72,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            Container(
                                width: 72,
                                height: 72,
                                color: (dark
                                        ? AppColors.mutedDark
                                        : AppColors.muted)
                                    .withValues(alpha: 0.2),
                                child: const Icon(Icons
                                    .broken_image_outlined))),
                  ),
                  Positioned(
                    right: 2,
                    top: 2,
                    child: InkWell(
                      onTap: () {
                        setState(
                            () => _paths.removeAt(i));
                        widget
                            .onChanged(List.of(_paths));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle),
                        child: const Icon(Icons.close,
                            size: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// Sort options bottom sheet used by Khata + Sales lists.
Future<(String field, bool asc)?> showSortSheet(
  BuildContext context, {
  required String title,
  required List<(String value, String label)> fields,
  required String currentField,
  required bool currentAsc,
  required String ascLabel,
  required String descLabel,
}) async {
  var field = currentField;
  var asc = currentAsc;
  return showModalBottomSheet<(String, bool)>(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(20))),
    builder: (c) => StatefulBuilder(
      builder: (c, setS) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              ...fields.map((f) => RadioListTile<String>(
                    value: f.$1,
                    groupValue: field,
                    title: Text(f.$2),
                    onChanged: (v) =>
                        setS(() => field = v!),
                  )),
              const Divider(),
              SwitchListTile(
                title: Text(asc ? ascLabel : descLabel),
                value: asc,
                onChanged: (v) => setS(() => asc = v),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () =>
                      Navigator.pop(c, (field, asc)),
                  child: Text(
                      MaterialLocalizations.of(c)
                          .okButtonLabel),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

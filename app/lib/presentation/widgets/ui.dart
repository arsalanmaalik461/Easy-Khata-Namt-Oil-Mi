import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../app/theme.dart';

AppLocalizations L(BuildContext c) => AppLocalizations.of(c)!;

/// Format minor units as "Rs 1,234.50" respecting locale.
String fmtMoney(BuildContext c, int minor, {bool compact = false}) {
  final loc = Localizations.localeOf(c).languageCode;
  final f = NumberFormat.currency(
    locale: loc == 'ur' ? 'ur_PK' : 'en_PK',
    symbol: 'Rs ',
    decimalDigits: 2,
  );
  return f.format(minor / 100.0);
}

String fmtDate(BuildContext c, int ms) {
  final loc = Localizations.localeOf(c).languageCode;
  return DateFormat.yMMMd(loc == 'ur' ? 'ur_PK' : 'en_PK')
      .format(DateTime.fromMillisecondsSinceEpoch(ms));
}

String fmtDateTime(BuildContext c, int ms) {
  final loc = Localizations.localeOf(c).languageCode;
  return DateFormat.yMMMd(loc == 'ur' ? 'ur_PK' : 'en_PK')
      .add_jm()
      .format(DateTime.fromMillisecondsSinceEpoch(ms));
}

class MoneyText extends StatelessWidget {
  final int minor;
  final TextStyle? style;
  final bool colored;
  const MoneyText(this.minor,
      {super.key, this.style, this.colored = true});

  @override
  Widget build(BuildContext context) {
    final base = style ?? Theme.of(context).textTheme.titleMedium!;
    Color? color;
    if (colored) {
      color = minor < 0
          ? AppColors.danger
          : (minor > 0 ? AppColors.success : null);
    }
    return Text(fmtMoney(context, minor),
        style: base.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
            fontFeatures: const [FontFeature.tabularFigures()]));
  }
}

class EmptyState extends StatelessWidget {
  final String title;
  final String? hint;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;
  const EmptyState(
      {super.key,
      required this.title,
      this.hint,
      this.icon = Icons.inbox_outlined,
      this.actionLabel,
      this.onAction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 64, color: Theme.of(context).colorScheme.outline),
            const SizedBox(height: 16),
            Text(title,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center),
            if (hint != null) ...[
              const SizedBox(height: 8),
              Text(hint!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.textMuted),
                  textAlign: TextAlign.center),
            ],
            if (actionLabel != null) ...[
              const SizedBox(height: 16),
              FilledButton(onPressed: onAction, child: Text(actionLabel!)),
            ],
          ],
        ),
      ),
    );
  }
}

Future<bool> confirmDialog(BuildContext context,
    {required String title, required String body}) async {
  final l = L(context);
  final r = await showDialog<bool>(
    context: context,
    builder: (c) => AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(c, false), child: Text(l.cancel)),
        FilledButton(
            onPressed: () => Navigator.pop(c, true),
            style: FilledButton.styleFrom(
                backgroundColor: AppColors.danger),
            child: Text(l.confirm)),
      ],
    ),
  );
  return r ?? false;
}

void showSnack(BuildContext context, String msg, {bool error = false}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    backgroundColor:
        error ? AppColors.danger : Theme.of(context).colorScheme.inverseSurface,
  ));
}

/// Numeric amount input (major units, e.g. 1500.50). Returns minor units.
class AmountField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool autofocus;
  const AmountField(
      {super.key,
      required this.controller,
      required this.label,
      this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    final l = L(context);
    return TextFormField(
      controller: controller,
      autofocus: autofocus,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: label, prefixText: 'Rs '),
      validator: (v) {
        final d = double.tryParse((v ?? '').trim());
        if (d == null || d <= 0) return l.invalidAmount;
        return null;
      },
    );
  }
}

int parseAmountMinor(String s) => ((double.tryParse(s.trim()) ?? 0) * 100).round();

class SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? trailing;
  const SectionCard(
      {super.key, required this.title, required this.child, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w700))),
                if (trailing != null) trailing!,
              ],
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;
  const QuickAction(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.emerald;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: c.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: c, size: 28),
          ),
          const SizedBox(height: 6),
          Text(label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// Shared responsive helpers (Team C).
///
/// The defects these fix were seen on real phones: card labels splitting
/// mid-word ("Receivabl es"), amounts wrapping mid-number ("Rs 1,1 00.00"),
/// and filter chips / date pills overflowing on narrow screens.
///
/// Rules enforced here:
/// * Amounts NEVER wrap mid-number: single line, no soft wrap, and the text
///   shrinks (FittedBox scaleDown) instead of breaking when space is tight.
/// * Labels NEVER split mid-word: single line + scaleDown shrink instead of
///   wrapping, so a long label gets smaller rather than breaking apart.
/// * Tap targets stay readable: chips/pills use >= 40px-tall padding.

/// True when the screen is a narrow phone (where side-by-side header rows
/// and fixed-aspect grids start to overflow).
bool isNarrowScreen(BuildContext context) =>
    MediaQuery.sizeOf(context).width < 380;

/// Amount display that never wraps mid-number.
///
/// [text] is an already-formatted amount (see `fmtMoney`). It renders on one
/// line with tabular figures; when the available width is too small the text
/// scales down instead of wrapping or overflowing.
class AmountText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  const AmountText(
    this.text, {
    super.key,
    this.style,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final base = style ?? Theme.of(context).textTheme.titleMedium!;
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: textAlign == TextAlign.center
          ? Alignment.center
          : textAlign == TextAlign.right
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Text(
        text,
        maxLines: 1,
        softWrap: false,
        textAlign: textAlign,
        style: base.copyWith(
          fontFeatures: const [FontFeature.tabularFigures()],
        ),
      ),
    );
  }
}

/// Label that never splits mid-word: one line, shrinking to fit instead of
/// wrapping. Used for card labels, stat labels and action-button labels.
class NoSplitLabel extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  const NoSplitLabel(
    this.text, {
    super.key,
    this.style,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final base = style ?? Theme.of(context).textTheme.labelSmall!;
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: textAlign == TextAlign.center
          ? Alignment.center
          : textAlign == TextAlign.right
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Text(
        text,
        maxLines: 1,
        softWrap: false,
        textAlign: textAlign,
        style: base,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:namt_oil_mil/l10n/app_localizations.dart';
import 'package:namt_oil_mil/presentation/widgets/ek.dart';
import 'package:namt_oil_mil/presentation/widgets/responsive.dart';
import 'package:namt_oil_mil/presentation/widgets/ui.dart';

/// Team C responsive tests: long amounts / labels on narrow phone widths
/// must shrink, never wrap mid-number or split mid-word, and never
/// overflow (an overflow raises a FlutterError, which takeException picks
/// up and fails the test).
void main() {
  Widget wrap(Widget child, {double width = 320}) => MaterialApp(
    home: Scaffold(
      body: SizedBox(width: width, child: child),
    ),
  );

  testWidgets('AmountText shrinks a huge amount instead of wrapping', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrap(
        const AmountText(
          'Rs 1,100,000,000.00',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        ),
        width: 160,
      ),
    );
    expect(find.text('Rs 1,100,000,000.00'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('NoSplitLabel shrinks a long label instead of splitting', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrap(
        const NoSplitLabel(
          'RECEIVABLES',
          style: TextStyle(fontSize: 11, letterSpacing: 1.1),
        ),
        width: 120,
      ),
    );
    expect(find.text('RECEIVABLES'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('StatCard with long value fits a narrow card', (tester) async {
    await tester.pumpWidget(
      wrap(
        const StatCard(label: 'KULL SALES', value: 'Rs 1,100,000.00'),
        width: 160,
      ),
    );
    expect(find.text('Rs 1,100,000.00'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('HeroBalanceCard fits a narrow card', (tester) async {
    await tester.pumpWidget(
      wrap(
        const HeroBalanceCard(
          amount: 'Rs 1,100.00',
          label: 'LENE HAIN',
          isRed: true,
        ),
        width: 160,
      ),
    );
    expect(find.text('Rs 1,100.00'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('MoneyText never wraps mid-number', (tester) async {
    await tester.pumpWidget(wrap(const MoneyText(110000000), width: 120));
    expect(find.text('Rs 1,100,000.00'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('QuickAction with a long label fits a narrow cell', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrap(
        QuickAction(
          icon: Icons.person_add_outlined,
          label: 'Gahak Shamil Karein',
          onTap: () {},
        ),
        width: 80,
      ),
    );
    expect(find.text('Gahak Shamil Karein'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('DateRangeField pills fit a 320dp screen', (tester) async {
    await initializeDateFormatting('en_PK', null);
    final now = DateTime.now().millisecondsSinceEpoch;
    await tester.pumpWidget(
      wrap(
        DateRangeField(
          fromMs: now,
          toMs: now,
          fromLabel: 'From',
          toLabel: 'To',
          onChanged: (_) {},
        ),
        width: 320,
      ),
    );
    expect(find.byType(DateRangeField), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('databaseError localizes in Urdu', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ur'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (c) => Scaffold(
            body: Text(AppLocalizations.of(c).databaseError('boom')),
          ),
        ),
      ),
    );
    expect(find.textContaining('ڈیٹا بیس میں خرابی'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

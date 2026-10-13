import 'package:test/test.dart';
import 'package:namt_oil_mil/core/units.dart';

void main() {
  group('Qty rational arithmetic', () {
    test('reduces fractions', () {
      expect(Qty.of(4, 8), Qty.of(1, 2));
      expect(Qty.of(0, 5), Qty.zero);
    });

    test('parses decimals exactly', () {
      expect(Qty.parse('2.5'), Qty.of(5, 2));
      expect(Qty.parse('0.1') + Qty.parse('0.2'), Qty.parse('0.3'));
    });

    test('addition keeps exactness', () {
      final a = Qty.parse('10.25');
      final b = Qty.parse('3.75');
      expect(a + b, Qty.of(14, 1));
    });

    test('unit conversion is explicit rational', () {
      // 2 maund -> kg with factor 40/1
      final q = Qty.of(2).convert(40, 1);
      expect(q, Qty.of(80, 1));
      // 80 kg -> maund with factor 1/40
      expect(q.convert(1, 40), Qty.of(2, 1));
    });

    test('comparison', () {
      expect(Qty.of(1, 2) < Qty.of(3, 4), true);
      expect(Qty.of(2, 3) > Qty.of(1, 2), true);
    });

    test('display trims zeros', () {
      expect(Qty.of(5, 2).display(), '2.5');
      expect(Qty.of(3, 1).display(), '3');
      expect(Qty.parse('2.500').display(), '2.5');
    });
  });
}

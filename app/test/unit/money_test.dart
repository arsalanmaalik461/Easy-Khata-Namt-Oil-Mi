import 'package:test/test.dart';
import 'package:namt_oil_mil/core/money.dart';

void main() {
  group('Money', () {
    test('stores minor units exactly', () {
      expect(const Money(150050).minor, 150050);
      expect(Money.fromMajor(1500.50).minor, 150050);
    });

    test('addition and subtraction', () {
      expect((const Money(100) + const Money(250)).minor, 350);
      expect((const Money(100) - const Money(250)).minor, -150);
    });

    test('no floating point drift: 0.1 + 0.2', () {
      final a = Money.fromMajor(0.1);
      final b = Money.fromMajor(0.2);
      expect((a + b).minor, 30); // exactly 30 paisa
    });

    test('percent rounds to nearest paisa', () {
      expect(const Money(10000).percent(15).minor, 1500);
      expect(const Money(333).percent(10).minor, 33);
    });

    test('allocate splits without remainder loss', () {
      final parts = allocate(const Money(100), [1, 1, 1]);
      expect(parts.fold<int>(0, (a, m) => a + m.minor), 100);
      final parts2 = allocate(const Money(1000), [50, 30, 20]);
      expect(parts2[0].minor, 500);
      expect(parts2[1].minor, 300);
      expect(parts2[2].minor, 200);
      expect(parts2.fold<int>(0, (a, m) => a + m.minor), 1000);
    });

    test('comparison operators', () {
      expect(const Money(5) > const Money(3), true);
      expect(const Money(-1) < Money.zero, true);
      expect(const Money(7) >= const Money(7), true);
    });
  });
}

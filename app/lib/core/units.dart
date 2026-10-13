/// Exact rational quantity: qtyNum / qtyDen in a product's base unit.
/// Avoids floating-point errors in stock arithmetic.
class Qty {
  final int num;
  final int den;
  const Qty(this.num, this.den);

  factory Qty.of(int n, [int d = 1]) {
    assert(d != 0);
    if (d < 0) return Qty(-n, -d)._reduce();
    return Qty(n, d)._reduce();
  }

  factory Qty.parse(String s) {
    s = s.trim();
    if (s.contains('/')) {
      final p = s.split('/');
      return Qty.of(int.parse(p[0].trim()), int.parse(p[1].trim()));
    }
    if (s.contains('.')) {
      final neg = s.startsWith('-');
      final digits = s.replaceFirst('-', '');
      final parts = digits.split('.');
      final scale = BigInt.from(10).pow(parts[1].length).toInt();
      var n = int.parse(parts[0]) * scale + int.parse(parts[1]);
      if (neg) n = -n;
      return Qty.of(n, scale);
    }
    return Qty.of(int.parse(s));
  }

  static const zero = Qty(0, 1);

  Qty _reduce() {
    if (num == 0) return const Qty(0, 1);
    final g = num.abs().gcd(den.abs());
    return Qty(num ~/ g, den ~/ g);
  }

  Qty operator +(Qty o) => Qty.of(num * o.den + o.num * den, den * o.den);
  Qty operator -(Qty o) => Qty.of(num * o.den - o.num * den, den * o.den);
  Qty operator -() => Qty(-num, den);
  Qty operator *(Qty o) => Qty.of(num * o.num, den * o.den);
  Qty operator /(Qty o) => Qty.of(num * o.den, den * o.num);

  /// Multiply by rational factor num/den (unit conversion).
  Qty convert(int factorNum, int factorDen) =>
      Qty.of(num * factorNum, den * factorDen);

  double get asDouble => num / den;
  bool get isNegative => num < 0;
  bool get isZero => num == 0;
  bool get isPositive => num > 0;

  int compareTo(Qty o) => (num * o.den).compareTo(o.num * den);
  bool operator >(Qty o) => compareTo(o) > 0;
  bool operator <(Qty o) => compareTo(o) < 0;
  bool operator >=(Qty o) => compareTo(o) >= 0;
  bool operator <=(Qty o) => compareTo(o) <= 0;

  /// Display with up to [fractionDigits] decimals, trimming trailing zeros.
  String display([int fractionDigits = 3]) {
    var s = asDouble.toStringAsFixed(fractionDigits);
    if (s.contains('.')) {
      s = s.replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
    }
    return s;
  }

  @override
  bool operator ==(Object o) =>
      o is Qty && num * o.den == o.num * den;
  @override
  int get hashCode => (num / den).hashCode;
  @override
  String toString() => '$num/$den';
}

/// A unit conversion: fromUnit -> toUnit with rational factor.
/// qty_in_to = qty_in_from * factorNum / factorDen
class UnitConversion {
  final String fromUnitId;
  final String toUnitId;
  final int factorNum;
  final int factorDen;
  const UnitConversion(this.fromUnitId, this.toUnitId, this.factorNum, this.factorDen);
}

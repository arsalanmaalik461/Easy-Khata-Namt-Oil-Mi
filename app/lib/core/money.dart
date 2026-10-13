/// Money stored as integer minor units (paisa). 1 PKR = 100 paisa.
/// Never use double for financial arithmetic.
class Money implements Comparable<Money> {
  final int minor;
  const Money(this.minor);

  static const zero = Money(0);

  factory Money.fromMajor(num major) => Money((major * 100).round());

  double get asMajor => minor / 100.0;

  Money operator +(Money o) => Money(minor + o.minor);
  Money operator -(Money o) => Money(minor - o.minor);
  Money operator -() => Money(-minor);
  Money operator *(num factor) => Money((minor * factor).round());
  Money abs() => Money(minor.abs());
  bool get isNegative => minor < 0;
  bool get isZero => minor == 0;
  bool get isPositive => minor > 0;

  /// Integer percent: amount * percent / 100, rounded half away from zero.
  Money percent(int percent) => Money(((minor * percent) / 100).round());

  @override
  int compareTo(Money o) => minor.compareTo(o.minor);
  bool operator >(Money o) => minor > o.minor;
  bool operator <(Money o) => minor < o.minor;
  bool operator >=(Money o) => minor >= o.minor;
  bool operator <=(Money o) => minor <= o.minor;

  @override
  bool operator ==(Object o) => o is Money && o.minor == minor;
  @override
  int get hashCode => minor.hashCode;
  @override
  String toString() => 'Money($minor)';
}

/// Allocate [total] across [ratios] (integer weights) with no remainder loss.
/// The last share absorbs rounding remainder.
List<Money> allocate(Money total, List<int> ratios) {
  final sum = ratios.fold<int>(0, (a, b) => a + b);
  if (sum <= 0 || total.isZero) return List.filled(ratios.length, Money.zero);
  final out = <Money>[];
  var allocated = 0;
  for (var i = 0; i < ratios.length; i++) {
    if (i == ratios.length - 1) {
      out.add(Money(total.minor - allocated));
    } else {
      final share = (total.minor * ratios[i] / sum).round();
      out.add(Money(share));
      allocated += share;
    }
  }
  return out;
}

/// Plain-Dart test runner for Namt Oil Mil core logic.
/// Run with: dart --packages=.dart_tool/package_config.json test/run_all.dart
import 'dart:io';

import 'package:namt_oil_mil/core/money.dart';
import 'package:namt_oil_mil/core/units.dart';
import 'package:namt_oil_mil/domain/accounting.dart';

int _passed = 0;
int _failed = 0;
final List<String> _failures = [];

void check(bool condition, String name) {
  if (condition) {
    _passed++;
  } else {
    _failed++;
    _failures.add(name);
    print('FAIL: $name');
  }
}

void checkEq(dynamic actual, dynamic expected, String name) {
  if (actual == expected) {
    _passed++;
  } else {
    _failed++;
    _failures.add('$name (expected $expected, got $actual)');
    print('FAIL: $name (expected $expected, got $actual)');
  }
}

void main() {
  print('=== Money tests ===');
  checkEq(const Money(150050).minor, 150050, 'money stores minor');
  checkEq(Money.fromMajor(1500.50).minor, 150050, 'money fromMajor');
  checkEq((const Money(100) + const Money(250)).minor, 350, 'money add');
  checkEq((const Money(100) - const Money(250)).minor, -150, 'money sub');
  checkEq((Money.fromMajor(0.1) + Money.fromMajor(0.2)).minor, 30,
      'money 0.1+0.2 exact');
  checkEq(const Money(10000).percent(15).minor, 1500, 'money percent');
  final parts = allocate(const Money(100), [1, 1, 1]);
  checkEq(parts.fold<int>(0, (a, m) => a + m.minor), 100, 'allocate sum');
  check(const Money(5) > const Money(3), 'money gt');
  check(const Money(-1) < Money.zero, 'money lt');

  print('=== Qty tests ===');
  checkEq(Qty.of(4, 8), Qty.of(1, 2), 'qty reduce');
  checkEq(Qty.parse('2.5'), Qty.of(5, 2), 'qty parse');
  checkEq(Qty.parse('0.1') + Qty.parse('0.2'), Qty.parse('0.3'),
      'qty 0.1+0.2 exact');
  checkEq(Qty.of(2).convert(40, 1), Qty.of(80, 1), 'qty convert');
  check(Qty.of(1, 2) < Qty.of(3, 4), 'qty lt');
  checkEq(Qty.of(5, 2).display(), '2.5', 'qty display');

  print('=== Accounting tests ===');
  checkEq(
      Accounting.applyCreditSale(Money.zero, const Money(50000)).minor,
      50000,
      'credit sale increases receivable');
  checkEq(
      Accounting.applyCustomerPayment(
              const Money(50000), const Money(20000))
          .minor,
      30000,
      'payment decreases receivable');
  check(
      Accounting.applyCustomerAdvance(Money.zero, const Money(10000))
          .isNegative,
      'advance negative');
  checkEq(
      Accounting.applyCreditPurchase(Money.zero, const Money(80000)).minor,
      80000,
      'credit purchase increases payable');
  checkEq(
      Accounting.applySupplierPayment(
              const Money(80000), const Money(30000))
          .minor,
      50000,
      'supplier payment decreases payable');
  checkEq(
      Accounting.invoiceStatus(
          const Money(10000), Money.zero, Money.zero),
      InvoiceStatus.unpaid,
      'invoice unpaid');
  checkEq(
      Accounting.invoiceStatus(
          const Money(10000), const Money(10000), Money.zero),
      InvoiceStatus.paid,
      'invoice paid');
  final from = Accounting.applyTransferOut(
      const Money(50000), const Money(10000));
  final to = Accounting.applyTransferIn(
      const Money(20000), const Money(10000));
  checkEq((from + to).minor, 70000, 'transfer conserves');
  checkEq(
      Accounting.profitLoss(
        revenue: const Money(100000),
        costOfGoodsSold: const Money(60000),
        operatingExpenses: const Money(15000),
        otherIncome: const Money(5000),
      ).minor,
      30000,
      'profit calc');

  print('\n=== Results: $_passed passed, $_failed failed ===');
  if (_failures.isNotEmpty) {
    print('Failures:');
    for (final f in _failures) {
      print('  - $f');
    }
    exit(1);
  }
}

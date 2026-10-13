import 'package:test/test.dart';
import 'package:namt_oil_mil/core/money.dart';
import 'package:namt_oil_mil/domain/accounting.dart';

void main() {
  group('Accounting direction rules', () {
    test('credit sale increases customer receivable', () {
      expect(
          Accounting.applyCreditSale(Money.zero, const Money(50000)).minor,
          50000);
    });

    test('payment received decreases receivable', () {
      expect(
          Accounting.applyCustomerPayment(
              const Money(50000), const Money(20000))
              .minor,
          30000);
    });

    test('customer advance drives balance negative (we owe them)', () {
      final b = Accounting.applyCustomerAdvance(Money.zero, const Money(10000));
      expect(b.isNegative, true);
    });

    test('credit purchase increases payable', () {
      expect(
          Accounting.applyCreditPurchase(Money.zero, const Money(80000)).minor,
          80000);
    });

    test('supplier payment decreases payable', () {
      expect(
          Accounting.applySupplierPayment(
              const Money(80000), const Money(30000))
              .minor,
          50000);
    });

    test('sales return reduces receivable', () {
      expect(
          Accounting.applySalesReturn(
              const Money(50000), const Money(10000))
              .minor,
          40000);
    });

    test('invoice status transitions', () {
      expect(
          Accounting.invoiceStatus(
              const Money(10000), Money.zero, Money.zero),
          InvoiceStatus.unpaid);
      expect(
          Accounting.invoiceStatus(
              const Money(10000), const Money(4000), Money.zero),
          InvoiceStatus.partiallyPaid);
      expect(
          Accounting.invoiceStatus(
              const Money(10000), const Money(10000), Money.zero),
          InvoiceStatus.paid);
      expect(
          Accounting.invoiceStatus(
              const Money(10000), Money.zero, const Money(10000)),
          InvoiceStatus.returned);
      expect(
          Accounting.invoiceStatus(
              const Money(10000), const Money(3000), const Money(2000)),
          InvoiceStatus.partiallyReturned);
    });

    test('transfer is not income/expense: balances move, net zero', () {
      final from = Accounting.applyTransferOut(const Money(50000), const Money(10000));
      final to = Accounting.applyTransferIn(const Money(20000), const Money(10000));
      expect(from.minor, 40000);
      expect(to.minor, 30000);
      expect((from + to).minor, 70000); // conserved
    });

    test('profit & loss math', () {
      final p = Accounting.profitLoss(
        revenue: const Money(100000),
        costOfGoodsSold: const Money(60000),
        operatingExpenses: const Money(15000),
        otherIncome: const Money(5000),
      );
      expect(p.minor, 30000);
    });

    test('yield percent', () {
      expect(Accounting.yieldPercent(100, 18), closeTo(18.0, 0.001));
      expect(Accounting.yieldPercent(0, 10), isNull);
    });
  });
}

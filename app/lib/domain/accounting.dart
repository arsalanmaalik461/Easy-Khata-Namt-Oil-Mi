import '../core/money.dart';

/// CENTRAL ACCOUNTING RULES — the single source of truth for balance direction.
/// Do NOT duplicate these calculations in UI code.
///
/// Balance conventions (all in minor units, paisa):
/// - Customer balance > 0  => customer OWES us (receivable).
/// - Customer balance < 0  => we owe the customer (advance/credit).
/// - Supplier balance > 0  => WE OWE the supplier (payable).
/// - Supplier balance < 0  => supplier owes us (advance paid).
/// - Cash/bank balance: plain funds on hand.
class Accounting {
  /// Effect of a credit sale on the customer balance.
  static Money applyCreditSale(Money balance, Money total) => balance + total;

  /// Effect of receiving a payment from a customer.
  static Money applyCustomerPayment(Money balance, Money amount) =>
      balance - amount;

  /// Effect of a customer advance (paid before purchase): reduces what they owe.
  static Money applyCustomerAdvance(Money balance, Money amount) =>
      balance - amount;

  /// Effect of a credit purchase on the supplier balance.
  static Money applyCreditPurchase(Money balance, Money total) => balance + total;

  /// Effect of paying a supplier.
  static Money applySupplierPayment(Money balance, Money amount) =>
      balance - amount;

  /// Effect of a supplier advance (we paid before purchase).
  static Money applySupplierAdvance(Money balance, Money amount) =>
      balance - amount;

  /// Effect of a sales return (reduces receivable).
  static Money applySalesReturn(Money customerBalance, Money amount) =>
      customerBalance - amount;

  /// Effect of a purchase return (reduces payable).
  static Money applyPurchaseReturn(Money supplierBalance, Money amount) =>
      supplierBalance - amount;

  /// A sale's outstanding after a payment.
  static Money saleOutstanding(Money total, Money paid) => total - paid;

  /// Invoice status from totals.
  static InvoiceStatus invoiceStatus(Money total, Money paid, Money returned) {
    final net = total - returned;
    if (paid.isZero && returned.isZero) return InvoiceStatus.unpaid;
    if (returned >= total) return InvoiceStatus.returned;
    if (returned.isPositive) return InvoiceStatus.partiallyReturned;
    if (paid >= net) return InvoiceStatus.paid;
    if (paid.isPositive) return InvoiceStatus.partiallyPaid;
    return InvoiceStatus.unpaid;
  }

  /// Cash account effect of a transfer: neither income nor expense.
  static Money applyTransferOut(Money balance, Money amount) => balance - amount;
  static Money applyTransferIn(Money balance, Money amount) => balance + amount;

  /// Profit & loss: revenue - costOfGoodsSold - operatingExpenses + otherIncome.
  static Money profitLoss({
    required Money revenue,
    required Money costOfGoodsSold,
    required Money operatingExpenses,
    required Money otherIncome,
  }) =>
      revenue - costOfGoodsSold - operatingExpenses + otherIncome;

  /// Production yield % = outputQty / inputQty * 100 (same base unit).
  /// Returns null when input is zero.
  static double? yieldPercent(double inputQty, double outputQty) {
    if (inputQty <= 0) return null;
    return outputQty / inputQty * 100.0;
  }
}

enum InvoiceStatus {
  draft,
  unpaid,
  partiallyPaid,
  paid,
  partiallyReturned,
  returned,
  cancelled,
}

/// Transaction categories used across the app.
class TxnCategory {
  static const creditSale = 'credit_sale';
  static const cashSale = 'cash_sale';
  static const customerPayment = 'customer_payment';
  static const customerAdvance = 'customer_advance';
  static const creditPurchase = 'credit_purchase';
  static const cashPurchase = 'cash_purchase';
  static const supplierPayment = 'supplier_payment';
  static const supplierAdvance = 'supplier_advance';
  static const expense = 'expense';
  static const otherIncome = 'other_income';
  static const cashTransfer = 'cash_transfer';
  static const salesReturn = 'sales_return';
  static const purchaseReturn = 'purchase_return';
  static const production = 'production';
  static const adjustment = 'adjustment';
  static const openingBalance = 'opening_balance';
}

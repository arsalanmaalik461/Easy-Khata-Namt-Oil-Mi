import 'package:drift/drift.dart';

import '../core/money.dart';
import '../core/units.dart';
import '../domain/accounting.dart';
import 'db.dart';
import 'services.dart' show AccountingService;

int _startOfDay(DateTime d) =>
    DateTime(d.year, d.month, d.day).millisecondsSinceEpoch;
int _endOfDay(DateTime d) =>
    DateTime(d.year, d.month, d.day, 23, 59, 59, 999).millisecondsSinceEpoch;

/// Read-only aggregations over the authoritative tables.
class ReportService {
  final AppDatabase db;
  final AccountingService accounting;
  ReportService(this.db) : accounting = AccountingService(db);

  Future<DashboardSummary> dashboard([DateTime? day]) async {
    final d = day ?? DateTime.now();
    final s = _startOfDay(d), e = _endOfDay(d);
    final ms = DateTime(d.year, d.month, 1).millisecondsSinceEpoch;
    final me = _endOfDay(DateTime(d.year, d.month + 1, 0));

    final customers = await db.select(db.customers).get();
    final suppliers = await db.select(db.suppliers).get();
    final receivables = customers.fold<int>(0, (a, c) => a + (c.balance > 0 ? c.balance : 0));
    final payables = suppliers.fold<int>(0, (a, c) => a + (c.balance > 0 ? c.balance : 0));

    Future<int> sumSales(int from, int to) async {
      final q = db.selectOnly(db.salesInvoices)
        ..addColumns([db.salesInvoices.totalMinor.sum()])
        ..where(db.salesInvoices.date.isBetweenValues(from, to) &
            db.salesInvoices.status.isNotIn(['draft', 'cancelled']));
      final r = await q.getSingle();
      return r.read(db.salesInvoices.totalMinor.sum()) ?? 0;
    }

    Future<int> sumPurchases(int from, int to) async {
      final q = db.selectOnly(db.purchaseInvoices)
        ..addColumns([db.purchaseInvoices.totalMinor.sum()])
        ..where(db.purchaseInvoices.date.isBetweenValues(from, to) &
            db.purchaseInvoices.status.isNotIn(['draft', 'cancelled']));
      final r = await q.getSingle();
      return r.read(db.purchaseInvoices.totalMinor.sum()) ?? 0;
    }

    Future<int> sumPayments(String direction, int from, int to) async {
      final q = db.selectOnly(db.payments)
        ..addColumns([db.payments.amountMinor.sum()])
        ..where(db.payments.direction.equals(direction) &
            db.payments.date.isBetweenValues(from, to) &
            db.payments.status.equals('posted'));
      final r = await q.getSingle();
      return r.read(db.payments.amountMinor.sum()) ?? 0;
    }

    Future<int> sumExpenses(int from, int to) async {
      final q = db.selectOnly(db.expenses)
        ..addColumns([db.expenses.amountMinor.sum()])
        ..where(db.expenses.date.isBetweenValues(from, to));
      final r = await q.getSingle();
      return r.read(db.expenses.amountMinor.sum()) ?? 0;
    }

    Future<int> sumIncome(int from, int to) async {
      final q = db.selectOnly(db.incomeRecords)
        ..addColumns([db.incomeRecords.amountMinor.sum()])
        ..where(db.incomeRecords.date.isBetweenValues(from, to));
      final r = await q.getSingle();
      return r.read(db.incomeRecords.amountMinor.sum()) ?? 0;
    }

    final accounts = await db.select(db.cashAccounts).get();
    final cashBal = accounts
        .where((a) => a.type == 'cash')
        .fold<int>(0, (a, x) => a + x.balance);
    final bankBal = accounts
        .where((a) => a.type == 'bank')
        .fold<int>(0, (a, x) => a + x.balance);

    final outstandingSales = await (db.select(db.salesInvoices)
          ..where((t) => t.status.isIn(['unpaid', 'partially_paid'])))
        .get();
    final outstandingPurchases = await (db.select(db.purchaseInvoices)
          ..where((t) => t.status.isIn(['unpaid', 'partially_paid'])))
        .get();

    final recent = await (db.select(db.transactions)
          ..orderBy([(t) => OrderingTerm.desc(t.date)])
          ..limit(10))
        .get();

    // low stock
    final products = await (db.select(db.products)
          ..where((t) => t.active.equals(true)))
        .get();
    var lowStock = 0;
    for (final p in products) {
      final stock = await accounting.stockOf(p.id);
      if (stock <= Qty.of(p.reorderNum, p.reorderDen) &&
          Qty.of(p.reorderNum, p.reorderDen) > Qty.zero) {
        lowStock++;
      }
    }

    final batches = await (db.select(db.productionBatches)
          ..where((t) => t.date.isBetweenValues(s, e)))
        .get();

    return DashboardSummary(
      receivables: Money(receivables),
      payables: Money(payables),
      todaySales: Money(await sumSales(s, e)),
      todayPurchases: Money(await sumPurchases(s, e)),
      todayReceived: Money(await sumPayments('receive', s, e)),
      todayPaid: Money(await sumPayments('pay', s, e)),
      cashBalance: Money(cashBal),
      bankBalance: Money(bankBal),
      monthlyIncome: Money(await sumIncome(ms, me)),
      monthlyExpenses: Money(await sumExpenses(ms, me)),
      outstandingSaleInvoices: outstandingSales.length,
      outstandingPurchaseInvoices: outstandingPurchases.length,
      recentTransactions: recent,
      lowStockCount: lowStock,
      todayBatches: batches.length,
    );
  }

  /// Weighted-average inventory valuation per product.
  Future<List<ValuationRow>> inventoryValuation() async {
    final products =
        await (db.select(db.products)..where((t) => t.active.equals(true))).get();
    final out = <ValuationRow>[];
    for (final p in products) {
      final stock = await accounting.stockOf(p.id);
      if (stock.isZero) continue;
      // weighted avg from purchase/production_in movements
      final movs = await (db.select(db.inventoryMovements)
            ..where((t) => t.productId.equals(p.id)))
          .get();
      var costNum = 0; // total cost * qty in micro terms
      var qtyBase = Qty.zero;
      for (final m in movs) {
        final q = Qty.of(m.qtyNum, m.qtyDen);
        if (q.isPositive && m.unitCostMinor > 0) {
          // cost contribution = qty * unitCost
          costNum += (q.asDouble * m.unitCostMinor).round();
        }
        qtyBase = qtyBase + q;
      }
      final avgCost = qtyBase.asDouble <= 0
          ? 0
          : (costNum / qtyBase.asDouble).round();
      final value = (stock.asDouble * avgCost).round();
      out.add(ValuationRow(
          product: p,
          stock: stock,
          avgUnitCost: Money(avgCost),
          value: Money(value)));
    }
    return out;
  }

  Future<ProfitLoss> profitLoss(int from, int to) async {
    // Revenue = posted sales totals
    final salesQ = db.selectOnly(db.salesInvoices)
      ..addColumns([db.salesInvoices.totalMinor.sum()])
      ..where(db.salesInvoices.date.isBetweenValues(from, to) &
          db.salesInvoices.status.isNotIn(['draft', 'cancelled', 'returned']));
    final revenue =
        (await salesQ.getSingle()).read(db.salesInvoices.totalMinor.sum()) ?? 0;
    // COGS estimate = sum of (qty sold * avg cost) — simplified: use purchase price
    // For v1: COGS from sales invoice items joined with product purchase price.
    var cogs = 0;
    final items = await (db.select(db.salesInvoiceItems).join([
      innerJoin(db.salesInvoices,
          db.salesInvoices.id.equalsExp(db.salesInvoiceItems.invoiceId)),
      innerJoin(db.products,
          db.products.id.equalsExp(db.salesInvoiceItems.productId)),
    ])
          ..where(db.salesInvoices.date.isBetweenValues(from, to) &
              db.salesInvoices.status.isNotIn(['draft', 'cancelled'])))
        .get();
    for (final row in items) {
      final it = row.readTable(db.salesInvoiceItems);
      final prod = row.readTable(db.products);
      cogs += (Qty.of(it.qtyNum, it.qtyDen).asDouble * prod.purchasePrice).round();
    }
    final expQ = db.selectOnly(db.expenses)
      ..addColumns([db.expenses.amountMinor.sum()])
      ..where(db.expenses.date.isBetweenValues(from, to));
    final expenses =
        (await expQ.getSingle()).read(db.expenses.amountMinor.sum()) ?? 0;
    final incQ = db.selectOnly(db.incomeRecords)
      ..addColumns([db.incomeRecords.amountMinor.sum()])
      ..where(db.incomeRecords.date.isBetweenValues(from, to));
    final otherIncome =
        (await incQ.getSingle()).read(db.incomeRecords.amountMinor.sum()) ?? 0;
    final profit = Accounting.profitLoss(
      revenue: Money(revenue),
      costOfGoodsSold: Money(cogs),
      operatingExpenses: Money(expenses),
      otherIncome: Money(otherIncome),
    );
    return ProfitLoss(
      revenue: Money(revenue),
      costOfGoodsSold: Money(cogs),
      operatingExpenses: Money(expenses),
      otherIncome: Money(otherIncome),
      profit: profit,
      estimated: true,
    );
  }

  Future<List<LedgerEntry>> partyLedger(
      String accountKind, String accountId, int from, int to) async {
    return (db.select(db.ledgerEntries)
          ..where((t) =>
              t.accountKind.equals(accountKind) &
              t.accountId.equals(accountId) &
              t.date.isBetweenValues(from, to))
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .get();
  }

  /// Sales aggregation for the Sales dashboard (Team A).
  ///
  /// - [total]: sum of posted invoice totals in range
  /// - [orders]: count of posted invoices in range
  /// - [naqad]: cash received against those invoices (payments in range)
  /// - [udhaar]: outstanding (total - paid) on those invoices
  Future<SalesSummary> salesSummary(int from, int to) async {
    final invQ = db.selectOnly(db.salesInvoices)
      ..addColumns([
        db.salesInvoices.totalMinor.sum(),
        db.salesInvoices.paidMinor.sum(),
        db.salesInvoices.id.count()
      ])
      ..where(db.salesInvoices.date.isBetweenValues(from, to) &
          db.salesInvoices.status.isNotIn(['draft', 'cancelled']));
    final r = await invQ.getSingle();
    final total = r.read(db.salesInvoices.totalMinor.sum()) ?? 0;
    final paid = r.read(db.salesInvoices.paidMinor.sum()) ?? 0;
    final orders = r.read(db.salesInvoices.id.count()) ?? 0;
    // Recent invoices for the "recent sales" list.
    final recent = await (db.select(db.salesInvoices)
          ..where((t) => t.date.isBetweenValues(from, to))
          ..orderBy([(t) => OrderingTerm.desc(t.date)])
          ..limit(20))
        .get();
    return SalesSummary(
      total: Money(total),
      orders: orders,
      naqad: Money(paid),
      udhaar: Money(total - paid),
      recentInvoices: recent,
    );
  }

  /// Most recent transaction date (ms) for a party, 0 when none.
  Future<int> lastPartyTxnDate(String kind, String partyId) async {
    final q = db.selectOnly(db.ledgerEntries)
      ..addColumns([db.ledgerEntries.date.max()])
      ..where(db.ledgerEntries.accountKind.equals(kind) &
          db.ledgerEntries.accountId.equals(partyId));
    final r = await q.getSingle();
    return r.read(db.ledgerEntries.date.max()) ?? 0;
  }

  Future<List<ProductionYieldRow>> productionYields(int from, int to) async {
    final batches = await (db.select(db.productionBatches)
          ..where((t) => t.date.isBetweenValues(from, to))
          ..orderBy([(t) => OrderingTerm.desc(t.date)]))
        .get();
    final out = <ProductionYieldRow>[];
    for (final b in batches) {
      final ins = await (db.select(db.productionInputs)
            ..where((t) => t.batchId.equals(b.id)))
          .get();
      final outs = await (db.select(db.productionOutputs)
            ..where((t) => t.batchId.equals(b.id)))
          .get();
      // yield needs same base unit; compute per output vs total input in kg-equivalent
      // v1: sum quantities as doubles (base units) — document approximation
      final inQty = ins.fold<double>(
          0, (a, i) => a + Qty.of(i.qtyNum, i.qtyDen).asDouble);
      double outQty = 0;
      for (final o in outs) {
        final prod = await (db.select(db.products)
              ..where((t) => t.id.equals(o.productId)))
            .getSingleOrNull();
        if (prod?.category == 'finished_oil') {
          outQty += Qty.of(o.qtyNum, o.qtyDen).asDouble;
        }
      }
      out.add(ProductionYieldRow(
        batch: b,
        inputQty: inQty,
        oilQty: outQty,
        yieldPercent: Accounting.yieldPercent(inQty, outQty),
        totalCost: Money(
            b.labourCostMinor + b.electricityCostMinor + b.otherCostMinor),
      ));
    }
    return out;
  }
}

class DashboardSummary {
  final Money receivables, payables, todaySales, todayPurchases;
  final Money todayReceived, todayPaid, cashBalance, bankBalance;
  final Money monthlyIncome, monthlyExpenses;
  final int outstandingSaleInvoices, outstandingPurchaseInvoices;
  final List<Transaction> recentTransactions;
  final int lowStockCount, todayBatches;
  DashboardSummary({
    required this.receivables, required this.payables,
    required this.todaySales, required this.todayPurchases,
    required this.todayReceived, required this.todayPaid,
    required this.cashBalance, required this.bankBalance,
    required this.monthlyIncome, required this.monthlyExpenses,
    required this.outstandingSaleInvoices,
    required this.outstandingPurchaseInvoices,
    required this.recentTransactions,
    required this.lowStockCount, required this.todayBatches,
  });
}

class ValuationRow {
  final Product product;
  final Qty stock;
  final Money avgUnitCost;
  final Money value;
  ValuationRow(
      {required this.product, required this.stock,
       required this.avgUnitCost, required this.value});
}

class ProfitLoss {
  final Money revenue, costOfGoodsSold, operatingExpenses, otherIncome, profit;
  final bool estimated;
  ProfitLoss({required this.revenue, required this.costOfGoodsSold,
    required this.operatingExpenses, required this.otherIncome,
    required this.profit, required this.estimated});
}

class ProductionYieldRow {
  final ProductionBatche batch;
  final double inputQty, oilQty;
  final double? yieldPercent;
  final Money totalCost;
  ProductionYieldRow({required this.batch, required this.inputQty,
    required this.oilQty, required this.yieldPercent, required this.totalCost});
}

/// Aggregated sales figures for the Sales dashboard.
class SalesSummary {
  final Money total;
  final int orders;
  final Money naqad;
  final Money udhaar;
  final List<SalesInvoice> recentInvoices;
  SalesSummary({
    required this.total,
    required this.orders,
    required this.naqad,
    required this.udhaar,
    required this.recentInvoices,
  });
}

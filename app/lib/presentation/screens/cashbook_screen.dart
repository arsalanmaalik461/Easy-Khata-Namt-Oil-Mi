import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/money.dart';
import '../providers.dart';
import '../widgets/ui.dart';
import 'txn_form_screen.dart';

/// Cash & bank accounts: balances, history, transfers.
class CashbookScreen extends ConsumerWidget {
  const CashbookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L(context);
    final async = ref.watch(cashAccountsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.cashbook)),
      body: async.when(
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l.errorGeneric)),
        data: (accs) => ListView(
          padding: const EdgeInsets.all(12),
          children: [
            SectionCard(
              title: l.accounts,
              trailing: TextButton.icon(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            const TxnFormScreen(
                                mode: TxnMode.transfer))),
                icon: const Icon(Icons.swap_horiz),
                label: Text(l.transfer),
              ),
              child: Column(
                children: accs
                    .map((a) => ListTile(
                          dense: true,
                          leading: Icon(
                              a.type == 'cash'
                                  ? Icons.payments_outlined
                                  : Icons.account_balance_outlined),
                          title: Text(a.name),
                          subtitle: Text(a.type == 'cash'
                              ? l.typeCash
                              : l.typeBank),
                          trailing: MoneyText(a.balance),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      AccountHistoryScreen(
                                          accountId: a.id,
                                          name: a.name))),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => _addAccount(context, ref),
              icon: const Icon(Icons.add),
              label: Text(l.addAccount),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addAccount(
      BuildContext context, WidgetRef ref) async {
    final l = L(context);
    final nameC = TextEditingController();
    String type = 'cash';
    final ok = await showDialog<bool>(
      context: context,
      builder: (c) => StatefulBuilder(
        builder: (c, setS) => AlertDialog(
          title: Text(l.addAccount),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: nameC,
                  decoration: InputDecoration(
                      labelText: l.accountName)),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: type,
                decoration:
                    InputDecoration(labelText: l.accountType),
                items: [
                  DropdownMenuItem(
                      value: 'cash',
                      child: Text(l.typeCash)),
                  DropdownMenuItem(
                      value: 'bank',
                      child: Text(l.typeBank)),
                ],
                onChanged: (v) => setS(() => type = v!),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(c, false),
                child: Text(l.cancel)),
            FilledButton(
                onPressed: () => Navigator.pop(c, true),
                child: Text(l.add)),
          ],
        ),
      ),
    );
    if (ok == true && nameC.text.trim().isNotEmpty) {
      await ref
          .read(accountingProvider)
          .createCashAccount(name: nameC.text.trim(), type: type);
      refreshLists(ref);
    }
  }
}

class AccountHistoryScreen extends ConsumerWidget {
  final String accountId;
  final String name;
  const AccountHistoryScreen(
      {super.key, required this.accountId, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L(context);
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: FutureBuilder(
        future: (db.select(db.ledgerEntries)
              ..where((t) =>
                  t.accountKind.equals('cash') &
                  t.accountId.equals(accountId))
              ..orderBy([(t) => OrderingTerm.desc(t.date)])
              ..limit(200))
            .get(),
        builder: (c, snap) {
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final rows = snap.data!;
          if (rows.isEmpty) {
            return EmptyState(title: l.noTransactionsYet);
          }
          return ListView.builder(
            itemCount: rows.length,
            itemBuilder: (_, i) {
              final e = rows[i];
              final net = e.debitMinor - e.creditMinor;
              return ListTile(
                dense: true,
                title: Text(e.description.isEmpty
                    ? '—'
                    : e.description),
                subtitle: Text(fmtDate(context, e.date)),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MoneyText(net,
                        style:
                            const TextStyle(fontSize: 13)),
                    Text(fmtMoney(context, e.balanceAfterMinor),
                        style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey)),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

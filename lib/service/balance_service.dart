import '../model/balance.dart';
import '../model/expense.dart';

// Calculates how much each participant should receive or pay.
class BalanceService {
  List<Balance> calculateBalances(List<Expense> expenses) {
    // Store one balance for each participant and currency.
    final Map<String, Balance> balances = {};

    for (final expense in expenses) {
      final double share = expense.amount / expense.splitBetween.length;

      // Each person in the split owes an equal share.
      for (final participant in expense.splitBetween) {
        final balanceKey = '${participant.id}_${expense.currency.name}';

        if (!balances.containsKey(balanceKey)) {
          balances[balanceKey] = Balance(
            participant: participant,
            amount: 0,
            currency: expense.currency,
          );
        }

        balances[balanceKey]!.amount -= share;
      }

      // The person who paid should receive the full expense amount back.
      final payerKey = '${expense.paidBy.id}_${expense.currency.name}';

      if (!balances.containsKey(payerKey)) {
        balances[payerKey] = Balance(
          participant: expense.paidBy,
          amount: 0,
          currency: expense.currency,
        );
      }

      balances[payerKey]!.amount += expense.amount;
    }

    return balances.values.toList();
  }
}

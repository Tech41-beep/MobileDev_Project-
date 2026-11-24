import '../model/balance.dart';
import '../model/expense.dart';

// Keeps track of expenses while the app is running.
class ExpenseService {
  final List<Expense> _expenses = [];

  void addExpense(Expense expense) {
    // An expense ID should be unique, so do not add the same one twice.
    for (final currentExpense in _expenses) {
      if (currentExpense.id == expense.id) {
        throw ArgumentError('An expense with this ID already exists');
      }
    }

    _expenses.add(expense);
  }

  List<Expense> getAllExpenses() {
    // Return a copy so callers do not directly change the service's list.
    return List<Expense>.from(_expenses);
  }

  Expense? getExpenseById(String id) {
    for (final expense in _expenses) {
      if (expense.id == id) {
        return expense;
      }
    }

    // Return null when no expense has this ID.
    return null;
  }

  bool removeExpense(String id) {
    for (int i = 0; i < _expenses.length; i++) {
      if (_expenses[i].id == id) {
        _expenses.removeAt(i);
        return true;
      }
    }

    // Return false when there was nothing to remove.
    return false;
  }

  double getTotalAmount(Currency currency) {
    double total = 0;

    for (final expense in _expenses) {
      // Only add expenses that use the requested currency.
      if (expense.currency == currency) {
        total += expense.amount;
      }
    }

    return total;
  }
}

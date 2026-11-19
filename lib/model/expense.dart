import 'balance.dart';
import 'participant.dart';

// This class stores the information for one shared expense.
class Expense {
  final String id;
  String title;
  double amount;
  final Currency currency;
  final Participant paidBy;
  final List<Participant> splitBetween;
  DateTime date;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.currency,
    required this.paidBy,
    required this.splitBetween,
    required this.date,
  }) {
    if (id.trim().isEmpty) {
      throw ArgumentError('Expense ID cannot be empty');
    }
    if (title.trim().isEmpty) {
      throw ArgumentError('Expense title cannot be empty');
    }
    if (amount <= 0) {
      throw ArgumentError('Expense amount must be greater than zero');
    }
    if (splitBetween.isEmpty) {
      throw ArgumentError('At least one participant must share the expense');
    }
  }

  double get amountPerPerson => amount / splitBetween.length;

  void updateTitle(String newTitle) {
    if (newTitle.trim().isEmpty) {
      throw ArgumentError('Expense title cannot be empty');
    }

    title = newTitle;
  }

  void updateAmount(double newAmount) {
    if (newAmount <= 0) {
      throw ArgumentError('Expense amount must be greater than zero');
    }

    amount = newAmount;
  }
}

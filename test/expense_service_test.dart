import 'package:flutter_test/flutter_test.dart';

import '../lib/model/balance.dart';
import '../lib/model/expense.dart';
import '../lib/model/participant.dart';
import '../lib/service/expense_service.dart';

void main() {
  group('ExpenseService', () {
    late ExpenseService expenseService;
    late Participant alex;
    late Participant sam;

    // Create a new service and participants before every test.
    setUp(() {
      expenseService = ExpenseService();
      alex = Participant(id: 'person-1', name: 'Alex');
      sam = Participant(id: 'person-2', name: 'Sam');
    });

    test('starts with no expenses', () {
      expect(expenseService.getAllExpenses(), isEmpty);
      expect(expenseService.getTotalAmount(Currency.USD), 0);
      expect(expenseService.getExpenseById('missing-id'), isNull);
    });

    test('adds an expense and finds it by ID', () {
      final expense = Expense(
        id: 'expense-1',
        title: 'Lunch',
        amount: 20,
        currency: Currency.USD,
        paidBy: alex,
        splitBetween: [alex, sam],
        date: DateTime(2026, 1, 1),
      );

      expenseService.addExpense(expense);

      expect(expenseService.getAllExpenses(), hasLength(1));
      expect(expenseService.getExpenseById('expense-1'), same(expense));
    });

    test('does not allow two expenses with the same ID', () {
      final firstExpense = Expense(
        id: 'same-id',
        title: 'Lunch',
        amount: 20,
        currency: Currency.USD,
        paidBy: alex,
        splitBetween: [alex],
        date: DateTime(2026, 1, 1),
      );
      final secondExpense = Expense(
        id: 'same-id',
        title: 'Dinner',
        amount: 30,
        currency: Currency.USD,
        paidBy: sam,
        splitBetween: [sam],
        date: DateTime(2026, 1, 2),
      );

      expenseService.addExpense(firstExpense);

      expect(
        () => expenseService.addExpense(secondExpense),
        throwsArgumentError,
      );
      expect(expenseService.getAllExpenses(), hasLength(1));
    });

    test('removes an expense and reports whether it was found', () {
      final expense = Expense(
        id: 'expense-1',
        title: 'Lunch',
        amount: 20,
        currency: Currency.USD,
        paidBy: alex,
        splitBetween: [alex, sam],
        date: DateTime(2026, 1, 1),
      );
      expenseService.addExpense(expense);

      expect(expenseService.removeExpense('expense-1'), isTrue);
      expect(expenseService.getAllExpenses(), isEmpty);
      expect(expenseService.removeExpense('expense-1'), isFalse);
    });

    test('adds only expenses in the requested currency to the total', () {
      final usdExpense = Expense(
        id: 'usd-expense',
        title: 'Taxi',
        amount: 10,
        currency: Currency.USD,
        paidBy: alex,
        splitBetween: [alex, sam],
        date: DateTime(2026, 1, 1),
      );
      final khrExpense = Expense(
        id: 'khr-expense',
        title: 'Snack',
        amount: 4000,
        currency: Currency.KHR,
        paidBy: sam,
        splitBetween: [alex, sam],
        date: DateTime(2026, 1, 1),
      );

      expenseService.addExpense(usdExpense);
      expenseService.addExpense(khrExpense);

      expect(expenseService.getTotalAmount(Currency.USD), 10);
      expect(expenseService.getTotalAmount(Currency.KHR), 4000);
    });

    test('accepts the smallest positive amount and one participant', () {
      final expense = Expense(
        id: 'small-expense',
        title: 'Small item',
        amount: 0.01,
        currency: Currency.USD,
        paidBy: alex,
        splitBetween: [alex],
        date: DateTime(2026, 1, 1),
      );

      expenseService.addExpense(expense);

      expect(expenseService.getTotalAmount(Currency.USD), 0.01);
      expect(expenseService.getAllExpenses(), hasLength(1));
    });

    test('rejects an expense with an amount of zero', () {
      expect(
        () => Expense(
          id: 'invalid-expense',
          title: 'Invalid expense',
          amount: 0,
          currency: Currency.USD,
          paidBy: alex,
          splitBetween: [alex],
          date: DateTime(2026, 1, 1),
        ),
        throwsArgumentError,
      );
    });
  });
}

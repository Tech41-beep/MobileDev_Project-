import 'expense.dart';
import 'participant.dart';

// This class stores a trip and the people and expenses in that trip.
class Trip {
  final String id;
  String name;
  String? destination;
  DateTime startDate;
  DateTime? endDate;
  final List<Participant> participants;
  final List<Expense> expenses;

  Trip({
    required this.id,
    required this.name,
    this.destination,
    required this.startDate,
    this.endDate,
    List<Participant>? participants,
    List<Expense>? expenses,
  })  : participants = participants ?? [],
        expenses = expenses ?? [] {
    if (id.trim().isEmpty) {
      throw ArgumentError('Trip ID cannot be empty');
    }
    if (name.trim().isEmpty) {
      throw ArgumentError('Trip name cannot be empty');
    }
    if (endDate != null && endDate!.isBefore(startDate)) {
      throw ArgumentError('Trip end date cannot be before its start date');
    }
  }

  void updateName(String newName) {
    if (newName.trim().isEmpty) {
      throw ArgumentError('Trip name cannot be empty');
    }

    name = newName;
  }

  void addParticipant(Participant participant) {
    // Do not add the same participant twice.
    for (final currentParticipant in participants) {
      if (currentParticipant.id == participant.id) {
        return;
      }
    }

    participants.add(participant);
  }

  void addExpense(Expense expense) {
    expenses.add(expense);
  }
}

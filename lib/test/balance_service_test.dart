
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_project/model/balance.dart';
import 'package:mobile_project/model/expense.dart';
import 'package:mobile_project/model/participant.dart';
import 'package:mobile_project/service/balance_service.dart';

 void main(){
  group('Balance', (){
    late BalanceService balanceService;
    late Participant alex;
    late Participant sam;
    setUp((){
      balanceService = BalanceService();
      alex= Participant(id: 'person-1', name: 'Alex');
       sam= Participant(id: 'person-2', name: 'Sam');
    });

    test('Return no balance when there are no expense',(){
      final balanceService= BalanceService();
      final balances= balanceService.calculateBalances([]);
      expect(balances, isEmpty);
  },
  );

  test('Split an expend equally and show who should recieve or pay', (){
    final balanceService = BalanceService();
    final expense = Expense(
      id: 'expense-1', 
      title: 'lunch',
       amount: 30, 
       currency: Currency.USD, 
       paidBy: alex, 
       splitBetween: [alex,sam],
        date:DateTime(2026,11,20),
        );
   
   final balances = balanceService.calculateBalances([expense]);
  final Map<String, Balance> balanceByParticipantId = {
  for (final balance in balances) balance.participant.id: balance,
};
 expect(balanceByParticipantId[alex.id]!.amount, 15);
  expect(balanceByParticipantId[alex.id]!.shouldReceive, true);
   expect(balanceByParticipantId[sam.id]!.amount, -15);
     expect(balanceByParticipantId[sam.id]!.shouldReceive, false);
 },);
   test('settle the participant who is the only person sharing their expenses', () { 
    final expense = Expense(
      id: 'expenses-1', 
      title: 'coffee', 
      amount: 5, 
      currency: Currency.USD, 
      paidBy: alex, 
      splitBetween: [alex],
       date:DateTime(2026,11,1)
    );
    final balances = balanceService.calculateBalances([expense]);
     expect(balances, hasLength(1));
      expect(balances.single.amount, 0);
       expect(balances.single.isSettled, true);
   });
    },
  );
  
  }

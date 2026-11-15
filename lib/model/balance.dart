import '../model/participant.dart';
enum Currency{
  USD,
  KHR
}
class Balance{ 
  final Participant participant;
  double amount;
  final Currency currency;

 Balance({required this.participant, required this.amount, required this.currency}){ 

 }
 bool get shouldReceive => amount > 0;
 bool get owesMoney => amount < 0;
 bool get isSettled => amount == 0;

void updateAmount(double newAmount){

  amount = newAmount;
}

}
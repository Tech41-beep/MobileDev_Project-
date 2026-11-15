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
  if(amount < 0){
    throw ArgumentError('Amount cannot be negative');
  }
 }

}
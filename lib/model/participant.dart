

class Participant{
  final String id;
   String name;
   String? email;
   String? phone;
 
 Participant({required this.id, required this.name, this.email, this.phone})
 {
 if(id.trim().isEmpty){
    throw ArgumentError('ID cannot be empty');
  }
  if(name.trim().isEmpty){
    throw ArgumentError('Name cannot be empty');
  }
 }

 void updateName(String newName){
  if(newName.trim().isEmpty){
    throw ArgumentError('Name cannot be empty');
  }
    name = newName;
 }


  void updateEmail(String newEmail) {
    if(newEmail.trim().isEmpty || !newEmail.contains('@')) {
      throw ArgumentError('Invalid email address');
    }
    email = newEmail;
  }

  void updatePhone(String newPhone) {
     if(newPhone.trim().isEmpty || !RegExp(r'^\+?[0-9]{7,15}$').hasMatch(newPhone)) {
      throw ArgumentError('Invalid phone number');
     }
    phone = newPhone;
  }
}
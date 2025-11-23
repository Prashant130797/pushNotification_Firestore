import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  final String name;
  String address;
  int age;
  String email;
  Usermodel({
    required this.address,
    required this.age,
    required this.email,
    required this.name,
  });
  factory Usermodel.fromsnapShot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final documentMain = document.data()!;
    return Usermodel(
      address: documentMain["Address"],
      age: documentMain["Age"],
      email: documentMain["Email"],
      name: documentMain["Name"],
    );
  }

  tojson() {
    return {"Name": name, "Address": address, "Age": age, "Email": email};
  }
}

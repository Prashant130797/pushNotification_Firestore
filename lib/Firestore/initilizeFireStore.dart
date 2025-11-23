import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:push_main_notification/Firestore/UserModel.dart';

class FirestoreService {
  FirestoreService._init();
  static final FirestoreService _instance = FirestoreService._init();
  factory FirestoreService ()=> _instance; 
  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUser(Usermodel usrModel) async {
    await users.add(
      usrModel.tojson()
    ).whenComplete(() {
      print("data added successfully");
    },).catchError((error) {
      print("the error is ${error.toString()}");
    },);
  }

  Stream<QuerySnapshot> getUsers() {
    return users.orderBy('createdAt', descending: true).snapshots();
  }

  Future<void> updateUser(String id, String name, int age) async {
    await users.doc(id).update({
      'name': name,
      'age': age,
    });
  }

  Future<void> deleteUser(String id) async {
    await users.doc(id).delete();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:push_main_notification/Firestore/UserModel.dart';

class FirestoreService {
  FirestoreService._init();
  static final FirestoreService _instance = FirestoreService._init();
  factory FirestoreService() => _instance;
  final CollectionReference users = FirebaseFirestore.instance.collection(
    'Users',
  );

  Future<void> addUser(Usermodel usrModel) async {
    await users
        .add(usrModel.tojson())
        .whenComplete(() {
          print("data added successfully");
        })
        .catchError((error) {
          print("the error is ${error.toString()}");
        });
  }

  Stream<QuerySnapshot> getUsers() {
    return users.orderBy('createdAt', descending: true).snapshots();
  }

  Future<void> updateUser(String id, String name, int age) async {
    await users.doc(id).update({'name': name, 'age': age});
  }

  Future<void> updateUserByName(
    String username,
    Map<String, dynamic> updatedData,
  ) async {
    final querySnapshot = await users.where("name", isEqualTo: username).get();

    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        await doc.reference.update(updatedData);
      }
      print("User updated successfully.");
    } else {
      print("User not found!");
    }
  }

  Future<void> updateUserByNameSingleVlaue(
    String username,
    dynamic key,
    dynamic value,
  ) async {
    final querySnapshot =
        await users.where("Name", isEqualTo: username).limit(1).get();

    if (querySnapshot.docs.isNotEmpty) {
      var updatevalue = querySnapshot.docs.first.reference;
      await updatevalue.update({key: value});
      print("User updated successfully.");
    } else {
      print("User not found!");
    }
  }

  Future<void> deleteUser(String id) async {
    await users.doc(id).delete();
  }

    Future<void> deleteUserByNameSingleVlaue(
    String username,
    dynamic key,
    dynamic value,
  ) async {
    final querySnapshot =
        await users.where("Name", isEqualTo: username).limit(1).get();

    if (querySnapshot.docs.isNotEmpty) {
      var updatevalue = querySnapshot.docs.first.reference;
      await updatevalue.delete();
      print("User deleted successfully.");
    } else {
      print("User not found!");
    }
  }

  Future<void> validationForm(String name, int age) async {
    var getName = await users.where("Name", isEqualTo: name).get();
    var getAge = await users.where("Age", isEqualTo: age).get();
    if (getAge.docs.isEmpty || getName.docs.isEmpty) {
      print("InvalidData");
    } else {
      print("Valid Data");
    }
  }
}

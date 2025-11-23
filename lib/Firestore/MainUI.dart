import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:push_main_notification/Firestore/UserModel.dart';
import 'package:push_main_notification/Firestore/initilizeFireStore.dart';

class ShowUI extends StatelessWidget {
  const ShowUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.red,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("Users").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  var docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final user = Usermodel.fromsnapShot(docs[index]);
                      return ListTile(
                        title: Text(user.name),
                        subtitle: Text("Age: ${user.age}"),
                        trailing: GestureDetector(
                          onTap: () {
                            FirestoreService().validationForm(user.name, 45);
                          },
                          child: Icon(Icons.price_change),
                        ),
                        leading: GestureDetector(
                          onTap: () {
                            FirestoreService().updateUserByNameSingleVlaue(
                              "${user.name}",
                              "Age",
                              69,
                            );
                          },
                          child: Icon(Icons.update),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

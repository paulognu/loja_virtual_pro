import 'package:cloud_firestore/cloud_firestore.dart';

class UserApp {
  UserApp({
    this.uid = "",
    this.email = "",
    this.password = "",
    this.name = "",
    this.confirmPassword = "",
  });

  String uid;
  String email;
  String password;
  String name;

  String confirmPassword;

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.collection('/users').doc(uid);

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
    };
  }
}

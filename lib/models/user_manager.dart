import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/models/user_app.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sigIn(UserApp user) async {
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      debugPrint(result.user?.uid);
    } on FirebaseAuthException catch (e) {}
  }
}

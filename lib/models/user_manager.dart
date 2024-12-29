import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/helpers/firebase_errors.dart';
import 'package:loja_virtual_pro/models/user_app.dart';

class UserManager extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firesotre = FirebaseFirestore.instance;

  UserApp? user;

  bool _loading = false;
  bool get isLoading => _loading;

  UserManager() {
    _loadCurrentUser();
  }

  Future<void> sigIn(UserApp user,
      {required Function(String) onFail, required Function onSuccess}) async {
    _setLoading(true);
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      this.user = UserApp(
        uid: result.user!.uid,
        name: user.name,
        email: user.email,
      );

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }

    _setLoading(false);
  }

  Future<void> signUp({
    required UserApp userApp,
    required Function onFail,
    required Function onSuccess,
  }) async {
    _setLoading(true);

    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: userApp.email, password: userApp.password);
      DocumentSnapshot ds =
          await firesotre.collection('/users').doc(result.user!.uid).get();
      user = UserApp(
        uid: result.user!.uid,
        name: userApp.name,
        email: userApp.email,
      );

      await user!.saveData();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      // TODO: Retirar código de debug
      debugPrint("[DEBUG]Erro firebase: ${e.code}");
      onFail(getErrorString(e.code));
    }

    _setLoading(false);
  }

  void _setLoading(bool value) {
    if (_loading != value) {
      _loading = value;
      notifyListeners();
    }
  }

  Future<void> _loadCurrentUser() async {
    // user = auth.currentUser;
    // DocumentSnapshot ds =
    //     await firesotre.collection('/users').doc(auth.currentUser!.uid).get();
    // user = UserApp(
    //   uid: auth.currentUser!.uid,
    //   name: ds['name'],
    //   email: ds['email'],
    // );
  }
}

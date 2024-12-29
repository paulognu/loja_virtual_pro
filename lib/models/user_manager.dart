import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/helpers/firebase_errors.dart';
import 'package:loja_virtual_pro/models/user_app.dart';

class UserManager extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user;

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

      this.user = result.user;

      onSuccess();
    } on FirebaseAuthException catch (e) {
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

  void _loadCurrentUser() {
    user = auth.currentUser;
    // TODO: RETIRAR MENSAGEM DE DEBUG
    debugPrint("User ID: ${user?.uid}");
  }
}

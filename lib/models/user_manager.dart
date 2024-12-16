import 'package:firebase_auth/firebase_auth.dart';
import 'package:loja_virtual_pro/helpers/firebase_errors.dart';
import 'package:loja_virtual_pro/models/user_app.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sigIn(UserApp user,
      {required Function(String) onFail, required Function onSuccess}) async {
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
  }
}

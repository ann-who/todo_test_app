import 'package:firebase_auth/firebase_auth.dart';

import 'package:todo_test_app/data_layer/data_source/authentification_data_source.dart';

class FirebaseAuthentificationDataSource implements AuthentificationDataSource {
  final auth = FirebaseAuth.instance;

  @override
  Future<void> createOrSignIn(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        throw e;
      }
    }
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }
}

import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository {
  LoginRepository({required this.firebase});
  final FirebaseAuth firebase;

  Future<void> signIn({
    required String email,
    required String password
  }) async {
    try {
      await firebase.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'Такой пользователь не зарегистрирован!';
      } else if (e.code == 'wrong-password') {
        throw 'Неправильный пароль!';
      }
    }
  }

  Future<void> signUp({
    required String email,
    required String password
  }) async {
    try {
      await firebase.createUserWithEmailAndPassword(email: email, password: password);
      throw 'Новый пользователь зарегистрирован!';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw 'Такой e-mail уже зарегистрирован!';
      } else if (e.code == 'weak-password') {
        throw 'Пароль должен быть не менее 6 символов!';
      }
    }
  }

  Future<void> signOut() async {
    await firebase.signOut();
  }
}
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> getUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  Future<bool> registerUser(String email, String password) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      if (result.user != null) return true;

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
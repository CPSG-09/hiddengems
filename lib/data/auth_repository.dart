import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  // static resetPassword() {
  //   FirebaseAuth.instance.sendPasswordResetEmail(email: email)
  // }

  static bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  static Future<UserCredential> login(String email, String password) {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<UserCredential> signUp(String email, String password) async {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  static String? getEmail() {
    return FirebaseAuth.instance.currentUser!.email;
  }

  static String getUID() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  static Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}

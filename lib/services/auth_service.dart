import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import '../interfaces/user.dart';

class AuthService {
  Stream<User?> currentUser() {
    return FirebaseAuth.instance.authStateChanges().map((fbUser) =>
        fbUser != null ? User(username: fbUser.displayName ?? 'User') : null);
  }

  Future<User?> logInWithEmailAndPassword(String email, String password) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credential.user != null) {
      return User(username: credential.user!.displayName ?? 'User');
    } else {
      return null;
    }
  }

  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
    String username,
  ) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    /// createUserWithEmailAndPassword does not set the username
    await FirebaseAuth.instance.currentUser!.updateDisplayName(username);

    if (credential.user != null) {
      return User(username: credential.user!.displayName ?? 'User');
    } else {
      return null;
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}

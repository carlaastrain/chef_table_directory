import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, GoogleAuthProvider, UserCredential;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../interfaces/user.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  late ValueStream<User?> currentUser;

  AuthService() {
    currentUser = FirebaseAuth.instance
        .authStateChanges()
        .map((user) => user != null
            ? User(
                username: user.displayName ?? 'User',
                id: user.uid,
              )
            : null)
        .shareValueSeeded(null);
  }

  Future<User?> logInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    if (googleSignInAccount != null) {
      final googleAuth = await googleSignInAccount.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return User(
        username: authResult.user!.displayName ?? 'User',
        id: authResult.user!.uid,
      );
    } else {
      return null;
    }
  }

  Future<User?> logInWithApple() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    print(credential);
    return null;
  }

  Future<User?> logInWithEmailAndPassword(String email, String password) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credential.user != null) {
      return User(
        username: credential.user!.displayName ?? 'User',
        id: credential.user!.uid,
      );
    } else {
      return null;
    }
  }

  Future<User?> signUpWithUsernameAndEmailAndPassword(
    String username,
    String email,
    String password,
  ) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    /// createUserWithEmailAndPassword does not set the username
    await FirebaseAuth.instance.currentUser!.updateDisplayName(username);

    if (credential.user != null) {
      return User(
        username: credential.user!.displayName ?? 'User',
        id: credential.user!.uid,
      );
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




//static you cannot hold any state in an static method. 
//STATIC MEMBERS are defined on the class itself and INSTANCES MEMBERS are called on an instance of the class.
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meal_stock/models/user.dart';

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  String? error;

  User? _userFromFirebaseUser(auth.User? user) {
    return user != null
        ? User(
            uid: user.uid,
            email: user.email,
          )
        : null;
  }

  Stream<User?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in with email and password
  Future<User?> signIn(String email, String password) async {
    try {
      final auth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      auth.User? user = result.user;
      error = null;
      return _userFromFirebaseUser(user)!;
    } catch (e) {
      error = "Bad email or password.";
      return _userFromFirebaseUser(null);
    }
  }

  // register with email and password
  Future<User?> signUp(String email, String password) async {
    try {
      final auth.UserCredential result =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      auth.User? user = result.user;
      error = null;
      return _userFromFirebaseUser(user)!;
    } catch (e) {
      // print(e.toString());
      error = "Email is already in use.";
      return _userFromFirebaseUser(null);
    }
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = auth.GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final auth.UserCredential result =
        await _auth.signInWithCredential(credential);

    return _userFromFirebaseUser(result.user)!;
  }

  // sign out
  Future<void> signOut() async {
    try {
      error = null;
      return await _auth.signOut();
    } catch (e) {
      //print(e.toString());
      error = "Error signing out.";
      return Future(() => null);
    }
  }

  // change password
  Future<String> changePassword(
      String currentPassword, String newPassword) async {
    String errorMessage = "Heslo bylo úspěšně změněno";
    final auth.User? user = auth.FirebaseAuth.instance.currentUser;
    if (user == null) {
      // No user is signed in.
      return "No user is signed in.";
    }
    final cred = auth.EmailAuthProvider.credential(
        email: user.email!, password: currentPassword);

    await user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        errorMessage = "Heslo bylo úspěšně změněno";
      }).catchError((error) {
        errorMessage = "Heslo se nepodařilo změnit. (chyba: $error))";
        return Future(() => null);
      });
    }).catchError((error) {
      //print("Failed to reauthenticate.");
      errorMessage = "Nesprávné staré heslo.";
      return Future(() => null);
    });
    return errorMessage;
  }
}

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  // ✅ Singleton pattern to avoid multiple instances
  FirebaseAuthHelper._privateConstructor();
  static final FirebaseAuthHelper instance =
      FirebaseAuthHelper._privateConstructor();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ✅ Create Account
  Future<String> createAccount(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Account Created Successfully';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'An error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  // ✅ Login User
  Future<String> loginAccount(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'Logged in Successfully';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'An error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  // ✅ Logout User
  Future<String> logout() async {
    try {
      await _auth.signOut();
      return 'Logged out Successfully';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'An error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  // ✅ Check if User is Logged In
  Future<bool> isCurrentUser() async {
    return _auth.currentUser != null;
  }
}

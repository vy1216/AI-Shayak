
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  Future<User?> signUp(String email, String password) async {
    final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Stream<User?> get user => _auth.authStateChanges();
}

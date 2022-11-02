import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get onAuthStateChanged => _firebaseAuth.authStateChanges();

  Future<User> handleSignInEmail(String email, String password) async {
    UserCredential result =
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user!;

    return user;
  }

  Future<User> handleSignUp(email, password) async {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    final User user = result.user!;

    return user;
  }

  Future<String?> getCurrentUID() async {
    return _firebaseAuth.currentUser?.uid;
  }
}
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      throw Exception("Signup failed: $e");
    }
  }

 Future<User?> logIn(String email, String password) async {
  try {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  } on FirebaseAuthException catch (e) {
    // You can handle specific errors here like 'user-not-found'
    throw Exception("Login failed: ${e.message}");
  }
}
}


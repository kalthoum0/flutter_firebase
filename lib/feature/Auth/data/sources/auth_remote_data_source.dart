import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUp(String name, String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
      await credential.user?.reload();

      if (credential.user != null) {
        await _firestore.collection('users').doc(credential.user!.uid).set({
          'uid': credential.user!.uid,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
          'role': 'employee',
        });
      }

      return _firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      throw Exception('Sign up failed [${e.code}]: ${e.message}');
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
      throw Exception('Login failed [${e.code}]: ${e.message}');
    }
  }

  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore  _firestore = FirebaseFirestore.instance;

  Future<User?> signUp(String email, String password) async {
    UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // 2. Save the user profile in Firestore
    if (credential.user != null) {
      await _firestore.collection('users').doc(credential.user!.uid).set({
        'uid': credential.user!.uid,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
        'role': 'employee', // Default role for your system
      });
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


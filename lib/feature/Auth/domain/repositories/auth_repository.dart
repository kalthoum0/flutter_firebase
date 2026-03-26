import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> signUpUser(String name, String email, String password);
  Future<User?> logInUser(String email, String password);
  
  User? getCurrentUser();   
  Future<void> logOut();
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:second_attempt/feature/Auth/data/sources/auth_remote_data_source.dart';
import 'package:second_attempt/feature/Auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override

  Future<User?> signUpUser(String name, String email, String password) async {
    return await remoteDataSource.signUp(name, email, password);
  }

  @override
  Future<User?> logInUser(String email, String password) async {
    return await remoteDataSource.logIn(email, password);
  }

  @override
  User? getCurrentUser() {
    return remoteDataSource.currentUser;
  }

  @override
  Future<void> logOut() async {
    await remoteDataSource.logOut();
  }
}
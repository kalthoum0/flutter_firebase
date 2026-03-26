import 'package:firebase_auth/firebase_auth.dart';
import 'package:second_attempt/feature/Auth/data/sources/auth_remote_data_source.dart';
import 'package:second_attempt/feature/Auth/domain/repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<User?> call(String name, String email, String password) async{
    return await repository.signUpUser(name, email, password);
  }
}
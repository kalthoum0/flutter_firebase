import 'package:second_attempt/feature/login/data/sources/auth_remote_data_source.dart';
import 'package:second_attempt/feature/login/domain/repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<void> call(String email, String password) {
    return repository.signUpUser(email, password);
  }
}
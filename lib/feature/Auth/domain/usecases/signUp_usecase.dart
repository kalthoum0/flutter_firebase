import 'package:second_attempt/feature/Auth/data/sources/auth_remote_data_source.dart';
import 'package:second_attempt/feature/Auth/domain/repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<void> call(String email, String password) {
    return repository.signUpUser(email, password);
  }
}
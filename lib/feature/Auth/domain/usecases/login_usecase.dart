import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  // We require an AuthRepository to be passed in. 
  // This is 'Dependency Injection' in action.
  LoginUseCase(this.repository);

  // The 'call' method is a special Dart function that makes 
  // instances of this class callable like a standard function.
  Future<void> call(String email, String password) async {
    return await repository.logInUser(email, password);
  }
}
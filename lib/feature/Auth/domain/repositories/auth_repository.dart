abstract class AuthRepository {
  Future<void> signUpUser(String email, String password);
  Future<void> logInUser(String email, String password);
}
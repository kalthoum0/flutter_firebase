import 'package:second_attempt/feature/login/data/sources/auth_remote_data_source.dart';
import 'package:second_attempt/feature/login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> signUpUser(String email, String password) async {
    await remoteDataSource.signUp(email, password);
  }

  @override
  Future<void> logInUser(String email, String password) async {
    // We call the method we just created in the RemoteDataSource
    await remoteDataSource.logIn(email, password);
  }
}
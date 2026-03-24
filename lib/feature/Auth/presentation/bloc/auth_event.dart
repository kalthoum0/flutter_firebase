part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}
class SignUpSubmitted extends AuthEvent {
  final String email;
  final String password;
  SignUpSubmitted(this.email, this.password);
}


class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;
  LoginSubmitted({
    required this.email, 
    required this.password});
}
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}
class SignUpSubmitted extends AuthEvent {
  final String name;
  final String email;
  final String password;
  SignUpSubmitted(
    {
    required this.email, 
    required this.password,
    required this.name
    });
}


class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;
  LoginSubmitted({
    required this.email, 
    required this.password});
}

class AuthCheckRequested extends AuthEvent{}

class LogOutRequested extends AuthEvent {}

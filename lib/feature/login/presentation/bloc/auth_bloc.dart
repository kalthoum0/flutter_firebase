import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:second_attempt/feature/login/domain/usecases/login_usecase.dart';
import 'package:second_attempt/feature/login/domain/usecases/signUp_usecase.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;

  AuthBloc(this.signupUseCase, this.loginUseCase) : super(AuthInitial()) {
    on<SignUpSubmitted>((event, emit) async {
      emit(AuthLoading()); // Show a loading spinner in UI
      try {
        await signupUseCase(event.email, event.password);
        emit(AuthSuccess()); // Navigate to next screen
      } catch (e) {
        emit(AuthFailure(e.toString())); // Show error snackbar
      }
    });
  }
}
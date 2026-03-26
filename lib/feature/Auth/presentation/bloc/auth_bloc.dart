import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:second_attempt/feature/Auth/domain/repositories/auth_repository.dart';
import 'package:second_attempt/feature/Auth/domain/usecases/login_usecase.dart';
import 'package:second_attempt/feature/Auth/domain/usecases/signup_usecase.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;
  final AuthRepository authRepository;

  AuthBloc(
    this.signupUseCase, 
    this.loginUseCase,
    this.authRepository
    ) : super(AuthInitial()) {
    on<SignUpSubmitted>((event, emit) async {      
      emit(AuthLoading()); // Show a loading spinner in UI
      try {
        final user = await signupUseCase(event.name,event.email,event.password);
        // await signupUseCase(event.email, event.password);
        if(user !=null){
        emit(AuthSuccess(user)); 
        }        
        else{
          emit (AuthFailure("User creation failed. Please try again"));// Navigate to next screen
        } 
        } catch (e) {
        emit(AuthFailure(e.toString())); // Show error snackbar
      }
    });

    on<LoginSubmitted>((event, emit) async{
      emit(AuthLoading());
      try{
        final user = await loginUseCase(event.email,event.password);
        // await signupUseCase(event.email, event.password);
        if(user !=null){
        emit(AuthSuccess(user)); 
        }        
        else{
          emit (AuthFailure("Login failed: User not found."));// Navigate to next screen
        } 
      } catch(e){
        emit (AuthFailure(e.toString()));
      }
    });
    on<AuthCheckRequested>((event, emit) {
      emit(AuthLoading());
      final user = authRepository.getCurrentUser();
      if (user != null) {
        emit(AuthSuccess(user)); // Go to Home
      } else {
        emit(AuthUnauthenticated()); // Go to Login
      }
    });

    on<LogOutRequested>((event, emit) async {
      emit(AuthLoading()); // Show a spinner while signing out
      await authRepository.logOut();
      emit(AuthUnauthenticated()); // This triggers the move back to Login
    });
  }
}
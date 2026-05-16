import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:my_movies_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_movies_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:my_movies_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:my_movies_app/features/auth/domain/usecases/logout_usecase.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final LogoutUseCase logoutUseCase;
  final AuthRepository authRepository;

  AuthBloc({
    required this.loginUseCase,
    required this.signupUseCase,
    required this.logoutUseCase,
    required this.authRepository,
  }) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user =
            await loginUseCase(email: event.email, password: event.password);
        emit(Authenticated(user));
      } catch (e) {
        emit(Unauthenticated(message: e.toString()));
      }
    });

    on<SignupRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user =
            await signupUseCase(email: event.email, password: event.password);
        emit(Authenticated(user));
      } catch (e) {
        emit(Unauthenticated(message: e.toString()));
      }
    });

    // FIXED: Handled the guest pipeline cleanly
    on<ContinueAsGuestRequested>((event, emit) {
      emit(const AuthGuest());
    });

    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading());
      await logoutUseCase();
      emit(const Unauthenticated());
    });
  }
}

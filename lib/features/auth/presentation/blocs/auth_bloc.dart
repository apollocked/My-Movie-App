import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final SignupUseCase _signupUseCase;
  final LogoutUseCase _logoutUseCase;
  final AuthRepository _authRepository;

  AuthBloc({
    required LoginUseCase loginUseCase,
    required SignupUseCase signupUseCase,
    required LogoutUseCase logoutUseCase,
    required AuthRepository authRepository,
  })  : _loginUseCase = loginUseCase,
        _signupUseCase = signupUseCase,
        _logoutUseCase = logoutUseCase,
        _authRepository = authRepository,
        super(AuthInitial()) {
    on<AuthCheckRequested>((event, emit) async {
      await emit.forEach(
        _authRepository.currentUser,
        onData: (user) =>
            user != null ? Authenticated(user) : Unauthenticated(),
      );
    });

    on<AuthLoginSubmitted>((event, emit) async {
      emit(AuthLoading());
      try {
        final user =
            await _loginUseCase(email: event.email, password: event.password);
        emit(Authenticated(user));
      } catch (e) {
        emit(AuthFailure(e.toString().replaceAll('Exception: ', '')));
      }
    });

    on<AuthSignUpSubmitted>((event, emit) async {
      emit(AuthLoading());
      try {
        final user =
            await _signupUseCase(email: event.email, password: event.password);
        emit(Authenticated(user));
      } catch (e) {
        emit(AuthFailure(e.toString().replaceAll('Exception: ', '')));
      }
    });

    on<AuthLogoutRequested>((event, emit) async {
      emit(AuthLoading());
      await _logoutUseCase();
      emit(Unauthenticated());
    });
  }
}

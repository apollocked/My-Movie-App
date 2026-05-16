import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:my_movies_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_movies_app/features/auth/domain/entities/user_entity.dart';
import 'package:my_movies_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:my_movies_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:my_movies_app/features/auth/domain/usecases/logout_usecase.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final LogoutUseCase logoutUseCase;
  final AuthRepository authRepository;
  StreamSubscription<UserEntity?>? _userSubscription;

  AuthBloc({
    required this.loginUseCase,
    required this.signupUseCase,
    required this.logoutUseCase,
    required this.authRepository,
  }) : super(AuthInitial()) {
    _userSubscription = authRepository.currentUser.listen((user) {
      add(AuthStatusChanged(user));
    });

    on<AuthCheckRequested>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final isGuest = prefs.getBool('is_guest') ?? false;
      
      final user = await authRepository.currentUser.first;
      if (user != null) {
        emit(Authenticated(user));
      } else if (isGuest) {
        emit(const AuthGuest());
      } else {
        emit(const Unauthenticated());
      }
    });

    on<AuthStatusChanged>((event, emit) {
      if (event.user != null) {
        emit(Authenticated(event.user!));
      } else {
        // Only emit Unauthenticated if we are not in AuthGuest state
        if (state is! AuthGuest) {
          emit(const Unauthenticated());
        }
      }
    });

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user =
            await loginUseCase(email: event.email, password: event.password);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('is_guest', false);
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
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('is_guest', false);
        emit(Authenticated(user));
      } catch (e) {
        emit(Unauthenticated(message: e.toString()));
      }
    });

    on<ContinueAsGuestRequested>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_guest', true);
      emit(const AuthGuest());
    });

    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading());
      await logoutUseCase();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_guest', false);
      emit(const Unauthenticated());
    });
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}

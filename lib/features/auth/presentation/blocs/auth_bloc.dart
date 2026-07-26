import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:my_movie/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_movie/features/auth/domain/entities/user_entity.dart';
import 'package:my_movie/features/auth/domain/usecases/login_usecase.dart';
import 'package:my_movie/features/auth/domain/usecases/signup_usecase.dart';
import 'package:my_movie/features/auth/domain/usecases/logout_usecase.dart';
import 'package:my_movie/features/auth/domain/usecases/google_login_usecase.dart';
import 'package:my_movie/core/utils/rate_limiter.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final LogoutUseCase logoutUseCase;
  final GoogleLoginUseCase googleLoginUseCase;
  final AuthRepository authRepository;
  StreamSubscription<UserEntity?>? _userSubscription;
  static final _loginLimiter = RateLimiter(maxAttempts: 5, window: Duration(minutes: 1));
  static final _signupLimiter = RateLimiter(maxAttempts: 3, window: Duration(minutes: 1));

  AuthBloc({
    required this.loginUseCase,
    required this.signupUseCase,
    required this.logoutUseCase,
    required this.googleLoginUseCase,
    required this.authRepository,
  }) : super(AuthInitial()) {
    _userSubscription = authRepository.currentUser.listen((user) {
      add(AuthStatusChanged(user));
    });

    on<AuthCheckRequested>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final isGuest = prefs.getBool('is_guest') ?? false;
      final hasSeenOnboarding = prefs.getBool('has_seen_onboarding') ?? false;

      final user = await authRepository.currentUser.first;
      if (user != null) {
        emit(Authenticated(user));
      } else if (isGuest || hasSeenOnboarding) {
        // If they already chose guest or have seen onboarding, don't force them back to it
        emit(const AuthGuest());
      } else {
        emit(const Unauthenticated());
      }
    });

    on<AuthStatusChanged>((event, emit) async {
      if (event.user != null) {
        emit(Authenticated(event.user!));
      } else {
        final prefs = await SharedPreferences.getInstance();
        final isGuest = prefs.getBool('is_guest') ?? false;
        final hasSeenOnboarding = prefs.getBool('has_seen_onboarding') ?? false;

        // Only emit Unauthenticated if we are not in AuthGuest state
        // AND we haven't seen onboarding yet
        if (state is! AuthGuest && !isGuest && !hasSeenOnboarding) {
          emit(const Unauthenticated());
        } else if (state is! AuthGuest) {
          emit(const AuthGuest());
        }
      }
    });

    on<LoginRequested>((event, emit) async {
      if (_loginLimiter.isBlocked) {
        emit(Unauthenticated(
            message: 'Too many login attempts. Please wait ${_loginLimiter.remainingAttempts} minute.'));
        return;
      }
      _loginLimiter.recordAttempt();
      emit(AuthLoading());
      try {
        final user =
            await loginUseCase(email: event.email, password: event.password);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('is_guest', false);
        await prefs.setBool('has_seen_onboarding', true);
        emit(Authenticated(user));
      } catch (e) {
        emit(Unauthenticated(message: 'Login failed. Please check your credentials.'));
      }
    });

    on<SignupRequested>((event, emit) async {
      if (_signupLimiter.isBlocked) {
        emit(Unauthenticated(
            message: 'Too many signup attempts. Please wait a minute.'));
        return;
      }
      _signupLimiter.recordAttempt();
      emit(AuthLoading());
      try {
        final user =
            await signupUseCase(email: event.email, password: event.password);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('is_guest', false);
        await prefs.setBool('has_seen_onboarding', true);
        emit(Authenticated(user));
      } catch (e) {
        emit(Unauthenticated(message: 'Account creation failed. Please try again.'));
      }
    });

    on<ContinueAsGuestRequested>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_guest', true);
      await prefs.setBool('has_seen_onboarding', true);
      emit(const AuthGuest());
    });

    on<GoogleLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await googleLoginUseCase();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('is_guest', false);
        await prefs.setBool('has_seen_onboarding', true);
        emit(Authenticated(user));
      } catch (e) {
        final message = e.toString().contains('cancelled')
            ? 'Google sign-in was cancelled.'
            : 'Google sign-in failed. Please try again.';
        emit(Unauthenticated(message: message));
      }
    });

    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading());
      await logoutUseCase();
      final prefs = await SharedPreferences.getInstance();
      // When logout, treat as guest so we stay on home page
      await prefs.setBool('is_guest', true);
      emit(const AuthGuest());
    });
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}

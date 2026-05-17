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
      emit(AuthLoading());
      try {
        final user =
            await loginUseCase(email: event.email, password: event.password);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('is_guest', false);
        await prefs.setBool('has_seen_onboarding', true);
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
        await prefs.setBool('has_seen_onboarding', true);
        emit(Authenticated(user));
      } catch (e) {
        emit(Unauthenticated(message: e.toString()));
      }
    });

    on<ContinueAsGuestRequested>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_guest', true);
      await prefs.setBool('has_seen_onboarding', true);
      emit(const AuthGuest());
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

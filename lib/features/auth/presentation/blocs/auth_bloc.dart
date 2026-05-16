import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    
    // Listen to Auth State changes from Firebase automatically
    _userSubscription = authRepository.currentUser.listen((user) {
      add(AuthStatusChanged(user));
    });

    on<AuthStatusChanged>((event, emit) {
      if (event.user != null) {
        emit(Authenticated(event.user!));
      } else {
        // If logged out or session ended, and we aren't a temporary guest, go to Unauthenticated
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

    on<ContinueAsGuestRequested>((event, emit) {
      emit(const AuthGuest());
    });

    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading());
      await logoutUseCase();
      emit(const Unauthenticated());
    });
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}

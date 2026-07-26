import 'package:my_movie/features/auth/domain/entities/user_entity.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class AuthCheckRequested extends AuthEvent {
  const AuthCheckRequested();
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  const LoginRequested(this.email, this.password);
}

class SignupRequested extends AuthEvent {
  final String email;
  final String password;
  const SignupRequested(this.email, this.password);
}

class ContinueAsGuestRequested extends AuthEvent {
  const ContinueAsGuestRequested();
}

class GoogleLoginRequested extends AuthEvent {
  const GoogleLoginRequested();
}

class AuthStatusChanged extends AuthEvent {
  final UserEntity? user;
  const AuthStatusChanged(this.user);
}

class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}

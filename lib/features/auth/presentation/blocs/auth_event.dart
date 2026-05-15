abstract class AuthEvent {}

class AuthCheckRequested extends AuthEvent {}

class AuthLoginSubmitted extends AuthEvent {
  final String email;
  final String password;
  AuthLoginSubmitted(this.email, this.password);
}

class AuthSignUpSubmitted extends AuthEvent {
  final String email;
  final String password;
  AuthSignUpSubmitted(this.email, this.password);
}

class AuthLogoutRequested extends AuthEvent {}

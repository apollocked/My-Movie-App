abstract class AuthEvent {
  const AuthEvent();
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

class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}

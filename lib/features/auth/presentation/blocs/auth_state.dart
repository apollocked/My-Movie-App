import '../../domain/entities/user_entity.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final UserEntity user;
  const Authenticated(this.user);
}

class AuthGuest extends AuthState {
  const AuthGuest();
}

class Unauthenticated extends AuthState {
  final String? message;
  const Unauthenticated({this.message});
}

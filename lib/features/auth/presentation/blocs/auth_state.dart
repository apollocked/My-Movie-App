import '../../domain/entities/user_entity.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final UserEntity user;
  const Authenticated(this.user);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Authenticated && user.id == other.user.id;

  @override
  int get hashCode => user.id.hashCode;
}

class AuthGuest extends AuthState {
  const AuthGuest();
}

class Unauthenticated extends AuthState {
  final String? message;
  const Unauthenticated({this.message});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Unauthenticated && message == other.message;

  @override
  int get hashCode => message.hashCode;
}

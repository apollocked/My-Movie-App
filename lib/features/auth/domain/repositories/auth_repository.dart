import '../entities/user_entity.dart';

abstract class AuthRepository {
  Stream<UserEntity?> get currentUser;
  Future<UserEntity> signUpWithEmail(
      {required String email, required String password});
  Future<UserEntity> logInWithEmail(
      {required String email, required String password});
  Future<void> logOut();
}

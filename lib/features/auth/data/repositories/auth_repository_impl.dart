import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Stream<UserEntity?> get currentUser => remoteDataSource.authStateChanges;

  @override
  Future<UserEntity> signUpWithEmail(
      {required String email, required String password}) {
    return remoteDataSource.signUp(email: email, password: password);
  }

  @override
  Future<UserEntity> logInWithEmail(
      {required String email, required String password}) {
    return remoteDataSource.logIn(email: email, password: password);
  }

  @override
  Future<void> logOut() => remoteDataSource.logOut();
}

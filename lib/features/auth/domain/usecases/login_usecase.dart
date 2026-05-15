import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  const LoginUseCase(this.repository);

  Future<UserEntity> call({required String email, required String password}) {
    return repository.logInWithEmail(email: email, password: password);
  }
}

import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class GoogleLoginUseCase {
  final AuthRepository repository;
  const GoogleLoginUseCase(this.repository);

  Future<UserEntity> call() {
    return repository.signInWithGoogle();
  }
}

import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;
  const SignupUseCase(this.repository);

  Future<UserEntity> call({required String email, required String password}) {
    return repository.signUpWithEmail(email: email, password: password);
  }
}

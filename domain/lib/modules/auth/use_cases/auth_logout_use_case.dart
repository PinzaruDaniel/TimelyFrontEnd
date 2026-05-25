import 'package:domain/core/usecase.dart';
import 'package:domain/modules/auth/auth_repository.dart';

class AuthLogoutUseCase extends UseCaseNoEitherNoParamsNoStream<void> {
  final AuthRepository authRepository;

  AuthLogoutUseCase({required this.authRepository});

  @override
  Future<void> call() {
    return authRepository.deleteTokens();
  }
}


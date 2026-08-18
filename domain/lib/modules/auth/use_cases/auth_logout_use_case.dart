import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/auth/auth_repository.dart';

class AuthLogoutUseCase extends NoParamsFutureUseCase<void> {
  final AuthRepository authRepository;

  AuthLogoutUseCase({required this.authRepository});

  @override
  Future<void> execute() {
    return authRepository.deleteTokens();
  }
}

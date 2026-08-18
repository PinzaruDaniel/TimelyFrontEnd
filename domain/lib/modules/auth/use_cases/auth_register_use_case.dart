import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/auth/auth_repository.dart';

import 'package:smart_domain/smart_domain.dart' hide Failure;

class AuthRegisterUseCase extends UseCase<void, AuthRegisterParams> {
  final AuthRepository authRepository;

  AuthRegisterUseCase({required this.authRepository});

  @override
  Future<Result<void, Failure>> execute(AuthRegisterParams params) async {
    final result = await authRepository.register(
      params.name,
      params.email,
      params.password,
      params.group,
    );

    return result.mapAsync(
      (entity) => authRepository.insertTokens(
        entity.accessToken ?? '',
        entity.refreshToken ?? '',
      ),
    );
  }
}

class AuthRegisterParams {
  final String name;
  final String email;
  final String password;
  final String group;

  AuthRegisterParams({
    required this.email,
    required this.password,
    required this.name,
    required this.group,
  });
}

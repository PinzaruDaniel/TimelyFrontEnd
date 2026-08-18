import 'package:common/constants/failure_class.dart';
import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/auth/auth_repository.dart';

class AuthResetPasswordUseCase extends UseCase<void, AuthResetPasswordParams> {
  final AuthRepository authRepository;

  AuthResetPasswordUseCase({required this.authRepository});

  @override
  Future<Result<void, Failure>> execute(AuthResetPasswordParams params) async {
    final result = await authRepository.resetPassword(
      params.email,
      params.password,
    );
    return result.mapAsync(
      (entity) => authRepository.insertTokens(
        entity.accessToken ?? '',
        entity.refreshToken ?? '',
      ),
    );
  }
}

class AuthResetPasswordParams {
  final String email;
  final String password;

  AuthResetPasswordParams({required this.email, required this.password});
}

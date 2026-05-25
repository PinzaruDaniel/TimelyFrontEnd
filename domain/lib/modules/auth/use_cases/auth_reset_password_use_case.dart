import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/auth/auth_repository.dart';

class AuthResetPasswordUseCase extends UseCase<void, AuthResetPasswordParams> {
  final AuthRepository authRepository;

  AuthResetPasswordUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(params) async {
    final result = await authRepository.resetPassword(params.email, params.password);
    return result.fold(
      (failure) => Left(failure),
      (entity) => Right(authRepository.insertTokens(entity.accessToken ?? '', entity.refreshToken ?? '')),
    );
  }
}

class AuthResetPasswordParams {
  final String email;
  final String password;

  AuthResetPasswordParams({required this.email, required this.password});
}


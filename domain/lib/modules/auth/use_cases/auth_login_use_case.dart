
import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/auth/auth_repository.dart';

import '../../../core/usecase.dart';

class AuthLoginUseCase extends UseCase<void, AuthLoginParams> {
  final AuthRepository authRepository;

  AuthLoginUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(params) async {
    final result = await authRepository.login(params.email, params.password);

    return result.fold(
          (failure) {
        return Left(failure);
      },
          (entity) {

        return Right(authRepository.insertTokens(entity.accessToken ?? '', entity.refreshToken ?? ''));
      },
    );
  }
}

class AuthLoginParams {
  final String email;
  final String password;

  AuthLoginParams({required this.email, required this.password});
}

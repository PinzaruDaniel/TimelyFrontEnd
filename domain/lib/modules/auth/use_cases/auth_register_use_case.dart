import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/auth/auth_repository.dart';

import '../../../core/usecase.dart';

class AuthRegisterUseCase extends UseCase<void, AuthRegisterParams> {
  final AuthRepository authRepository;

  AuthRegisterUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(params) async {
    final result = await authRepository.register(params.name, params.email, params.password, params.group);

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

class AuthRegisterParams {
  final String name;
  final String email;
  final String password;
  final String group;

  AuthRegisterParams({required this.email, required this.password, required this.name, required this.group});
}

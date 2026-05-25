import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/auth/models/index.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthTokensEntity>> login(String email, String password);

  Future<Either<Failure, AuthTokensEntity>> register(String name, String email, String password, String group);

  Future<Either<Failure, AuthTokensEntity>> resetPassword(String email, String password);

  Future<Either<Failure, AuthTokensEntity>> refresh(String refreshToken);

  Future<void> insertTokens(String accessToken, String refreshToken);

  Future<void> deleteTokens();

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();
}

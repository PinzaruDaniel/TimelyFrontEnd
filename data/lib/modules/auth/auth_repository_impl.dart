import 'package:common/constants/failure_class.dart';
import 'package:common/constants/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/auth/models/index.dart';

import '../../mapper/auth_tokens_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService apiService;
  final AuthLocalSource localSource;

  AuthRepositoryImpl({required this.apiService, required this.localSource});

  @override
  Future<Either<Failure, AuthTokensEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await apiService.login({
        "email": email,
        "password": password,
      });

      print(response.toEntity);
      return Right(response.toEntity);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<void> insertTokens(String accessToken, String refreshToken) async {
    await localSource.insertTokens(accessToken, refreshToken);
    consoleLog('inserted Tokens: $accessToken $refreshToken');
  }

  @override
  Future<void> deleteTokens() async {
    localSource.deleteTokens();
  }

  @override
  Future<Either<Failure, AuthTokensEntity>> register(
    String name,
    String email,
    String password,
    String group,
  ) async {
    try {
      final response = await apiService.register({
        "email": email,
        "password": password,
        "name": name,
        "group": group,
      });
      return Right(response.toEntity);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, AuthTokensEntity>> resetPassword(
    String email,
    String password,
  ) async {
    try {
      final response = await apiService.resetPassword({
        "email": email,
        "new-password": password,
      });
      return Right(response.toEntity);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, AuthTokensEntity>> refresh(String refreshToken) async {
    try {
      final response = await apiService.refresh({
        "refresh_token": refreshToken,
      });
      return Right(response.toEntity);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<String?> getAccessToken() async {
    return localSource.getAccessToken();
  }

  @override
  Future<String?> getRefreshToken() async {
    return localSource.getRefreshToken();
  }
}

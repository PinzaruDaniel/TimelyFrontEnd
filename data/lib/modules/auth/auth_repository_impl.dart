import 'package:common/constants/failure_class.dart';
import 'package:common/constants/logger.dart';
import 'package:data/core/app_failure_mapper.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/auth/models/index.dart';
import 'package:smart_domain/smart_domain.dart' show Result;

import '../../mapper/auth_tokens_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService apiService;
  final AuthLocalSource localSource;

  AuthRepositoryImpl({required this.apiService, required this.localSource});

  @override
  Future<Result<AuthTokensEntity, Failure>> login(
    String email,
    String password,
  ) async {
    return Result.guardAsync(() async {
      final response = await apiService.login({
        "email": email,
        "password": password,
      });

      print(response.toEntity);
      return response.toEntity;
    }, onError: appFailureMapper.map);
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
  Future<Result<AuthTokensEntity, Failure>> register(
    String name,
    String email,
    String password,
    String group,
  ) async {
    return Result.guardAsync(() async {
      final response = await apiService.register({
        "email": email,
        "password": password,
        "name": name,
        "group": group,
      });
      return response.toEntity;
    }, onError: appFailureMapper.map);
  }

  @override
  Future<Result<AuthTokensEntity, Failure>> resetPassword(
    String email,
    String password,
  ) async {
    return Result.guardAsync(() async {
      final response = await apiService.resetPassword({
        "email": email,
        "new-password": password,
      });
      return response.toEntity;
    }, onError: appFailureMapper.map);
  }

  @override
  Future<Result<AuthTokensEntity, Failure>> refresh(String refreshToken) {
    return Result.guardAsync(() async {
      final response = await apiService.refresh({"refreshToken": refreshToken});
      return response.toEntity;
    }, onError: appFailureMapper.map);
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

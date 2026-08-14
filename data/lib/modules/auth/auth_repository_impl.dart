import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:data/modules/auth/models/remote/index.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/auth/models/index.dart';
import 'package:smart_repository/smart_repository.dart';

import '../../mapper/auth_tokens_mapper.dart';

part 'auth_repository_impl.g.dart';

AuthTokensEntity mapAuthTokensRemote(AuthTokensApiDto tokens) =>
    tokens.toEntity;

Failure mapAuthFailure(Object error, StackTrace stackTrace) =>
    error is DioException
        ? Failure.dio(error)
        : Failure.error(error, stackTrace);

Either<Failure, AuthTokensEntity> adaptAuthResult(RepositoryResult<AuthTokensEntity> result,) =>
    result.fold(
      onSuccess: Right.new,
      onFailure: (error, stackTrace) =>
          Left(error is Failure ? error : Failure.error(error, stackTrace)),
    );

@GenerateRepositoryImplementation<AuthApiService, AuthLocalSource>(
  defaultPolicy: RepositoryPolicy.networkOnly,
  resultType: AuthTokensEntity,
  mapRemote: #mapAuthTokensRemote,
  mapError: #mapAuthFailure,
  resultAdapter: #adaptAuthResult,
  persistRemote: false,
  retainKeyedRepository: false,
)
abstract class AuthRepositoryImpl implements AuthRepository {
  factory AuthRepositoryImpl({
    required AuthApiService remote,
    required AuthLocalSource local,
  }) = _$AuthRepositoryImpl;

  @RepositoryMethod(remoteBody: {'email': #email, 'password': #password})
  @override
  Future<Either<Failure, AuthTokensEntity>> login(String email,
      String password,);

  @RepositoryMethod(
    remoteBody: {
      'email': #email,
      'password': #password,
      'name': #name,
      'group': #group,
    },
  )
  @override
  Future<Either<Failure, AuthTokensEntity>> register(String name,
      String email,
      String password,
      String group,);

  @RepositoryMethod(remoteBody: {'email': #email, 'new-password': #password})
  @override
  Future<Either<Failure, AuthTokensEntity>> resetPassword(String email,
      String password,);

  @RepositoryMethod(remoteBody: {'refreshToken': #refreshToken})
  @override
  Future<Either<Failure, AuthTokensEntity>> refresh(String refreshToken);

  Future<void> dispose();
}

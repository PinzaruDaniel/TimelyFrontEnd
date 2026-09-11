// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository_impl.dart';

// **************************************************************************
// RepositoryImplementationGenerator
// **************************************************************************

/// Generated implementation of `AuthRepositoryImpl`.
final class _$AuthRepositoryImpl implements AuthRepositoryImpl {
  _$AuthRepositoryImpl({
    required AuthApiService remote,
    required AuthLocalSource local,
  }) : _local = local {
    _loginRepository =
        MappedRepositoryFamily<
          ({String email, String password}),
          AuthTokensEntity,
          AuthTokensApiDto,
          AuthTokensEntity
        >(
          remote: (key) =>
              remote.login({'email': key.email, 'password': key.password}),
          mapRemote: mapAuthTokensRemote,
          mapLocal: (value) => value,
          mapError: (_, error, stackTrace) => mapAuthFailure(error, stackTrace),
          config: const SmartRepositoryConfig(
            defaultPolicy: RepositoryPolicy.networkOnly,
          ),
        );
    _registerRepository =
        MappedRepositoryFamily<
          ({String name, String email, String password, String group}),
          AuthTokensEntity,
          AuthTokensApiDto,
          AuthTokensEntity
        >(
          remote: (key) => remote.register({
            'email': key.email,
            'password': key.password,
            'name': key.name,
            'group': key.group,
          }),
          mapRemote: mapAuthTokensRemote,
          mapLocal: (value) => value,
          mapError: (_, error, stackTrace) => mapAuthFailure(error, stackTrace),
          config: const SmartRepositoryConfig(
            defaultPolicy: RepositoryPolicy.networkOnly,
          ),
        );
    _resetPasswordRepository =
        MappedRepositoryFamily<
          ({String email, String password}),
          AuthTokensEntity,
          AuthTokensApiDto,
          AuthTokensEntity
        >(
          remote: (key) => remote.resetPassword({
            'email': key.email,
            'new-password': key.password,
          }),
          mapRemote: mapAuthTokensRemote,
          mapLocal: (value) => value,
          mapError: (_, error, stackTrace) => mapAuthFailure(error, stackTrace),
          config: const SmartRepositoryConfig(
            defaultPolicy: RepositoryPolicy.networkOnly,
          ),
        );
    _refreshRepository =
        MappedRepositoryFamily<
          String,
          AuthTokensEntity,
          AuthTokensApiDto,
          AuthTokensEntity
        >(
          remote: (key) => remote.refresh({'refreshToken': key}),
          mapRemote: mapAuthTokensRemote,
          mapLocal: (value) => value,
          mapError: (_, error, stackTrace) => mapAuthFailure(error, stackTrace),
          config: const SmartRepositoryConfig(
            defaultPolicy: RepositoryPolicy.networkOnly,
          ),
        );
  }

  final AuthLocalSource _local;

  late final MappedRepositoryFamily<
    ({String email, String password}),
    AuthTokensEntity,
    AuthTokensApiDto,
    AuthTokensEntity
  >
  _loginRepository;

  late final MappedRepositoryFamily<
    ({String name, String email, String password, String group}),
    AuthTokensEntity,
    AuthTokensApiDto,
    AuthTokensEntity
  >
  _registerRepository;

  late final MappedRepositoryFamily<
    ({String email, String password}),
    AuthTokensEntity,
    AuthTokensApiDto,
    AuthTokensEntity
  >
  _resetPasswordRepository;

  late final MappedRepositoryFamily<
    String,
    AuthTokensEntity,
    AuthTokensApiDto,
    AuthTokensEntity
  >
  _refreshRepository;

  @override
  Future<Either<Failure, AuthTokensEntity>> login(
    String email,
    String password,
  ) async {
    final key = (email: email, password: password);
    try {
      return adaptAuthResult(
        await _loginRepository.get(
          key,
          policy: RepositoryPolicy.networkOnly,
          persistRemote: false,
        ),
      );
    } finally {
      await _loginRepository.remove(key);
    }
  }

  @override
  Future<Either<Failure, AuthTokensEntity>> register(
    String name,
    String email,
    String password,
    String group,
  ) async {
    final key = (name: name, email: email, password: password, group: group);
    try {
      return adaptAuthResult(
        await _registerRepository.get(
          key,
          policy: RepositoryPolicy.networkOnly,
          persistRemote: false,
        ),
      );
    } finally {
      await _registerRepository.remove(key);
    }
  }

  @override
  Future<Either<Failure, AuthTokensEntity>> resetPassword(
    String email,
    String password,
  ) async {
    final key = (email: email, password: password);
    try {
      return adaptAuthResult(
        await _resetPasswordRepository.get(
          key,
          policy: RepositoryPolicy.networkOnly,
          persistRemote: false,
        ),
      );
    } finally {
      await _resetPasswordRepository.remove(key);
    }
  }

  @override
  Future<Either<Failure, AuthTokensEntity>> refresh(String refreshToken) async {
    final key = refreshToken;
    try {
      return adaptAuthResult(
        await _refreshRepository.get(
          key,
          policy: RepositoryPolicy.networkOnly,
          persistRemote: false,
        ),
      );
    } finally {
      await _refreshRepository.remove(key);
    }
  }

  @override
  Future<void> insertTokens(String accessToken, String refreshToken) =>
      _local.insertTokens(accessToken, refreshToken);

  @override
  Future<void> deleteTokens() => _local.deleteTokens();

  @override
  Future<String?> getAccessToken() => _local.getAccessToken();

  @override
  Future<String?> getRefreshToken() => _local.getRefreshToken();

  /// Releases every generated repository resource.
  Future<void> dispose() async {
    await Future.wait<void>([
      _loginRepository.dispose(),
      _registerRepository.dispose(),
      _resetPasswordRepository.dispose(),
      _refreshRepository.dispose(),
    ]);
  }
}

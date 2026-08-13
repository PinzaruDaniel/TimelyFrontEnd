// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_tokens_mapper.dart';

// **************************************************************************
// SmartMapperGenerator
// **************************************************************************

class _$AuthTokensMapper implements AuthTokensMapper {
  const _$AuthTokensMapper();
  @override
  AuthTokensEntity fromRemote(AuthTokensApiDto source) {
    return AuthTokensEntity(
      accessToken: source.accessToken,
      refreshToken: source.refreshToken,
    );
  }
}

AuthTokensMapper createAuthTokensMapper() => const _$AuthTokensMapper();

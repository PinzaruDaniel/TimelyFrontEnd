import 'package:data/modules/auth/models/remote/index.dart';
import 'package:domain/modules/auth/models/index.dart';
import 'package:smart_mapper/smart_mapper.dart';

part 'auth_tokens_mapper.g.dart';

@SmartMapper()
abstract class AuthTokensMapper {
  AuthTokensEntity fromRemote(AuthTokensApiDto source);
}

final _authTokensMapper = createAuthTokensMapper();

extension AuthTokensToEntityMapper on AuthTokensApiDto {
  AuthTokensEntity get toEntity => _authTokensMapper.fromRemote(this);
}

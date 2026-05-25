import 'package:data/modules/auth/models/remote/index.dart';
import 'package:domain/modules/auth/models/index.dart';

extension AuthTokensToEntityMapper on AuthTokensApiDto{
  AuthTokensEntity get toEntity{
    return AuthTokensEntity(accessToken: accessToken, refreshToken: refreshToken);
  }
}

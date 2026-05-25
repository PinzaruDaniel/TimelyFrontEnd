part of 'index.dart';

@freezed
abstract class AuthTokensEntity with _$AuthTokensEntity {
  const factory AuthTokensEntity({ String? accessToken,  String? refreshToken}) =
  _AuthTokensEntity;

  factory AuthTokensEntity.fromJson(Map<String, dynamic> json) => _$AuthTokensEntityFromJson(json);
}
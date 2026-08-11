part of 'index.dart';

@freezed
abstract class AuthTokensApiDto with _$AuthTokensApiDto {
  const factory AuthTokensApiDto({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
  }) = _AuthTokensApiDto;

  factory AuthTokensApiDto.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensApiDtoFromJson(json);
}

part of 'index.dart';

@freezed
abstract class AuthTokensApiDto with _$AuthTokensApiDto {
  const factory AuthTokensApiDto({
     String? accessToken,
     String? refreshToken,
  }) = _AuthTokensApiDto;

  factory AuthTokensApiDto.fromJson(Map<String, dynamic> json) => _$AuthTokensApiDtoFromJson(json);
}

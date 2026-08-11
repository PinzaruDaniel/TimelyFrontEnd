// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthTokensApiDto _$AuthTokensApiDtoFromJson(Map<String, dynamic> json) =>
    _AuthTokensApiDto(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$AuthTokensApiDtoToJson(_AuthTokensApiDto instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };

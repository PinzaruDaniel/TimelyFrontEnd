// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthTokensApiDto _$AuthTokensApiDtoFromJson(Map<String, dynamic> json) =>
    _AuthTokensApiDto(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$AuthTokensApiDtoToJson(_AuthTokensApiDto instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

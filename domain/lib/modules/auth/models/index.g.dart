// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthTokensEntity _$AuthTokensEntityFromJson(Map<String, dynamic> json) =>
    _AuthTokensEntity(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$AuthTokensEntityToJson(_AuthTokensEntity instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

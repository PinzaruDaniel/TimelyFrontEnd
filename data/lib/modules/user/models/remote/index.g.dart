// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileApiDto _$UserProfileApiDtoFromJson(Map<String, dynamic> json) =>
    _UserProfileApiDto(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      groupId: json['groupId'] as String,
      groupName: json['groupName'] as String,
    );

Map<String, dynamic> _$UserProfileApiDtoToJson(_UserProfileApiDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'groupId': instance.groupId,
      'groupName': instance.groupName,
    };

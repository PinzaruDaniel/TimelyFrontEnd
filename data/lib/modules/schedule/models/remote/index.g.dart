// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScheduleApiDto _$ScheduleApiDtoFromJson(Map<String, dynamic> json) =>
    _ScheduleApiDto(
      group: json['group'] as String,
      groupId: json['groupId'] as String,
      monday: (json['Luni'] as List<dynamic>)
          .map((e) => ScheduleItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      tuesday: (json['Marti'] as List<dynamic>)
          .map((e) => ScheduleItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      wednesday: (json['Miercuri'] as List<dynamic>)
          .map((e) => ScheduleItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      thursday: (json['Joi'] as List<dynamic>)
          .map((e) => ScheduleItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      friday: (json['Vineri'] as List<dynamic>)
          .map((e) => ScheduleItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduleApiDtoToJson(_ScheduleApiDto instance) =>
    <String, dynamic>{
      'group': instance.group,
      'groupId': instance.groupId,
      'Luni': instance.monday,
      'Marti': instance.tuesday,
      'Miercuri': instance.wednesday,
      'Joi': instance.thursday,
      'Vineri': instance.friday,
    };

_ScheduleItemDto _$ScheduleItemDtoFromJson(Map<String, dynamic> json) =>
    _ScheduleItemDto(
      time: json['time'] as String,
      subject: json['subject'] as String,
      teacher: json['teacher'] as String?,
      room: json['room'] as String?,
      period: json['period'] as String,
    );

Map<String, dynamic> _$ScheduleItemDtoToJson(_ScheduleItemDto instance) =>
    <String, dynamic>{
      'time': instance.time,
      'subject': instance.subject,
      'teacher': instance.teacher,
      'room': instance.room,
      'period': instance.period,
    };

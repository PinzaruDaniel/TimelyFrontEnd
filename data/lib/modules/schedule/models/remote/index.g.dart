// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScheduleItemDto _$ScheduleItemDtoFromJson(Map<String, dynamic> json) =>
    _ScheduleItemDto(
      time: json['time'] as String,
      subject: json['subject'] as String,
      teacher: json['teacher'] as String,
      room: json['room'] as String,
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

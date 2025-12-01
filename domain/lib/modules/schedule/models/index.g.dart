// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScheduleItemEntity _$ScheduleItemEntityFromJson(Map<String, dynamic> json) =>
    _ScheduleItemEntity(
      time: json['time'] as String,
      subject: json['subject'] as String,
      teacher: json['teacher'] as String,
      room: json['room'] as String,
      period: json['period'] as String,
    );

Map<String, dynamic> _$ScheduleItemEntityToJson(_ScheduleItemEntity instance) =>
    <String, dynamic>{
      'time': instance.time,
      'subject': instance.subject,
      'teacher': instance.teacher,
      'room': instance.room,
      'period': instance.period,
    };

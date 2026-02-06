// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeworkApiDto _$HomeworkApiDtoFromJson(Map<String, dynamic> json) =>
    _HomeworkApiDto(
      homeworkId: json['id'] as String,
      subject: json['subject'] as String,
      description: json['description'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$HomeworkApiDtoToJson(_HomeworkApiDto instance) =>
    <String, dynamic>{
      'id': instance.homeworkId,
      'subject': instance.subject,
      'description': instance.description,
      'dueDate': instance.dueDate.toIso8601String(),
      'imageUrl': instance.imageUrl,
    };

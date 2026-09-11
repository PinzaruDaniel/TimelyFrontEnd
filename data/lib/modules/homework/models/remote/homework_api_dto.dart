// ignore_for_file: invalid_annotation_target

part of 'index.dart';

@freezed
abstract class HomeworkApiDto with _$HomeworkApiDto {
  const factory HomeworkApiDto({
    @JsonKey(name: 'id') required String homeworkId,
    required String subject,
    required String description,
    DateTime? dueDate,
    String? imageUrl,
    @Default(false) bool isDone,
  }) = _HomeworkApiDto;
  factory HomeworkApiDto.fromJson(Map<String, dynamic> json) =>
      _$HomeworkApiDtoFromJson(json);
}

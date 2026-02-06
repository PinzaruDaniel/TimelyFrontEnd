
part of 'index.dart';


@freezed
abstract class HomeworkApiDto with _$HomeworkApiDto {
  const factory HomeworkApiDto({
    @JsonKey(name: 'id') required String homeworkId,
    required String subject,
    required String description,
    required DateTime dueDate,
     String? imageUrl,
})=_HomeworkApiDto;
  factory HomeworkApiDto.fromJson(Map<String, dynamic> json)=> _$HomeworkApiDtoFromJson(json);
}

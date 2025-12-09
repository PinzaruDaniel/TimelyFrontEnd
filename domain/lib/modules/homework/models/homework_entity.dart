part of 'index.dart';

@freezed
abstract class HomeworkEntity with _$HomeworkEntity {
  const factory HomeworkEntity({
    required String homeworkId,
    required String subject,
    required String description,
    required DateTime dueDate,
     String? imageUrl,
  })=_HomeworkEntity;
}
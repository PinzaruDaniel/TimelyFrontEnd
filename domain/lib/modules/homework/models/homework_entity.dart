part of 'index.dart';

@freezed
abstract class HomeworkEntity with _$HomeworkEntity {
  const factory HomeworkEntity({
    required String homeworkId,
    required String subject,
    required String description,
    DateTime? dueDate,
    String? imageUrl,
    @Default(false) bool isDone,
  }) = _HomeworkEntity;
}

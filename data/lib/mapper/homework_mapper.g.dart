// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homework_mapper.dart';

// **************************************************************************
// SmartMapperGenerator
// **************************************************************************

class _$HomeworkMapper implements HomeworkMapper {
  const _$HomeworkMapper();
  @override
  HomeworkEntity fromRemote(HomeworkApiDto source) {
    return HomeworkEntity(
      homeworkId: source.homeworkId,
      subject: source.subject,
      description: source.description,
      dueDate: source.dueDate,
      imageUrl: source.imageUrl,
    );
  }

  @override
  HomeworkBox toLocal(HomeworkEntity source) {
    return HomeworkBox(
      homeworkId: source.homeworkId,
      subject: source.subject,
      description: source.description,
      dueDate: source.dueDate,
      imageUrl: source.imageUrl,
    );
  }

  @override
  HomeworkEntity fromLocal(HomeworkBox source) {
    return HomeworkEntity(
      homeworkId: source.homeworkId,
      subject: source.subject,
      description: source.description,
      dueDate: source.dueDate,
      imageUrl: source.imageUrl,
    );
  }
}

HomeworkMapper createHomeworkMapper() => const _$HomeworkMapper();

import 'package:common/constants/failure_class.dart';
import 'package:common/constants/post_classes.dart';
import 'package:dartz/dartz.dart';

import 'models/index.dart';

abstract class HomeworkRepository {
  Future<Either<Failure, HomeworkEntity>> addHomework(
    CreateHomeworkRequest request,
  );
  Future<Either<Failure, List<HomeworkEntity>>> getHomeworks(String groupId);
  Future<Either<Failure, HomeworkEntity>> getHomework(String homeworkId);
  Future<Either<Failure, HomeworkEntity>> editHomework(
    EditHomeworkRequest request,
  );
  Future<Either<Failure, void>> deleteHomework(String homeworkId);
  Future<Either<Failure, HomeworkEntity>> markHomeworkDone(String homeworkId);
  Future<Either<Failure, HomeworkEntity>> reopenHomework(String homeworkId);

  Future<void> setHomework(List<HomeworkEntity> homeworks);
  Stream<List<HomeworkEntity>> getHomeworksFromCache();
}

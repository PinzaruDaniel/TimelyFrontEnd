import 'package:common/constants/failure_class.dart';
import 'package:common/constants/post_classes.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/schedule/models/index.dart';

import 'models/index.dart';


abstract class HomeworkRepository {
  Future<Either<Failure, HomeworkEntity>> addHomework(CreateHomeworkRequest request);
  Future<Either<Failure, List<HomeworkEntity>>> getHomeworks(String groupId);

  Future<void> setHomework(List<HomeworkEntity> homeworks);
  Stream<List<HomeworkEntity>> getHomeworksFromCache();
}
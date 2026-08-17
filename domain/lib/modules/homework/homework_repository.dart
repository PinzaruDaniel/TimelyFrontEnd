import 'package:common/constants/failure_class.dart';
import 'package:common/constants/post_classes.dart';
import 'package:smart_domain/smart_domain.dart' show Result;

import 'models/index.dart';

abstract class HomeworkRepository {
  Future<Result<HomeworkEntity, Failure>> addHomework(
    CreateHomeworkRequest request,
  );
  Future<Result<List<HomeworkEntity>, Failure>> getHomeworks(String groupId);

  Future<void> setHomework(List<HomeworkEntity> homeworks);
  Stream<List<HomeworkEntity>> getHomeworksFromCache();
}

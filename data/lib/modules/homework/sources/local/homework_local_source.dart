import 'package:data/mapper/homework_mapper.dart';
import 'package:data/modules/homework/models/local/homework_box.dart';
import 'package:domain/modules/homework/models/index.dart';

import '../../../../objectbox.g.dart';

abstract class HomeworkLocalSource {
  Future<void> setHomework(List<HomeworkEntity> homeworks);

  Stream<List<HomeworkBox>> getHomeworkFromCache();
}

class HomeworkLocalSourceImpl implements HomeworkLocalSource {
  Box<HomeworkBox> homeworkBox;

  HomeworkLocalSourceImpl({required this.homeworkBox});

  @override
  Stream<List<HomeworkBox>> getHomeworkFromCache() {
    return homeworkBox.query().watch(triggerImmediately: true).map((e) => e.find());
  }

  @override
  Future<void> setHomework(List<HomeworkEntity> homeworks) async {
    await homeworkBox.putManyAsync(homeworks.map((e) => e.toBox).toList());
  }
}

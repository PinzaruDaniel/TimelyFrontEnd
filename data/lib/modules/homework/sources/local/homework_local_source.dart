import 'package:data/mapper/homework_mapper.dart';
import 'package:data/modules/homework/models/local/homework_box.dart';
import 'package:domain/modules/homework/models/index.dart';
import 'package:objectbox/objectbox.dart';

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

    var homework = await homeworkBox.getAllAsync();
    for (final h in homework) {
      print('ID: ${h.homeworkId}');
      print('Subject: ${h.subject}');
      print('Description: ${h.description}');
      print('Due date: ${h.dueDate}');
      print('Image: ${h.imageUrl ?? 'no image'}');
      print('---------------------------');
    }
  }
}

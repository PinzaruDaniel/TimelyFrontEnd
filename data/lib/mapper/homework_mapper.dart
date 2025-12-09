import 'package:data/modules/homework/models/local/homework_box.dart';
import 'package:data/modules/homework/models/remote/index.dart';
import 'package:domain/modules/homework/models/index.dart';

extension HomeworkToEntityMapper on HomeworkApiDto {
  HomeworkEntity get toEntity {
    return HomeworkEntity(
      homeworkId: homeworkId,
      subject: subject,
      description: description,
      dueDate: dueDate,
      imageUrl: imageUrl,
    );
  }
}

extension HomeworkToBoxMapper on HomeworkEntity {
  HomeworkBox get toBox {
    return HomeworkBox(
      homeworkId: homeworkId,
      subject: subject,
      description: description,
      dueDate: dueDate,
      imageUrl: imageUrl,
    );
  }
}

extension HomeworkBoxToEntityMapper on HomeworkBox {
  HomeworkEntity get toEntity {
    return HomeworkEntity(homeworkId: homeworkId, subject: subject, description: description, dueDate: dueDate);
  }
}

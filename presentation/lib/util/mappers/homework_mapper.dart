import 'package:domain/modules/homework/models/index.dart';
import 'package:presentation/view_models/homework_view_model.dart';

extension HomeworkToModelMapper on HomeworkEntity {
  HomeworkViewModel get toModel {
    return HomeworkViewModel(homeworkId: homeworkId, subject: subject, description: description, dueDate: dueDate, imageUrl: imageUrl);
  }
}


import 'package:objectbox/objectbox.dart';

@Entity()
class HomeworkBox {
  @Id(assignable: true)
  int id;
  String homeworkId;
  String subject;
  String description;
  DateTime dueDate;
  String? imageUrl;

  HomeworkBox({
    this.id = 0,
    required this.homeworkId,
    required this.subject,
    required this.description,
    required this.dueDate,
    required this.imageUrl,
  });
}

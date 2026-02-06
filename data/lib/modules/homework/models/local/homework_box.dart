import 'package:objectbox/objectbox.dart';

@Entity()
class HomeworkBox {
  @Id()
  int id = 0;

  @Unique()
  String homeworkId;

  String subject;
  String description;

  @Property(type: PropertyType.date)
  DateTime dueDate;

  String? imageUrl;

  HomeworkBox({
    required this.homeworkId,
    required this.subject,
    required this.description,
    required this.dueDate,
    this.imageUrl,
  });
}
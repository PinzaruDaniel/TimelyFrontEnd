

import 'package:objectbox/objectbox.dart';

@Entity()
class ScheduleItemBox {
  @Id()
  int id;
  String time;
  String subject;
  String? teacher;
  String? room;
  String period;

  ScheduleItemBox({
    this.id = 0,
    required this.time,
    required this.subject,
    this.teacher,
    this.room,
    required this.period,
  });
}


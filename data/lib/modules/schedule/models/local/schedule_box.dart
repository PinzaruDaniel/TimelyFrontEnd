import 'package:data/modules/schedule/models/local/schedule_item_box.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ScheduleBox {
  @Id()
  int id;
  String group;
  String groupId;
  final monday = ToMany<ScheduleItemBox>();
  final tuesday = ToMany<ScheduleItemBox>();
  final wednesday = ToMany<ScheduleItemBox>();
  final thursday = ToMany<ScheduleItemBox>();
  final friday = ToMany<ScheduleItemBox>();

  ScheduleBox({this.id = 0, required this.groupId, required this.group});
}

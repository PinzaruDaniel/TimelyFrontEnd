import 'package:presentation/view_models/schedule_item_view_model.dart';

class ScheduleViewModel {
  final String group;
  final String groupId;
  final List<ScheduleItemViewModel> monday;
  final List<ScheduleItemViewModel> tuesday;
  final List<ScheduleItemViewModel> wednesday;
  final List<ScheduleItemViewModel> thursday;
  final List<ScheduleItemViewModel> friday;

  ScheduleViewModel({
    required this.group,
    required this.groupId,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
  });
}
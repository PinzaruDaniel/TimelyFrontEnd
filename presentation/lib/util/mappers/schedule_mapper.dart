import 'package:domain/modules/schedule/models/index.dart';
import 'package:presentation/view_models/schedule_item_view_model.dart';
import 'package:presentation/view_models/schedule_view_model.dart';

extension ScheduleToModelMapper on ScheduleEntity {
  ScheduleViewModel get toModel {
    return ScheduleViewModel(
      group: group,
      groupId: groupId,
      monday: monday.map((e) => e.toModel).toList(),
      tuesday: tuesday.map((e) => e.toModel).toList(),
      wednesday: wednesday.map((e) => e.toModel).toList(),
      thursday: thursday.map((e) => e.toModel).toList(),
      friday: friday.map((e) => e.toModel).toList(),
    );
  }
}

extension ScheduleItemToModelMapper on ScheduleItemEntity {
  ScheduleItemViewModel get toModel {
    return ScheduleItemViewModel(time: time, subject: subject, period: period, teacher: teacher, room: room);
  }
}

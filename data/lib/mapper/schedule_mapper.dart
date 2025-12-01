import 'package:data/modules/schedule/models/remote/index.dart';
import 'package:domain/modules/schedule/models/index.dart';

extension ScheduleToEntityMapper on ScheduleApiDto {
  ScheduleEntity get toEntity {
    return ScheduleEntity(
      group: group,
      groupId: groupId,
      monday: monday.map((e) => e.toEntity).toList(),
      tuesday: tuesday.map((e) => e.toEntity).toList(),
      wednesday: wednesday.map((e) => e.toEntity).toList(),
      thursday: thursday.map((e) => e.toEntity).toList(),
      friday: friday.map((e) => e.toEntity).toList(),
    );
  }
}

extension ScheduleItemToEntityMapper on ScheduleItemDto {
  ScheduleItemEntity get toEntity {
    return ScheduleItemEntity(time: time, subject: subject, teacher: teacher, room: room, period: period);
  }
}

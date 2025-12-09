import 'package:data/modules/schedule/models/local/schedule_box.dart';
import 'package:data/modules/schedule/models/remote/index.dart';
import 'package:domain/modules/schedule/models/index.dart';

import '../modules/schedule/models/local/schedule_item_box.dart';

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

extension ScheduleToBoxMapper on ScheduleEntity {
  ScheduleBox get toBox {
    final box = ScheduleBox(groupId: groupId, group: group);

    box.monday.addAll(
      monday.map(
        (e) => ScheduleItemBox(time: e.time, subject: e.subject, teacher: e.teacher, room: e.room, period: e.period),
      ),
    );

    box.tuesday.addAll(
      tuesday.map(
        (e) => ScheduleItemBox(time: e.time, subject: e.subject, teacher: e.teacher, room: e.room, period: e.period),
      ),
    );

    box.wednesday.addAll(
      wednesday.map(
        (e) => ScheduleItemBox(time: e.time, subject: e.subject, teacher: e.teacher, room: e.room, period: e.period),
      ),
    );

    box.thursday.addAll(
      thursday.map(
        (e) => ScheduleItemBox(time: e.time, subject: e.subject, teacher: e.teacher, room: e.room, period: e.period),
      ),
    );

    box.friday.addAll(
      friday.map(
        (e) => ScheduleItemBox(time: e.time, subject: e.subject, teacher: e.teacher, room: e.room, period: e.period),
      ),
    );

    return box;
  }
}

extension ScheduleBoxToEntityMapper on ScheduleBox {
  ScheduleEntity get toEntity {
    return ScheduleEntity(
      groupId: groupId,
      group: group,
      monday: monday
          .map(
            (e) => ScheduleItemEntity(
              time: e.time,
              subject: e.subject,
              teacher: e.teacher,
              room: e.room,
              period: e.period,
            ),
          )
          .toList(),
      tuesday: tuesday
          .map(
            (e) => ScheduleItemEntity(
              time: e.time,
              subject: e.subject,
              teacher: e.teacher,
              room: e.room,
              period: e.period,
            ),
          )
          .toList(),
      wednesday: wednesday
          .map(
            (e) => ScheduleItemEntity(
              time: e.time,
              subject: e.subject,
              teacher: e.teacher,
              room: e.room,
              period: e.period,
            ),
          )
          .toList(),
      thursday: thursday
          .map(
            (e) => ScheduleItemEntity(
              time: e.time,
              subject: e.subject,
              teacher: e.teacher,
              room: e.room,
              period: e.period,
            ),
          )
          .toList(),
      friday: friday
          .map(
            (e) => ScheduleItemEntity(
              time: e.time,
              subject: e.subject,
              teacher: e.teacher,
              room: e.room,
              period: e.period,
            ),
          )
          .toList(),
    );
  }
}

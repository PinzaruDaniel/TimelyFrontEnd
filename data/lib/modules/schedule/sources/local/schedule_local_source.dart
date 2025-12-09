import 'package:data/modules/schedule/models/local/schedule_box.dart';
import 'package:domain/modules/schedule/models/index.dart';

import '../../../../objectbox.g.dart';
import '../../models/local/schedule_item_box.dart';

abstract class ScheduleLocalSource {
  Future<void> setSchedule(ScheduleEntity schedule);

  Future<ScheduleBox> getScheduleFromCache(String groupId);
}

class ScheduleLocalSourceImpl implements ScheduleLocalSource {
  Box<ScheduleBox> scheduleBox;
  Box<ScheduleItemBox> scheduleItemBox;

  ScheduleLocalSourceImpl({required this.scheduleBox, required this.scheduleItemBox});

  @override
  Future<ScheduleBox> getScheduleFromCache(String groupId) async {
    final query = scheduleBox.query(ScheduleBox_.groupId.equals(groupId)).build();
    final result = query.findFirst();
    query.close();

    if (result == null) {
      throw Exception("No cached schedule found for group $groupId");
    }
    return result;
  }

  @override
  Future<void> setSchedule(ScheduleEntity schedule) async {
    final existingQuery = scheduleBox.query(ScheduleBox_.groupId.equals(schedule.groupId)).build();
    final existing = existingQuery.find();
    existingQuery.close();
    if (existing.isNotEmpty) {
      await scheduleBox.removeManyAsync(existing.map((e) => e.id).toList());
    }

    final scheduleDb = ScheduleBox(groupId: schedule.groupId, group: schedule.group);

    scheduleDb.monday.addAll(
      schedule.monday.map(
        (e) => ScheduleItemBox(time: e.time, subject: e.subject, teacher: e.teacher, room: e.room, period: e.period),
      ),
    );

    scheduleDb.tuesday.addAll(
      schedule.tuesday.map(
        (e) => ScheduleItemBox(time: e.time, subject: e.subject, teacher: e.teacher, room: e.room, period: e.period),
      ),
    );

    scheduleDb.wednesday.addAll(
      schedule.wednesday.map(
        (e) => ScheduleItemBox(time: e.time, subject: e.subject, teacher: e.teacher, room: e.room, period: e.period),
      ),
    );

    scheduleDb.thursday.addAll(
      schedule.thursday.map(
        (e) => ScheduleItemBox(time: e.time, subject: e.subject, teacher: e.teacher, room: e.room, period: e.period),
      ),
    );

    scheduleDb.friday.addAll(
      schedule.friday.map(
        (e) => ScheduleItemBox(time: e.time, subject: e.subject, teacher: e.teacher, room: e.room, period: e.period),
      ),
    );

    await scheduleBox.putAsync(scheduleDb);
  }
}

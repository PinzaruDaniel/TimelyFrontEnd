import 'package:data/modules/schedule/models/local/schedule_box.dart';
import '../../../../objectbox.g.dart';
import '../../models/local/schedule_item_box.dart';

abstract class ScheduleLocalSource {
  Future<void> setSchedule(ScheduleBox schedule);

  Future<ScheduleBox> getScheduleFromCache(String groupId);
}

class ScheduleLocalSourceImpl implements ScheduleLocalSource {
  Box<ScheduleBox> scheduleBox;
  Box<ScheduleItemBox> scheduleItemBox;

  ScheduleLocalSourceImpl({
    required this.scheduleBox,
    required this.scheduleItemBox,
  });

  @override
  Future<ScheduleBox> getScheduleFromCache(String groupId) async {
    final query = scheduleBox
        .query(ScheduleBox_.groupId.equals(groupId))
        .build();
    final result = query.findFirst();
    query.close();

    if (result == null) {
      throw Exception("No cached schedule found for group $groupId");
    }
    return result;
  }

  @override
  Future<void> setSchedule(ScheduleBox schedule) async {
    final existingQuery = scheduleBox
        .query(ScheduleBox_.groupId.equals(schedule.groupId))
        .build();
    final existing = existingQuery.find();
    existingQuery.close();
    if (existing.isNotEmpty) {
      await scheduleBox.removeManyAsync(existing.map((e) => e.id).toList());
    }

    await scheduleBox.putAsync(schedule);
  }
}

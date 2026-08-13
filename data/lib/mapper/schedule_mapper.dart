import 'package:data/modules/schedule/models/local/schedule_box.dart';
import 'package:data/modules/schedule/models/local/schedule_item_box.dart';
import 'package:data/modules/schedule/models/remote/index.dart';
import 'package:domain/modules/schedule/models/index.dart';
import 'package:smart_mapper/smart_mapper.dart';

part 'schedule_mapper.g.dart';

@SmartMapper()
abstract class ScheduleMapper {
  ScheduleEntity fromRemote(ScheduleApiDto source);

  ScheduleItemEntity itemFromRemote(ScheduleItemDto source);

  ScheduleBox toLocal(ScheduleEntity source);

  ScheduleItemBox itemToLocal(ScheduleItemEntity source);

  ScheduleEntity fromLocal(ScheduleBox source);

  ScheduleItemEntity itemFromLocal(ScheduleItemBox source);
}

final _scheduleMapper = createScheduleMapper();

extension ScheduleToEntityMapper on ScheduleApiDto {
  ScheduleEntity get toEntity => _scheduleMapper.fromRemote(this);
}

extension ScheduleItemToEntityMapper on ScheduleItemDto {
  ScheduleItemEntity get toEntity => _scheduleMapper.itemFromRemote(this);
}

extension ScheduleToBoxMapper on ScheduleEntity {
  ScheduleBox get toBox => _scheduleMapper.toLocal(this);
}

extension ScheduleBoxToEntityMapper on ScheduleBox {
  ScheduleEntity get toEntity => _scheduleMapper.fromLocal(this);
}

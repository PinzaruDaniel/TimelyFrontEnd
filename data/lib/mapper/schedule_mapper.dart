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

  @MapIgnore('id')
  @MapRelation(target: 'monday', source: 'monday', using: 'itemToLocal')
  @MapRelation(target: 'tuesday', source: 'tuesday', using: 'itemToLocal')
  @MapRelation(target: 'wednesday', source: 'wednesday', using: 'itemToLocal')
  @MapRelation(target: 'thursday', source: 'thursday', using: 'itemToLocal')
  @MapRelation(target: 'friday', source: 'friday', using: 'itemToLocal')
  ScheduleBox toLocal(ScheduleEntity source);

  @MapIgnore('id')
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

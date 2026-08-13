// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_mapper.dart';

// **************************************************************************
// SmartMapperGenerator
// **************************************************************************

class _$ScheduleMapper implements ScheduleMapper {
  const _$ScheduleMapper();
  @override
  ScheduleEntity fromRemote(ScheduleApiDto source) {
    return ScheduleEntity(
      group: source.group,
      groupId: source.groupId,
      monday: source.monday.map(itemFromRemote).toList(),
      tuesday: source.tuesday.map(itemFromRemote).toList(),
      wednesday: source.wednesday.map(itemFromRemote).toList(),
      thursday: source.thursday.map(itemFromRemote).toList(),
      friday: source.friday.map(itemFromRemote).toList(),
    );
  }

  @override
  ScheduleItemEntity itemFromRemote(ScheduleItemDto source) {
    return ScheduleItemEntity(
      time: source.time,
      subject: source.subject,
      teacher: source.teacher,
      room: source.room,
      period: source.period,
    );
  }

  @override
  ScheduleBox toLocal(ScheduleEntity source) {
    final target = ScheduleBox(groupId: source.groupId, group: source.group);
    target.monday.addAll(source.monday.map(itemToLocal));
    target.tuesday.addAll(source.tuesday.map(itemToLocal));
    target.wednesday.addAll(source.wednesday.map(itemToLocal));
    target.thursday.addAll(source.thursday.map(itemToLocal));
    target.friday.addAll(source.friday.map(itemToLocal));
    return target;
  }

  @override
  ScheduleItemBox itemToLocal(ScheduleItemEntity source) {
    return ScheduleItemBox(
      time: source.time,
      subject: source.subject,
      teacher: source.teacher,
      room: source.room,
      period: source.period,
    );
  }

  @override
  ScheduleEntity fromLocal(ScheduleBox source) {
    return ScheduleEntity(
      group: source.group,
      groupId: source.groupId,
      monday: source.monday.map(itemFromLocal).toList(),
      tuesday: source.tuesday.map(itemFromLocal).toList(),
      wednesday: source.wednesday.map(itemFromLocal).toList(),
      thursday: source.thursday.map(itemFromLocal).toList(),
      friday: source.friday.map(itemFromLocal).toList(),
    );
  }

  @override
  ScheduleItemEntity itemFromLocal(ScheduleItemBox source) {
    return ScheduleItemEntity(
      time: source.time,
      subject: source.subject,
      teacher: source.teacher,
      room: source.room,
      period: source.period,
    );
  }
}

ScheduleMapper createScheduleMapper() => const _$ScheduleMapper();

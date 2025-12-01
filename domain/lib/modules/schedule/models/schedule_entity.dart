part of 'index.dart';
@freezed
abstract class ScheduleEntity with _$ScheduleEntity {
  const factory ScheduleEntity({
    required String group,
    required String groupId,
    required  List<ScheduleItemEntity> monday,
    required  List<ScheduleItemEntity> tuesday,
    required  List<ScheduleItemEntity> wednesday,
    required  List<ScheduleItemEntity> thursday,
    required  List<ScheduleItemEntity> friday,

  }) = _ScheduleEntity;
}
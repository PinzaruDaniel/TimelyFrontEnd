part of 'index.dart';
@freezed
abstract class ScheduleEntity with _$ScheduleEntity {
  const factory ScheduleEntity({
    required String group,
    required Uuid groupId,
    Map<String, List<ScheduleItemEntity>>? schedule,
  }) = _ScheduleEntity;
}
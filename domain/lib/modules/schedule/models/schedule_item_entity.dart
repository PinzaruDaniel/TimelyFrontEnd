part of 'index.dart';
@freezed
abstract class ScheduleItemEntity with _$ScheduleItemEntity {
  const factory ScheduleItemEntity({
    required String time,
    required String subject,
     String? teacher,
     String? room,
    required String period,
  }) = _ScheduleItemEntity;

  factory ScheduleItemEntity.fromJson(Map<String, dynamic> json) =>
      _$ScheduleItemEntityFromJson(json);
}
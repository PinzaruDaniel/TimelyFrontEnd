part of 'index.dart';
@freezed
abstract class ScheduleItemDto with _$ScheduleItemDto {
  const factory ScheduleItemDto({
    required String time,
    required String subject,
     String? teacher,
     String? room,
    required String period,
  }) = _ScheduleItemDto;

  factory ScheduleItemDto.fromJson(Map<String, dynamic> json) =>
      _$ScheduleItemDtoFromJson(json);
}
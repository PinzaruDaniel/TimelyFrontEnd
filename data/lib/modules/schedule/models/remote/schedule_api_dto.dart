part of 'index.dart';

@freezed
abstract class ScheduleApiDto with _$ScheduleApiDto {
  const factory ScheduleApiDto({
    required String group,
    required Uuid groupId,
    Map<String, List<ScheduleItemDto>>? schedule,
  }) = _ScheduleApiDto;

  factory ScheduleApiDto.fromJson(Map<String, dynamic> json) {
    final scheduleMap = <String, List<ScheduleItemDto>>{};

    json.forEach((key, value) {
      if (value is List) {
        scheduleMap[key] = value.map((e) => ScheduleItemDto.fromJson(e as Map<String, dynamic>)).toList();
      }
    });

    return ScheduleApiDto(group: json['group'], groupId: json['groupId'], schedule: scheduleMap);
  }
}

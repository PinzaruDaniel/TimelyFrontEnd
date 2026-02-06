
part of 'index.dart';


@freezed
abstract class ScheduleApiDto with _$ScheduleApiDto {
  const factory ScheduleApiDto({
    required String group,
    required String groupId,
    @JsonKey(name: 'Luni')
    required List<ScheduleItemDto> monday,
    @JsonKey(name: 'Marti')
    required List<ScheduleItemDto> tuesday,
    @JsonKey(name: 'Miercuri')

    required List<ScheduleItemDto> wednesday,
    @JsonKey(name: 'Joi')

    required List<ScheduleItemDto> thursday,
    @JsonKey(name: 'Vineri')

    required List<ScheduleItemDto> friday,

  }) = _ScheduleApiDto;

  factory ScheduleApiDto.fromJson(Map<String, dynamic> json) => _$ScheduleApiDtoFromJson(json);
}


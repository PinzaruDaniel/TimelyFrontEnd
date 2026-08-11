part of 'index.dart';

@freezed
abstract class UserProfileApiDto with _$UserProfileApiDto {
  factory UserProfileApiDto({
    @Default('') String id,
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String groupId,
    @Default('') String groupName,
    @Default('') String message,
  }) = _UserProfileApiDto;
  factory UserProfileApiDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileApiDtoFromJson(json);
}

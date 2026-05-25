part of 'index.dart';

@freezed
abstract class UserProfileApiDto with _$UserProfileApiDto {
  factory UserProfileApiDto({
    required String id,
    required String fullName,
    required String email,
    required String groupId,
  }) = _UserProfileApiDto;
  factory UserProfileApiDto.fromJson(Map<String, dynamic> json) => _$UserProfileApiDtoFromJson(json);
}

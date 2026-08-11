part of 'index.dart';

@freezed
abstract class UserProfileEntity with _$UserProfileEntity {
  factory UserProfileEntity({
    required String id,
    required String fullName,
    required String email,
    required String groupId,
    required String groupName,
    @Default('') String message,
  }) = _UserProfileEntity;
}

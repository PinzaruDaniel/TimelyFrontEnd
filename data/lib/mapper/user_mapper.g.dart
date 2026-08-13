// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mapper.dart';

// **************************************************************************
// SmartMapperGenerator
// **************************************************************************

class _$UserMapper implements UserMapper {
  const _$UserMapper();
  @override
  UserProfileEntity fromRemote(UserProfileApiDto source) {
    return UserProfileEntity(
      id: source.id,
      fullName: source.fullName,
      email: source.email,
      groupId: source.groupId,
      groupName: source.groupName,
    );
  }
}

UserMapper createUserMapper() => const _$UserMapper();

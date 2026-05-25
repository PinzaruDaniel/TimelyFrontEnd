import 'package:data/modules/user/models/remote/index.dart';
import 'package:domain/modules/user/models/index.dart';

extension UserMapperToEntity on UserProfileApiDto{
  UserProfileEntity get toEntity => UserProfileEntity(id: id, fullName: fullName, email: email, groupId: groupId);
}
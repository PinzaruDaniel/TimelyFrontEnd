import 'package:data/modules/user/models/remote/index.dart';
import 'package:domain/modules/user/models/index.dart';

extension UserMapperToEntity on UserProfileApiDto {
  UserProfileEntity get toEntity => UserProfileEntity(
    id: id.isNotEmpty ? id : email,
    fullName: fullName.isNotEmpty ? fullName : email.split('@').first,
    email: email,
    groupId: groupId,
    groupName: groupName,
    message: message,
  );
}

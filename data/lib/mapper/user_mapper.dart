import 'package:data/modules/user/models/remote/index.dart';
import 'package:domain/modules/user/models/index.dart';
import 'package:smart_mapper/smart_mapper.dart';

part 'user_mapper.g.dart';

@SmartMapper()
abstract class UserMapper {
  UserProfileEntity fromRemote(UserProfileApiDto source);
}

final _userMapper = createUserMapper();

extension UserMapperToEntity on UserProfileApiDto {
  UserProfileEntity get toEntity => _userMapper.fromRemote(this);
}

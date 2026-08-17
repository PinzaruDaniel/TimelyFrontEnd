import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/user/models/index.dart';
import 'package:smart_domain/smart_domain.dart' show Result;

abstract class UserRepository {
  Future<Result<UserProfileEntity, Failure>> getMyProfile();

  Future<Result<List<UserProfileEntity>, Failure>> getUsersByGroup(
    String groupId,
  );
}

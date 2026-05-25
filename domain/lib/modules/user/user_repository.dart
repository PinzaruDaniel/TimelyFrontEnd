import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/user/models/index.dart';

abstract class UserRepository {
  Future<Either<Failure, UserProfileEntity>> getMyProfile();

  Future<Either<Failure, List<UserProfileEntity>>> getUsersByGroup(String groupId);
}
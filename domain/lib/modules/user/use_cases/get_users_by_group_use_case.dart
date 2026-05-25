import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/user/models/index.dart';
import 'package:domain/modules/user/user_repository.dart';

class GetUsersByGroupUseCase extends UseCase<List<UserProfileEntity>, GetUsersByGroupParams> {
  final UserRepository repository;

  GetUsersByGroupUseCase({required this.repository});

  @override
  Future<Either<Failure, List<UserProfileEntity>>> call(GetUsersByGroupParams params) {
    return repository.getUsersByGroup(params.groupId);
  }
}

class GetUsersByGroupParams {
  final String groupId;

  GetUsersByGroupParams({required this.groupId});
}

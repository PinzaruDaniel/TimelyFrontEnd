import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/user/models/index.dart';
import 'package:domain/modules/user/user_repository.dart';

class GetUserProfileUseCase extends UseCaseNoParams<UserProfileEntity> {
  final UserRepository repository;

  GetUserProfileUseCase({required this.repository});

  @override
  Future<Either<Failure, UserProfileEntity>> call() {
    return repository.getMyProfile();
  }
}

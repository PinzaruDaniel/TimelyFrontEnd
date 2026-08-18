import 'package:common/constants/failure_class.dart';
import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/user/models/index.dart';
import 'package:domain/modules/user/user_repository.dart';

class GetUserProfileUseCase extends NoParamsUseCase<UserProfileEntity> {
  final UserRepository repository;

  GetUserProfileUseCase({required this.repository});

  @override
  Future<Result<UserProfileEntity, Failure>> execute() {
    return repository.getMyProfile();
  }
}

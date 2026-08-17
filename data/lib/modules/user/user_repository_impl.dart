import 'package:common/constants/failure_class.dart';
import 'package:data/core/app_failure_mapper.dart';
import 'package:data/mapper/user_mapper.dart';
import 'package:data/modules/user/sources/remote/user_api_service.dart';
import 'package:domain/modules/user/models/index.dart';
import 'package:domain/modules/user/user_repository.dart';
import 'package:smart_domain/smart_domain.dart' show Result;

class UserRepositoryImpl implements UserRepository {
  final UserApiService apiService;

  UserRepositoryImpl({required this.apiService});

  @override
  Future<Result<UserProfileEntity, Failure>> getMyProfile() {
    return Result.guardAsync(() async {
      var response = await apiService.getMyProfile();
      return response.toEntity;
    }, onError: appFailureMapper.map);
  }

  @override
  Future<Result<List<UserProfileEntity>, Failure>> getUsersByGroup(
    String groupId,
  ) {
    return Result.guardAsync(() async {
      final response = await apiService.getUsersByGroup(groupId);
      return response.map((dto) => dto.toEntity).toList();
    }, onError: appFailureMapper.map);
  }
}

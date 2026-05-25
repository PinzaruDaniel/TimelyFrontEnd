import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:data/mapper/user_mapper.dart';
import 'package:data/modules/user/sources/remote/user_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/user/models/index.dart';
import 'package:domain/modules/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService apiService;

  UserRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, UserProfileEntity>> getMyProfile() async {
    try {
      var response = await apiService.getMyProfile();
      return Right(response.toEntity);
    } catch (e, stackTrace) {
      print('error in getMyProfile() :${e} $stackTrace');
      if (e is DioException) {

        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<UserProfileEntity>>> getUsersByGroup(String groupId) async {
    try {
      final response = await apiService.getUsersByGroup(groupId);
      return Right(response.map((dto) => dto.toEntity).toList());
    } catch (e, stackTrace) {
      print('error in getUsersByGroup() :${e} $stackTrace');
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }
}
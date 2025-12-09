import 'package:common/constants/failure_class.dart';
import 'package:common/constants/post_classes.dart';
import 'package:dartz/dartz.dart';
import 'package:data/mapper/homework_mapper.dart';
import 'package:data/modules/homework/sources/local/homework_local_source.dart';
import 'package:data/modules/homework/sources/remote/homework_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/homework/homework_repository.dart';
import 'package:domain/modules/homework/models/index.dart';

class HomeworkRepositoryImpl implements HomeworkRepository {
  final HomeworkApiService apiService;
  final HomeworkLocalSource localSource;

  HomeworkRepositoryImpl({required this.apiService, required this.localSource});

  @override
  Future<Either<Failure, HomeworkEntity>> addHomework(CreateHomeworkRequest request) async {
    try {
      final response = await apiService.addHomework(await request.toFormData());
      return Right(response.toEntity);
    } catch (e, stackTrace) {
      print('Homework POST API failed: $e  ${e.runtimeType}');
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<HomeworkEntity>>> getHomeworks(String groupId) async {
    try {
      final response = await apiService.getHomeworks(groupId);
      return Right(response.map((e) => e.toEntity).toList());
    } catch (e, stackTrace) {
      print('Homework GET API failed: $e  ${e.runtimeType}');
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Stream<List<HomeworkEntity>> getHomeworksFromCache() {
    return localSource.getHomeworkFromCache().map((e) => e.map((homework) => homework.toEntity).toList());
  }

  @override
  Future<void> setHomework(List<HomeworkEntity> homeworks) {
    return localSource.setHomework(homeworks);
  }
}

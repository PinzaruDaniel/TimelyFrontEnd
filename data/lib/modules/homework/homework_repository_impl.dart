import 'package:common/constants/failure_class.dart';
import 'package:common/constants/post_classes.dart';
import 'package:data/core/app_failure_mapper.dart';
import 'package:data/mapper/homework_mapper.dart';
import 'package:data/modules/homework/sources/local/homework_local_source.dart';
import 'package:data/modules/homework/sources/remote/homework_api_service.dart';
import 'package:domain/modules/homework/homework_repository.dart';
import 'package:domain/modules/homework/models/index.dart';
import 'package:smart_domain/smart_domain.dart' show Result;

class HomeworkRepositoryImpl implements HomeworkRepository {
  final HomeworkApiService apiService;
  final HomeworkLocalSource localSource;

  HomeworkRepositoryImpl({required this.apiService, required this.localSource});

  @override
  Future<Result<HomeworkEntity, Failure>> addHomework(
    CreateHomeworkRequest request,
  ) {
    return Result.guardAsync(() async {
      final response = await apiService.addHomework(
        groupId: request.groupId,
        subject: request.subject,
        description: request.description,
        dueDate: request.dueDateFormatted, // see below
        imageFile: request.imageFile,
      );
      return response.toEntity;
    }, onError: appFailureMapper.map);
  }

  @override
  Future<Result<List<HomeworkEntity>, Failure>> getHomeworks(String groupId) {
    return Result.guardAsync(() async {
      final response = await apiService.getHomeworks(groupId);
      return response.map((e) => e.toEntity).toList();
    }, onError: appFailureMapper.map);
  }

  @override
  Stream<List<HomeworkEntity>> getHomeworksFromCache() {
    return localSource.getHomeworkFromCache().map(
      (e) => e.map((homework) => homework.toEntity).toList(),
    );
  }

  @override
  Future<void> setHomework(List<HomeworkEntity> homeworks) {
    return localSource.setHomework(homeworks);
  }
}

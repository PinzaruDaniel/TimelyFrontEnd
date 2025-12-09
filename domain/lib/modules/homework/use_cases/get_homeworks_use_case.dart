import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/homework/homework_repository.dart';
import 'package:domain/modules/homework/models/index.dart';

class GetHomeworksUseCase extends UseCase<List<HomeworkEntity>, GetHomeworksParams> {
  final HomeworkRepository repository;

  GetHomeworksUseCase({required this.repository});

  @override
  Future<Either<Failure, List<HomeworkEntity>>> call(GetHomeworksParams params) {
    return repository.getHomeworks(params.groupId);
  }
}

class GetHomeworksParams {
  final String groupId;

  GetHomeworksParams({required this.groupId});
}

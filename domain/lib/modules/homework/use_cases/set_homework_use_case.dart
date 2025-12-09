import 'package:domain/core/usecase.dart';
import 'package:domain/modules/homework/homework_repository.dart';
import 'package:domain/modules/homework/models/index.dart';

class SetHomeworkUseCase extends UseCaseNoEither<void, SetHomeworkParams> {
  final HomeworkRepository repository;

  SetHomeworkUseCase({required this.repository});

  @override
  Future<void> call(SetHomeworkParams params) async {
    repository.setHomework(params.homeworksEntity);
  }
}

class SetHomeworkParams {
  final List<HomeworkEntity> homeworksEntity;

  SetHomeworkParams({required this.homeworksEntity});
}

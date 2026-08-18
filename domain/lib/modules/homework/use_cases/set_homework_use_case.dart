import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/homework/homework_repository.dart';
import 'package:domain/modules/homework/models/index.dart';

class SetHomeworkUseCase extends FutureUseCase<void, SetHomeworkParams> {
  final HomeworkRepository repository;

  SetHomeworkUseCase({required this.repository});

  @override
  Future<void> execute(SetHomeworkParams params) async {
    repository.setHomework(params.homeworksEntity);
  }
}

class SetHomeworkParams {
  final List<HomeworkEntity> homeworksEntity;

  SetHomeworkParams({required this.homeworksEntity});
}

import 'package:common/constants/failure_class.dart';
import 'package:common/constants/post_classes.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/homework/homework_repository.dart';
import 'package:domain/modules/homework/models/index.dart';

class AddHomeworkUseCase extends UseCase<HomeworkEntity, AddHomeworkParams> {
  final HomeworkRepository repository;

  AddHomeworkUseCase({required this.repository});

  @override
  Future<Result<HomeworkEntity, Failure>> execute(AddHomeworkParams params) {
    return repository.addHomework(params.request);
  }
}

class AddHomeworkParams {
  final CreateHomeworkRequest request;

  AddHomeworkParams({required this.request});
}

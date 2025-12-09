import 'package:domain/core/usecase.dart';
import 'package:domain/modules/homework/homework_repository.dart';
import 'package:domain/modules/homework/models/index.dart';

class GetHomeworksFromCacheUseCase extends UseCaseNoEitherNoParams<List<HomeworkEntity>> {
  final HomeworkRepository repository;

  GetHomeworksFromCacheUseCase({required this.repository});

  @override
  Stream<List<HomeworkEntity>> call() {
    return repository.getHomeworksFromCache();
  }
}

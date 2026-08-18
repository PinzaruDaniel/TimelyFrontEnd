import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/homework/homework_repository.dart';
import 'package:domain/modules/homework/models/index.dart';

class GetHomeworksFromCacheUseCase
    extends NoParamsValueStreamUseCase<List<HomeworkEntity>> {
  final HomeworkRepository repository;

  GetHomeworksFromCacheUseCase({required this.repository});

  @override
  Stream<List<HomeworkEntity>> execute() {
    return repository.getHomeworksFromCache();
  }
}

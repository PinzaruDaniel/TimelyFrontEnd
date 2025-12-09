import 'package:domain/modules/homework/homework_repository.dart';
import 'package:domain/modules/homework/use_cases/add_homework_use_case.dart';
import 'package:domain/modules/homework/use_cases/get_homeworks_from_cache_use_case.dart';
import 'package:domain/modules/homework/use_cases/get_homeworks_use_case.dart';
import 'package:domain/modules/homework/use_cases/set_homework_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<AddHomeworkUseCase>(() => AddHomeworkUseCase(repository: dataDi<HomeworkRepository>()));

  dataDi.registerLazySingleton<GetHomeworksUseCase>(
    () => GetHomeworksUseCase(repository: dataDi<HomeworkRepository>()),
  );

  dataDi.registerLazySingleton<SetHomeworkUseCase>(() => SetHomeworkUseCase(repository: dataDi<HomeworkRepository>()));

  dataDi.registerLazySingleton<GetHomeworksFromCacheUseCase>(
    () => GetHomeworksFromCacheUseCase(repository: dataDi<HomeworkRepository>()),
  );
}

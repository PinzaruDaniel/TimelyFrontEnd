import 'package:domain/modules/schedule/schedule_repository.dart';
import 'package:domain/modules/schedule/use_cases/get_schedule_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<GetScheduleUseCase>(() => GetScheduleUseCase(repository: dataDi<ScheduleRepository>()));
}

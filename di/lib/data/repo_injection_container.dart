import 'package:data/modules/schedule/schedule_repository_impl.dart';
import 'package:data/modules/schedule/sources/schedule_api_service.dart';
import 'package:domain/modules/schedule/schedule_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<ScheduleRepository>(
    () => ScheduleRepositoryImpl(apiService: dataDi<ScheduleApiService>()),
  );
}

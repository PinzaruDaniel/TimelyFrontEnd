import 'package:data/core/objectbox_store.dart';
import 'package:data/modules/homework/sources/local/homework_local_source.dart';
import 'package:data/modules/schedule/sources/local/schedule_local_source.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  final store = await ObjectBoxStore.create();
  dataDi.registerLazySingleton<HomeworkLocalSource>(() => HomeworkLocalSourceImpl(homeworkBox: store.homeworkBox));

  dataDi.registerLazySingleton<ScheduleLocalSource>(
    () => ScheduleLocalSourceImpl(scheduleBox: store.scheduleBox, scheduleItemBox: store.scheduleItemBox),
  );
}

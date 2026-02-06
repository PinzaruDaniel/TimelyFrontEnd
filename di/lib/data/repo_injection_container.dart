import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/modules/chat/chat_repository_impl.dart';
import 'package:data/modules/chat/sources/remote/firebase_chat_data_source.dart';
import 'package:data/modules/homework/homework_repository_impl.dart';
import 'package:data/modules/homework/sources/local/homework_local_source.dart';
import 'package:data/modules/homework/sources/remote/homework_api_service.dart';
import 'package:data/modules/schedule/schedule_repository_impl.dart';
import 'package:data/modules/schedule/sources/local/schedule_local_source.dart';
import 'package:data/modules/schedule/sources/remote/schedule_api_service.dart';
import 'package:domain/modules/chat/chat_repository.dart';
import 'package:domain/modules/homework/homework_repository.dart';
import 'package:domain/modules/schedule/schedule_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<ScheduleRepository>(
        () =>
        ScheduleRepositoryImpl(apiService: dataDi<ScheduleApiService>(), localSource: dataDi<ScheduleLocalSource>()),
  );
  dataDi.registerLazySingleton<HomeworkRepository>(
        () =>
        HomeworkRepositoryImpl(apiService: dataDi<HomeworkApiService>(), localSource: dataDi<HomeworkLocalSource>()),
  );
  dataDi.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  dataDi.registerLazySingleton<FirebaseChatDataSource>(() =>
      FirebaseChatDataSourceImpl(firestore: dataDi <FirebaseFirestore>()));

  dataDi.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(dataSource: dataDi<FirebaseChatDataSource>()));

}

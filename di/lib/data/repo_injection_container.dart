import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/modules/auth/auth_repository_impl.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:data/modules/chat/chat_repository_impl.dart';
import 'package:data/modules/chat/sources/remote/firebase_chat_data_source.dart';
import 'package:data/modules/homework/homework_repository_impl.dart';
import 'package:data/modules/homework/sources/local/homework_local_source.dart';
import 'package:data/modules/homework/sources/remote/homework_api_service.dart';
import 'package:data/modules/schedule/schedule_repository_impl.dart';
import 'package:data/modules/schedule/sources/local/schedule_local_source.dart';
import 'package:data/modules/schedule/sources/remote/schedule_api_service.dart';
import 'package:data/modules/user/sources/remote/user_api_service.dart';
import 'package:data/modules/user/user_repository_impl.dart';
import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/chat/chat_repository.dart';
import 'package:domain/modules/homework/homework_repository.dart';
import 'package:domain/modules/schedule/schedule_repository.dart';
import 'package:domain/modules/user/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:data/modules/messaging/messaging_repository_impl.dart';
import 'package:data/modules/messaging/sources/remote/firebase_messaging_data_source.dart';
import 'package:domain/modules/messaging/messaging_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(apiService: dataDi<AuthApiService>(), localSource: dataDi<AuthLocalSource>()),
  );

  dataDi.registerLazySingleton<ScheduleRepository>(
    () => ScheduleRepositoryImpl(apiService: dataDi<ScheduleApiService>(), localSource: dataDi<ScheduleLocalSource>()),
  );
  dataDi.registerLazySingleton<HomeworkRepository>(
    () => HomeworkRepositoryImpl(apiService: dataDi<HomeworkApiService>(), localSource: dataDi<HomeworkLocalSource>()),
  );
  dataDi.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  dataDi.registerLazySingleton<FirebaseMessaging>(() => FirebaseMessaging.instance);
  dataDi.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  dataDi.registerLazySingleton<FirebaseMessagingDataSource>(
    () => FirebaseMessagingDataSourceImpl(messaging: dataDi<FirebaseMessaging>()),
  );

  dataDi.registerLazySingleton<MessagingRepository>(
    () => MessagingRepositoryImpl(dataSource: dataDi<FirebaseMessagingDataSource>()),
  );

  dataDi.registerLazySingleton<FirebaseChatDataSource>(
    () => FirebaseChatDataSourceImpl(
      firestore: dataDi<FirebaseFirestore>(),
      storage: dataDi<FirebaseStorage>(),
    ),
  );

  dataDi.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(dataSource: dataDi<FirebaseChatDataSource>()));

  dataDi.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(apiService: dataDi<UserApiService>()));
}
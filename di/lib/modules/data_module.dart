import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/constants/api_constants.dart';
import 'package:common/constants/logger.dart';
import 'package:data/core/objectbox_store.dart';
import 'package:data/modules/auth/auth_repository_impl.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:data/modules/chat/chat_repository_impl.dart';
import 'package:data/modules/chat/sources/remote/firebase_chat_data_source.dart';
import 'package:data/modules/homework/homework_repository_impl.dart';
import 'package:data/modules/homework/sources/local/homework_local_source.dart';
import 'package:data/modules/homework/sources/remote/homework_api_service.dart';
import 'package:data/modules/messaging/messaging_repository_impl.dart';
import 'package:data/modules/messaging/sources/remote/firebase_messaging_data_source.dart';
import 'package:data/modules/schedule/schedule_repository_impl.dart';
import 'package:data/modules/schedule/sources/local/schedule_local_source.dart';
import 'package:data/modules/schedule/sources/remote/schedule_api_service.dart';
import 'package:data/modules/user/sources/remote/user_api_service.dart';
import 'package:data/modules/user/user_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/chat/chat_repository.dart';
import 'package:domain/modules/homework/homework_repository.dart';
import 'package:domain/modules/messaging/messaging_repository.dart';
import 'package:domain/modules/schedule/schedule_repository.dart';
import 'package:domain/modules/user/user_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:refresh_interceptor/refresh_interceptor.dart';

@module
abstract class DataModule {
  BaseOptions _baseOptions() => BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    receiveTimeout: const Duration(seconds: 60),
    connectTimeout: const Duration(seconds: 20),
  );

  @lazySingleton
  @preResolve
  Future<ObjectBoxStore> objectBoxStore() => ObjectBoxStore.create();

  @lazySingleton
  AuthLocalSource authLocalSource(ObjectBoxStore store) =>
      AuthLocalSourceImpl(authTokenBox: store.authTokenBox);

  @lazySingleton
  HomeworkLocalSource homeworkLocalSource(ObjectBoxStore store) =>
      HomeworkLocalSourceImpl(homeworkBox: store.homeworkBox);

  @lazySingleton
  ScheduleLocalSource scheduleLocalSource(ObjectBoxStore store) =>
      ScheduleLocalSourceImpl(
        scheduleBox: store.scheduleBox,
        scheduleItemBox: store.scheduleItemBox,
      );

  @Named('authDio')
  @lazySingleton
  Dio authDio() {
    final dio = Dio(_baseOptions());
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }

  @lazySingleton
  AuthApiService authApiService(@Named('authDio') Dio dio) =>
      AuthApiService(dio);

  @lazySingleton
  RefreshInterceptor refreshInterceptor(
    AuthLocalSource authLocalSource,
    AuthApiService authApiService,
  ) {
    return RefreshInterceptor(
      readAccessToken: authLocalSource.getAccessToken,
      readRefreshToken: authLocalSource.getRefreshToken,
      saveTokens: (accessToken, refreshToken) {
        if (refreshToken == null || refreshToken.isEmpty) {
          return authLocalSource.insertAccessToken(accessToken);
        }
        return authLocalSource.insertTokens(accessToken, refreshToken);
      },
      clearTokens: authLocalSource.deleteTokens,
      onRefresh: (refreshToken) async {
        final response = await authApiService.refresh({
          'refresh_token': refreshToken,
        });
        final accessToken = response.accessToken;
        if (accessToken == null || accessToken.isEmpty) return null;

        return RefreshTokens(
          accessToken: accessToken,
          refreshToken: response.refreshToken?.isNotEmpty == true
              ? response.refreshToken
              : null,
        );
      },
      shouldRefresh: (error) {
        final statusCode = error.response?.statusCode;
        return statusCode == 401 || statusCode == 403;
      },
      onError: (error, stackTrace) {
        consoleLog('Refresh interceptor error: $error\n$stackTrace');
      },
    );
  }

  @Named('appDio')
  @lazySingleton
  Dio appDio(RefreshInterceptor refreshInterceptor) {
    final dio = Dio(
      _baseOptions().copyWith(headers: {'saas-app-token': 'YourSaasAppToken'}),
    );
    refreshInterceptor.attachTo(dio);
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }

  @lazySingleton
  ScheduleApiService scheduleApiService(@Named('appDio') Dio dio) =>
      ScheduleApiService(dio);

  @lazySingleton
  HomeworkApiService homeworkApiService(@Named('appDio') Dio dio) =>
      HomeworkApiService(dio);

  @lazySingleton
  UserApiService userApiService(@Named('appDio') Dio dio) =>
      UserApiService(dio);

  @lazySingleton
  AuthRepository authRepository(
    AuthApiService apiService,
    AuthLocalSource localSource,
  ) => AuthRepositoryImpl(apiService: apiService, localSource: localSource);

  @lazySingleton
  ScheduleRepository scheduleRepository(
    ScheduleApiService apiService,
    ScheduleLocalSource localSource,
  ) => ScheduleRepositoryImpl(apiService: apiService, localSource: localSource);

  @lazySingleton
  HomeworkRepository homeworkRepository(
    HomeworkApiService apiService,
    HomeworkLocalSource localSource,
  ) => HomeworkRepositoryImpl(apiService: apiService, localSource: localSource);

  @lazySingleton
  UserRepository userRepository(UserApiService apiService) =>
      UserRepositoryImpl(apiService: apiService);

  @lazySingleton
  FirebaseFirestore firebaseFirestore() => FirebaseFirestore.instance;

  @lazySingleton
  FirebaseMessaging firebaseMessaging() => FirebaseMessaging.instance;

  @lazySingleton
  FirebaseStorage firebaseStorage() => FirebaseStorage.instance;

  @lazySingleton
  FirebaseMessagingDataSource firebaseMessagingDataSource(
    FirebaseMessaging messaging,
  ) => FirebaseMessagingDataSourceImpl(messaging: messaging);

  @lazySingleton
  MessagingRepository messagingRepository(
    FirebaseMessagingDataSource dataSource,
  ) => MessagingRepositoryImpl(dataSource: dataSource);

  @lazySingleton
  FirebaseChatDataSource firebaseChatDataSource(
    FirebaseFirestore firestore,
    FirebaseStorage storage,
  ) => FirebaseChatDataSourceImpl(firestore: firestore, storage: storage);

  @lazySingleton
  ChatRepository chatRepository(FirebaseChatDataSource dataSource) =>
      ChatRepositoryImpl(dataSource: dataSource);
}

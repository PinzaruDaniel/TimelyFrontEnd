import 'package:common/constants/api_constants.dart';
import 'package:common/constants/session_expired_callback.dart';
import 'package:data/core/auth_interceptor.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:data/modules/homework/sources/remote/homework_api_service.dart';
import 'package:data/modules/schedule/sources/remote/schedule_api_service.dart';
import 'package:data/modules/user/sources/remote/user_api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> init({required Function() onSessionExpired}) async {
  var mainClientOption = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    receiveTimeout: Duration(seconds: 60),
    connectTimeout: Duration(seconds: 20),
  );

  var mainClient = Dio(mainClientOption.copyWith(headers: {'saas-app-token': 'YourSaasAppToken'}));
  mainClient.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  var authClient = Dio(mainClientOption);
  authClient.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  GetIt.instance.registerLazySingleton<AuthApiService>(() => AuthApiService(authClient));

  var refreshInterceptor = RefreshInterceptor(
    authApiService: GetIt.instance<AuthApiService>(),
    authLocalSource: GetIt.instance<AuthLocalSource>(),
    onSessionExpired: SessionExpiredCallback(onSessionExpired: onSessionExpired),
  );
  mainClient.interceptors.add(AuthInterceptor(dio: mainClient, refreshInterceptor: refreshInterceptor));
  GetIt.instance.registerLazySingleton<ScheduleApiService>(() => ScheduleApiService(mainClient));

  GetIt.instance.registerLazySingleton<HomeworkApiService>(() => HomeworkApiService(mainClient));
  GetIt.instance.registerLazySingleton<UserApiService>(() => UserApiService(mainClient));
}
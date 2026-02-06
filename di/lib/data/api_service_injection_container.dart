import 'package:common/constants/api_constants.dart';
import 'package:data/modules/homework/sources/remote/homework_api_service.dart';
import 'package:data/modules/schedule/sources/remote/schedule_api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async{
  var mainClientOption = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    headers: ApiConstants.authHeader,
    receiveTimeout: Duration(seconds: 60),
    connectTimeout: Duration(seconds: 20),
  );

  var mainClient = Dio(mainClientOption);
  mainClient.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  GetIt.instance.registerLazySingleton<ScheduleApiService>(()=>ScheduleApiService(mainClient));

  GetIt.instance.registerLazySingleton<HomeworkApiService>(()=>HomeworkApiService(mainClient));



}
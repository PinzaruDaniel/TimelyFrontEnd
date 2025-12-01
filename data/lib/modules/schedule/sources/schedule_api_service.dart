import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:uuid/uuid.dart';

import '../models/remote/index.dart';

part 'schedule_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class ScheduleApiService {
  factory ScheduleApiService(Dio dio) = _ScheduleApiService;

  @GET('/Homework/group/{groupId}')
  Future<ScheduleApiDto> getSchedule(@Path() Uuid groupId);
}
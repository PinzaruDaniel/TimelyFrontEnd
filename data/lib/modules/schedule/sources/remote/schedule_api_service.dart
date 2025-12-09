import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/remote/index.dart';

part 'schedule_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class ScheduleApiService {
  factory ScheduleApiService(Dio dio) = _ScheduleApiService;

  @POST('/api/Schedule/upload-image')
  @MultiPart()
  Future<ScheduleApiDto> addSchedule(@Part(name: "GroupId") String groupId, @Part(name: 'Image') MultipartFile? file);

  @GET('/api/Schedule/group/{groupId}')
  Future<ScheduleApiDto> getSchedule(@Path() String groupId);
}

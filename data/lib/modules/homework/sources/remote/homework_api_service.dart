
import 'package:common/constants/post_classes.dart';
import 'package:dartz/dartz.dart';
import 'package:data/modules/homework/models/remote/index.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'homework_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class HomeworkApiService {
  factory HomeworkApiService(Dio dio)= _HomeworkApiService;

  @POST('/api/Homework/add')
  @MultiPart()
  Future<HomeworkApiDto> addHomework(
      FormData formData
      );

  @GET('/api/Homework/group/{groupId}')
  Future<List<HomeworkApiDto>> getHomeworks(@Path('groupId') String groupId);
}


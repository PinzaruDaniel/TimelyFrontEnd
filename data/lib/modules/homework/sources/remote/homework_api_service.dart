import 'dart:io';

import 'package:data/modules/homework/models/remote/index.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'homework_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class HomeworkApiService {

  factory HomeworkApiService(Dio dio) = _HomeworkApiService;

  @POST('/api/Homework/add')
  @MultiPart()
  Future<HomeworkApiDto> addHomework({
    @Part(name: 'groupId') required String groupId,
    @Part(name: 'subject') required String subject,
    @Part(name: 'description') required String description,
    @Part(name: 'dueDate') required String dueDate,
    @Part(name: 'image') File? imageFile,
  });
  @GET('/api/Homework/group/{groupId}')
  Future<List<HomeworkApiDto>> getHomeworks(@Path('groupId') String groupId);
}

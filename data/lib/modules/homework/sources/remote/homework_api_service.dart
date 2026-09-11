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

  // PLACEHOLDER CONTRACTS: implement these routes in the backend before use.
  // Tests mock transport; these declarations do not provide a mock server.
  @GET('/api/Homework/{homeworkId}')
  Future<HomeworkApiDto> getHomework(@Path('homeworkId') String homeworkId);

  @PUT('/api/Homework/{homeworkId}')
  @MultiPart()
  Future<HomeworkApiDto> editHomework({
    @Path('homeworkId') required String homeworkId,
    @Part(name: 'subject') required String subject,
    @Part(name: 'description') required String description,
    @Part(name: 'dueDate') required String dueDate,
  });

  @DELETE('/api/Homework/{homeworkId}')
  Future<void> deleteHomework(@Path('homeworkId') String homeworkId);

  @POST('/api/Homework/{homeworkId}/complete')
  Future<HomeworkApiDto> markHomeworkDone(
    @Path('homeworkId') String homeworkId,
  );

  @POST('/api/Homework/{homeworkId}/reopen')
  Future<HomeworkApiDto> reopenHomework(@Path('homeworkId') String homeworkId);
}

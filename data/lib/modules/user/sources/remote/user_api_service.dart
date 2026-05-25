import 'package:data/modules/user/models/remote/index.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class UserApiService {
  factory UserApiService(Dio dio ) = _UserApiService;

  @GET('/api/User/me')
  Future<UserProfileApiDto> getMyProfile();

  @GET('/api/User/group/{groupId}')
  Future<List<UserProfileApiDto>> getUsersByGroup(@Path('groupId') String groupId);
}
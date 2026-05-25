import 'package:data/modules/auth/models/remote/index.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/api/Auth/refresh')
  Future<AuthTokensApiDto> refresh(@Body() Map<String, dynamic> body);

  @POST('/api/Auth/login')
  Future<AuthTokensApiDto> login(@Body() Map<String, dynamic> body);

  @POST('/api/Auth/register')
  Future<AuthTokensApiDto> register(@Body() Map<String, dynamic> body);

  @POST('/api/Auth/forgot-password')
  Future<AuthTokensApiDto> resetPassword(@Body() Map<String, dynamic> body);
}

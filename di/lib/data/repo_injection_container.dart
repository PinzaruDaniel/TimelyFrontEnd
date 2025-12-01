import 'package:common/constants/api_constants.dart';
import 'package:dio/dio.dart';

Future<void> init() async{
  var apiClientOption = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    headers: ApiConstants.authHeader,
    receiveTimeout: Duration(seconds: 60),
    connectTimeout: Duration(seconds: 20),
  );


}
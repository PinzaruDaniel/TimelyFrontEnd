import 'package:common/constants/failure_class.dart';
import 'package:dio/dio.dart';
import 'package:smart_domain/smart_domain.dart' show FailureMapper;

final class AppFailureMapper implements FailureMapper<Object> {
  const AppFailureMapper();

  @override
  Failure map(Object error, [StackTrace? stackTrace]) {
    return error is DioException
        ? Failure.dio(error)
        : Failure.error(error, stackTrace);
  }
}

const appFailureMapper = AppFailureMapper();

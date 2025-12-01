import 'package:dio/dio.dart';

class Failure {
  final String message;
  final String? code;
  final String? type;
  final dynamic originalError;
  final Map<String, dynamic>? details;

  const Failure({
    required this.message,
    this.code,
    this.type,
    this.originalError,
    this.details,
  });

  factory Failure.dio(DioException e) {
    String errorType = e.type
        .toString()
        .split('.')
        .last;

    String message;
    if (e.response?.statusCode == 404) {
      message = 'Error 404. Resource not found or there are no products';
    } else if (e.response?.statusCode == 503) {
      message = 'Service unavailable. Error 503';
    } else {
      message = 'Network Error';
    }

    return Failure(
      message: message,
      code: e.response?.statusCode?.toString(),
      type: 'dio_$errorType',
      originalError: e,
      details: {
        'response': e.response?.data,
        'stackTrace': e.stackTrace.toString(),
      },
    );
  }

  factory Failure.error(Object e, [StackTrace? stackTrace]) {
    return Failure(
      message: e.toString(),
      type: 'error',
      originalError: e,
      details: {
        'stackTrace': stackTrace?.toString() ?? 'No stack trace',
      },
    );
  }
}

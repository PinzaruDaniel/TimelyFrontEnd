import 'package:dio/dio.dart';
import 'package:smart_domain/smart_domain.dart' as smart_domain;

class Failure extends smart_domain.Failure {
  final String _message;

  @override
  String get message => _message;
  final String? code;
  final String? type;
  final dynamic originalError;
  final Map<String, dynamic>? details;

  const Failure({
    required String message,
    this.code,
    this.type,
    this.originalError,
    this.details,
  }) : _message = message,
       super(message: message, cause: originalError);

  factory Failure.dio(DioException e) {
    String errorType = e.type.toString().split('.').last;

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
      details: {'stackTrace': stackTrace?.toString() ?? 'No stack trace'},
    );
  }
}

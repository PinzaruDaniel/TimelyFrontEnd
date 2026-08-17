import 'package:data/core/app_failure_mapper.dart';
import 'package:dio/dio.dart';
import 'package:test/test.dart';

void main() {
  test('maps Dio exceptions to network-aware app failures', () {
    final request = RequestOptions(path: '/users');
    final failure = appFailureMapper.map(
      DioException(
        requestOptions: request,
        response: Response(requestOptions: request, statusCode: 404),
      ),
    );

    expect(failure.code, '404');
    expect(failure.type, startsWith('dio_'));
  });

  test('maps unknown errors with stack traces', () {
    final stackTrace = StackTrace.current;
    final failure = appFailureMapper.map(StateError('failed'), stackTrace);

    expect(failure.message, contains('failed'));
    expect(failure.originalError, isA<StateError>());
    expect(failure.details?['stackTrace'], stackTrace.toString());
  });
}

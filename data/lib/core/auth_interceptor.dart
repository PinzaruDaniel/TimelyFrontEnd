import 'dart:convert';
import 'package:common/constants/session_expired_callback.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:dio/dio.dart';
import 'package:common/constants/logger.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:async_locks/async_locks.dart';

class RefreshInterceptor {
  final SessionExpiredCallback onSessionExpired;
  final AuthApiService authApiService;
  final AuthLocalSource authLocalSource;
  final lock = Lock();
  bool successRegenerate = false;

  RefreshInterceptor({required this.onSessionExpired, required this.authApiService, required this.authLocalSource});

  Future<void> regenerateAccessToken() async {
    if (!lock.locked) {
      await _regenerate();
    } else {
      consoleLog('Waiting for another regeneration to complete');
      await lock.acquire();
    }
  }

  Future<void> _regenerate() async {
    successRegenerate = false;
    consoleLog('Starting token regeneration');
    lock.acquire();
    bool success = false;
    try {
      String? refreshToken = await authLocalSource.getRefreshToken();
      consoleLog('refreshToken: $refreshToken');
      if (refreshToken != null) {
        final response = await authApiService.refresh({'refresh_token': refreshToken});
        await authLocalSource.insertAccessToken(response.accessToken!);
        success = true;
      }
    } catch (e, stack) {
      consoleLog('Failed to regenerate token: $e');
      consoleLog(stack);
    }

    int totalWaiters = lock.waiters + 1;
    for (int i = 0; i < totalWaiters; i++) {
      lock.release();
    }

    successRegenerate = success;
    consoleLog('Token regeneration success: $success');
  }
}

class AuthInterceptor extends InterceptorsWrapper {
  final RefreshInterceptor refreshInterceptor;
  final Dio dio;

  AuthInterceptor({required this.dio, required this.refreshInterceptor});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? accessToken = await refreshInterceptor.authLocalSource.getAccessToken();
    accessToken.toString();
    String? refreshToken = await refreshInterceptor.authLocalSource.getRefreshToken();
    consoleLog('onRequest interceptor: access=$accessToken, refresh=$refreshToken');

    if (accessToken == null || refreshToken == null) {
      return handler.reject(
        DioException(
          requestOptions: options,
          response: Response(requestOptions: options, statusCode: 401),
          error: {'reason': 'no_token'},
        ),
      );
    }

    options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data is String) {
      try {
        response.data = jsonDecode(response.data);
      } catch (e) {
        consoleLog('Failed to decode JSON response: $e');
      }
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.data is String) {
      try {
        err.response!.data = jsonDecode(err.response!.data);
      } catch (_) {}
    }

    consoleLog('onError interceptor: ${err.response?.data.runtimeType}, ${err.response?.data}');

    try {
      final data = err.response?.data;
      final statusCode = err.response?.statusCode;
      String? errorText;
      if (data is Map) {
        final dynamic detail = data['detail'] ?? data['message'] ?? data['error'];
        errorText = detail?.toString().toLowerCase();
      } else if (data is String) {
        errorText = data.toLowerCase();
      }

      final shouldRefresh = (statusCode == 401 || statusCode == 403) &&
          (errorText?.contains('invalid token') == true ||
              errorText?.contains('jwt expired') == true ||
              errorText?.contains('invalid signature') == true ||
              errorText?.contains('token expired') == true);

      if (shouldRefresh) {
        consoleLog('Token expired/invalid, starting refresh... ${refreshInterceptor.lock.locked}');

        await refreshInterceptor.regenerateAccessToken();

        if (!refreshInterceptor.successRegenerate) {
          consoleLog('First regeneration failed, trying one more time...');
          await refreshInterceptor.regenerateAccessToken();
        }

        if (refreshInterceptor.successRegenerate) {
          var newAccessToken = await refreshInterceptor.authLocalSource.getAccessToken();
          err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
          consoleLog('Bearer token after regeneration: $newAccessToken');

          var newRequest = await dio.fetch(err.requestOptions);

          final responseData = newRequest.data is String ? jsonDecode(newRequest.data) : newRequest.data;
          consoleLog('Parsed data: $responseData');

          return handler.resolve(
            Response(
              requestOptions: err.requestOptions,
              data: responseData,
              statusCode: newRequest.statusCode,
              statusMessage: newRequest.statusMessage,
              headers: newRequest.headers,
            ),
          );
        } else {
          consoleLog('All regeneration attempts failed, expiring session');
          refreshInterceptor.onSessionExpired.call();
          return handler.reject(
            DioException(requestOptions: err.requestOptions, error: {'reason': 'all_logged_out_after_retry'}),
          );
        }
      }
    } catch (e, s) {
      consoleLog('Error in onError interceptor: $e, $s');
    }

    handler.reject(err);
  }
}

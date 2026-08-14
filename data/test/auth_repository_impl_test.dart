import 'dart:async';

import 'package:data/modules/auth/models/remote/index.dart';
import 'package:data/modules/auth/auth_repository_impl.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/auth/models/index.dart';
import 'package:test/test.dart';

void main() {
  group('AuthRepositoryImpl', () {
    late _FakeAuthApiService api;
    late _MemoryAuthLocalSource local;
    late AuthRepositoryImpl repository;

    setUp(() {
      api = _FakeAuthApiService();
      local = _MemoryAuthLocalSource();
      repository = AuthRepositoryImpl(remote: api, local: local);
    });

    tearDown(() => repository.dispose());

    test('login forwards parameters and maps remote tokens', () async {
      final result = await repository.login('user@example.com', 'secret');

      expect(result.isRight(), isTrue);
      expect(result.getOrElse(_unreachable).accessToken, 'access');
      expect(api.loginBody, {
        'email': 'user@example.com',
        'password': 'secret',
      });
    });

    test('register forwards all four parameters', () async {
      final result = await repository.register(
        'Daniel',
        'user@example.com',
        'secret',
        'group-a',
      );

      expect(result.isRight(), isTrue);
      expect(api.registerBody, {
        'email': 'user@example.com',
        'password': 'secret',
        'name': 'Daniel',
        'group': 'group-a',
      });
    });

    test('deduplicates concurrent identical login requests', () async {
      final pending = Completer<AuthTokensApiDto>();
      api.pendingLogin = pending;

      final first = repository.login('user@example.com', 'secret');
      final second = repository.login('user@example.com', 'secret');
      pending.complete(_tokens);

      final results = await Future.wait([first, second]);
      expect(results.every((result) => result.isRight()), isTrue);
      expect(api.loginCalls, 1);
    });

    test('maps Dio failures into domain Failure', () async {
      api.error = DioException.connectionError(
        requestOptions: RequestOptions(path: '/api/Auth/login'),
        reason: 'offline',
      );

      final result = await repository.login('user@example.com', 'secret');

      expect(result.isLeft(), isTrue);
      expect(
        result.fold((failure) => failure.type, (_) => null),
        'dio_connectionError',
      );
    });

    test('keeps token persistence delegated to local source', () async {
      await repository.insertTokens('new-access', 'new-refresh');
      expect(await repository.getAccessToken(), 'new-access');
      expect(await repository.getRefreshToken(), 'new-refresh');

      await repository.deleteTokens();
      expect(await repository.getAccessToken(), isNull);
      expect(await repository.getRefreshToken(), isNull);
    });
  });
}

const _tokens = AuthTokensApiDto(
  accessToken: 'access',
  refreshToken: 'refresh',
);

AuthTokensEntity _unreachable() => throw StateError('Expected Right result.');

final class _FakeAuthApiService implements AuthApiService {
  Map<String, dynamic>? loginBody;
  Map<String, dynamic>? registerBody;
  Completer<AuthTokensApiDto>? pendingLogin;
  Object? error;
  int loginCalls = 0;

  @override
  Future<AuthTokensApiDto> login(Map<String, dynamic> body) async {
    loginCalls++;
    loginBody = body;
    if (error case final value?) throw value;
    if (pendingLogin case final pending?) return pending.future;
    return _tokens;
  }

  @override
  Future<AuthTokensApiDto> register(Map<String, dynamic> body) async {
    registerBody = body;
    return _tokens;
  }

  @override
  Future<AuthTokensApiDto> resetPassword(Map<String, dynamic> body) async =>
      _tokens;

  @override
  Future<AuthTokensApiDto> refresh(Map<String, dynamic> body) async => _tokens;
}

final class _MemoryAuthLocalSource implements AuthLocalSource {
  String? accessToken;
  String? refreshToken;

  @override
  Future<void> deleteTokens() async {
    accessToken = null;
    refreshToken = null;
  }

  @override
  Future<String?> getAccessToken() async => accessToken;

  @override
  Future<String?> getRefreshToken() async => refreshToken;

  @override
  Future<void> insertAccessToken(String accessToken) async {
    this.accessToken = accessToken;
  }

  @override
  Future<void> insertTokens(String accessToken, String refreshToken) async {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
  }
}

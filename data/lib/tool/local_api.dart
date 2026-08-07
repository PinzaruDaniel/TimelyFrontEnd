import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
  var refreshGeneration = 0;
  var forceSessionExpired = false;

  print('Timely local API: http://localhost:${server.port}');
  print(
    'Login returns an expired access token. First protected call refreshes it.',
  );

  await for (final request in server) {
    request.response.headers
      ..contentType = ContentType.json
      ..set('Access-Control-Allow-Origin', '*')
      ..set(
        'Access-Control-Allow-Headers',
        'Authorization, Content-Type, saas-app-token',
      )
      ..set('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');

    if (request.method == 'OPTIONS') {
      await request.response.close();
      continue;
    }

    final path = request.uri.path;
    print(
      '${request.method} $path ${request.headers.value('Authorization') ?? ''}',
    );

    if (request.method == 'POST' &&
        (path == '/api/Auth/login' || path == '/api/Auth/register')) {
      await _respond(request, 200, {
        'accessToken': 'expired-access',
        'refreshToken': 'valid-refresh',
      });
      continue;
    }

    if (request.method == 'POST' &&
        (path == '/api/Auth/refresh' || path == '/refresh')) {
      final body = await _readJson(request);
      final refreshToken = body['refreshToken'] ?? body['refresh'];
      final valid =
          refreshToken == 'valid-refresh' ||
          refreshToken.toString().startsWith('rotated-refresh-');

      if (!valid) {
        await _respond(request, 401, {'code': 'invalid_refresh_token'});
        continue;
      }

      refreshGeneration++;
      await _respond(request, 200, {
        'accessToken': 'fresh-access-$refreshGeneration',
        'refreshToken': 'rotated-refresh-$refreshGeneration',
      });
      continue;
    }

    if (request.method == 'POST' && path == '/force-session-expired') {
      forceSessionExpired = true;
      await _respond(request, 200, {'forceSessionExpired': true});
      continue;
    }

    if (request.method == 'GET' && path.startsWith('/api/Schedule/group/')) {
      if (forceSessionExpired || !_hasFreshAccessToken(request)) {
        await _respond(request, 401, {'code': 'token_expired'});
        continue;
      }

      final groupId = path.substring('/api/Schedule/group/'.length);
      await _respond(request, 200, {
        'group': 'Local Test Group',
        'groupId': groupId,
        'Luni': <Object>[],
        'Marti': <Object>[],
        'Miercuri': <Object>[],
        'Joi': <Object>[],
        'Vineri': <Object>[],
      });
      continue;
    }

    if (path == '/api/User/me' || path == '/protected') {
      if (forceSessionExpired) {
        await _respond(request, 401, {'code': 'forced_session_expired'});
        continue;
      }

      if (!_hasFreshAccessToken(request)) {
        await _respond(request, 401, {'code': 'token_expired'});
        continue;
      }

      await _respond(request, 200, {
        'id': 'local-user',
        'fullName': 'Local API User',
        'email': 'local@timely.test',
        'groupId': 'local-group',
        'groupName': 'Local Test Group',
        'message': 'Protected request succeeded',
      });
      continue;
    }

    if (path == '/always-401') {
      await _respond(request, 401, {'code': 'always_unauthorized'});
      continue;
    }

    if (request.method == 'POST' && path == '/reset') {
      refreshGeneration = 0;
      forceSessionExpired = false;
      await _respond(request, 200, {'reset': true});
      continue;
    }

    await _respond(request, 404, {'error': 'not_found', 'path': path});
  }
}

bool _hasFreshAccessToken(HttpRequest request) {
  return request.headers
          .value('Authorization')
          ?.startsWith('Bearer fresh-access-') ==
      true;
}

Future<Map<String, dynamic>> _readJson(HttpRequest request) async {
  final text = await utf8.decoder.bind(request).join();
  if (text.isEmpty) return {};
  final value = jsonDecode(text);
  return value is Map<String, dynamic> ? value : {};
}

Future<void> _respond(HttpRequest request, int statusCode, Object body) async {
  request.response
    ..statusCode = statusCode
    ..write(jsonEncode(body));
  await request.response.close();
}

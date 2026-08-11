import 'package:data/modules/auth/models/remote/index.dart';
import 'package:data/modules/user/models/remote/index.dart';
import 'package:test/test.dart';

void main() {
  test('parses the session API token response', () {
    final tokens = AuthTokensApiDto.fromJson({
      'access_token': 'access-token',
      'refresh_token': 'refresh-token',
      'token_type': 'bearer',
    });

    expect(tokens.accessToken, 'access-token');
    expect(tokens.refreshToken, 'refresh-token');
  });

  test('parses the protected profile response', () {
    final profile = UserProfileApiDto.fromJson({
      'message': 'You reached a protected endpoint',
      'email': 'user@example.com',
    });

    expect(profile.message, 'You reached a protected endpoint');
    expect(profile.email, 'user@example.com');
    expect(profile.id, isEmpty);
    expect(profile.groupId, isEmpty);
  });
}

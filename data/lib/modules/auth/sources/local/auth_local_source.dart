import 'package:common/constants/logger.dart';
import 'package:data/modules/auth/models/local/auth_token_box.dart';
import 'package:objectbox/objectbox.dart';

abstract class AuthLocalSource {
  Future<String?> getRefreshToken();

  Future<String?> getAccessToken();

  Future<void> insertAccessToken(String accessToken);

  Future<void> insertTokens(String accessToken, String refreshToken);
  Future<void> deleteTokens();
}

class AuthLocalSourceImpl implements AuthLocalSource {
  Box<AuthTokenBox> authTokenBox;

  AuthLocalSourceImpl({required this.authTokenBox});

  @override
  Future<String?> getAccessToken() async {
    var accessTokens = await authTokenBox.getAsync(1);
    if (accessTokens == null) return null;
    return accessTokens.accessToken;
  }

  @override
  Future<String?> getRefreshToken() async {
    var refreshTokens = await authTokenBox.getAsync(1);
    if (refreshTokens == null) return null;
    return refreshTokens.refreshToken;
  }

  @override
  Future<void> insertAccessToken(String accessToken) async {
    final existingToken = authTokenBox.get(1);
    consoleLog('refresh token when inserting AccessToken: ${existingToken?.refreshToken?? 'nothing'}');
    if (existingToken != null) {
      existingToken.accessToken = accessToken;
      await authTokenBox.putAsync(existingToken);
    } else {
      await authTokenBox.putAsync(AuthTokenBox(id: 1, accessToken: accessToken));
    }
  }

  @override
  Future<void> insertTokens(String accessToken, String refreshToken) async {
    authTokenBox.putAsync(AuthTokenBox(id: 1, accessToken: accessToken, refreshToken: refreshToken));
  }

  @override
  Future<void> deleteTokens()async{
    authTokenBox.removeAll();
  }
}

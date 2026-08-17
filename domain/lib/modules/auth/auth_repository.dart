import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/auth/models/index.dart';
import 'package:smart_domain/smart_domain.dart' show Result;

abstract class AuthRepository {
  Future<Result<AuthTokensEntity, Failure>> login(
    String email,
    String password,
  );

  Future<Result<AuthTokensEntity, Failure>> register(
    String name,
    String email,
    String password,
    String group,
  );

  Future<Result<AuthTokensEntity, Failure>> resetPassword(
    String email,
    String password,
  );

  Future<Result<AuthTokensEntity, Failure>> refresh(String refreshToken);

  Future<void> insertTokens(String accessToken, String refreshToken);

  Future<void> deleteTokens();

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();
}

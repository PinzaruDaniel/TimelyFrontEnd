import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/auth/models/index.dart';
import 'package:domain/modules/auth/use_cases/auth_login_use_case.dart';
import 'package:domain/modules/chat/chat_repository.dart';
import 'package:domain/modules/chat/models/index.dart';
import 'package:domain/modules/chat/use_cases/get_chat_messages_use_case.dart';
import 'package:smart_domain/smart_domain.dart'
    show FailureResult, Result, Success;
import 'package:test/test.dart';

final class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository(this.loginResult);

  final Result<AuthTokensEntity, Failure> loginResult;
  String? insertedAccessToken;
  String? insertedRefreshToken;

  @override
  Future<Result<AuthTokensEntity, Failure>> login(
    String email,
    String password,
  ) async {
    return loginResult;
  }

  @override
  Future<void> insertTokens(String accessToken, String refreshToken) async {
    insertedAccessToken = accessToken;
    insertedRefreshToken = refreshToken;
  }

  @override
  Future<Result<AuthTokensEntity, Failure>> refresh(String refreshToken) =>
      throw UnimplementedError();

  @override
  Future<Result<AuthTokensEntity, Failure>> register(
    String name,
    String email,
    String password,
    String group,
  ) => throw UnimplementedError();

  @override
  Future<Result<AuthTokensEntity, Failure>> resetPassword(
    String email,
    String password,
  ) => throw UnimplementedError();

  @override
  Future<void> deleteTokens() => throw UnimplementedError();

  @override
  Future<String?> getAccessToken() => throw UnimplementedError();

  @override
  Future<String?> getRefreshToken() => throw UnimplementedError();
}

final class ErrorChatRepository implements ChatRepository {
  @override
  Stream<List<MessageEntity>> getChatMessages(String chatId) {
    return Stream.error(StateError('stream failed'));
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group('smart_domain integration', () {
    test('auth use case maps success and persists tokens', () async {
      final repository = FakeAuthRepository(
        const Success(
          AuthTokensEntity(accessToken: 'access', refreshToken: 'refresh'),
        ),
      );
      final useCase = AuthLoginUseCase(authRepository: repository);

      final result = await useCase(
        AuthLoginParams(email: 'ada@example.com', password: 'secret'),
      );

      expect(result, const Success<void, Failure>(null));
      expect(repository.insertedAccessToken, 'access');
      expect(repository.insertedRefreshToken, 'refresh');
    });

    test('auth use case short-circuits failures', () async {
      const failure = Failure(message: 'invalid credentials');
      final repository = FakeAuthRepository(const FailureResult(failure));
      final useCase = AuthLoginUseCase(authRepository: repository);

      final result = await useCase(
        AuthLoginParams(email: 'ada@example.com', password: 'wrong'),
      );

      expect(result.errorOrNull(), same(failure));
      expect(repository.insertedAccessToken, isNull);
    });

    test('chat stream converts emitted errors to failures', () async {
      final useCase = GetChatMessagesUseCase(repository: ErrorChatRepository());

      final result = await useCase(
        GetChatMessagesParams(chatId: 'chat'),
      ).single;

      expect(result, isA<FailureResult<List<MessageEntity>, Failure>>());
      expect(result.errorOrNull()?.message, contains('stream failed'));
    });
  });
}

import 'package:common/constants/failure_class.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/chat/chat_repository.dart';

class MarkMessageAsReadUseCase extends UseCase<void, MarkMessageAsReadParams> {
  final ChatRepository repository;

  MarkMessageAsReadUseCase({required this.repository});

  @override
  Future<Result<void, Failure>> execute(MarkMessageAsReadParams params) {
    return Result.guardAsync(
      () => repository.markMessageAsRead(
        params.chatId,
        params.messageId,
        params.userId,
      ),
      onError: Failure.error,
    );
  }
}

class MarkMessageAsReadParams {
  final String chatId;
  final String messageId;
  final String userId;

  MarkMessageAsReadParams({
    required this.chatId,
    required this.messageId,
    required this.userId,
  });
}

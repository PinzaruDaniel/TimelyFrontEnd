import 'package:common/constants/failure_class.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/chat/chat_repository.dart';
import 'package:domain/modules/chat/models/index.dart';

class GetChatMessagesUseCase
    extends
        ResultStreamUseCase<
          List<MessageEntity>,
          GetChatMessagesParams,
          Failure
        > {
  final ChatRepository repository;
  GetChatMessagesUseCase({required this.repository});

  @override
  Stream<Result<List<MessageEntity>, Failure>> execute(
    GetChatMessagesParams params,
  ) {
    return Result.guardStream(
      () => repository.getChatMessages(params.chatId),
      onError: Failure.error,
    );
  }
}

class GetChatMessagesParams {
  final String chatId;

  GetChatMessagesParams({required this.chatId});
}

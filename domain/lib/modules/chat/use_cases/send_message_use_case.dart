import 'package:common/constants/failure_class.dart';
import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/chat/chat_repository.dart';

class SendMessageUseCase extends UseCase<void, SendMessageParams> {
  final ChatRepository repository;

  SendMessageUseCase({required this.repository});

  @override
  Future<Result<void, Failure>> execute(SendMessageParams params) {
    return Result.guardAsync(
      () => repository.sendMessage(
        chatId: params.chatId,
        senderId: params.senderId,
        text: params.text,
        type: params.type,
        mediaUrl: params.mediaUrl,
      ),
      onError: Failure.error,
    );
  }
}

class SendMessageParams {
  final String chatId;
  final String senderId;
  final String text;
  final String type;
  final String? mediaUrl;

  SendMessageParams({
    required this.chatId,
    required this.senderId,
    required this.text,
    this.type = 'text',
    this.mediaUrl,
  });
}

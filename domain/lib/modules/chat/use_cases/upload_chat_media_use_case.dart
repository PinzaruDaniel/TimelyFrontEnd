import 'package:common/constants/failure_class.dart';
import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/chat/chat_repository.dart';

class UploadChatMediaUseCase extends UseCase<String, UploadChatMediaParams> {
  final ChatRepository repository;

  UploadChatMediaUseCase({required this.repository});

  @override
  Future<Result<String, Failure>> execute(UploadChatMediaParams params) {
    return Result.guardAsync(
      () => repository.uploadChatMedia(
        chatId: params.chatId,
        senderId: params.senderId,
        filePath: params.filePath,
        mediaType: params.mediaType,
      ),
      onError: Failure.error,
    );
  }
}

class UploadChatMediaParams {
  final String chatId;
  final String senderId;
  final String filePath;
  final String mediaType;

  UploadChatMediaParams({
    required this.chatId,
    required this.senderId,
    required this.filePath,
    required this.mediaType,
  });
}

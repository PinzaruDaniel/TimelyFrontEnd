import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/chat/chat_repository.dart';

class UploadChatMediaUseCase extends UseCase<String, UploadChatMediaParams> {
  final ChatRepository repository;

  UploadChatMediaUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(UploadChatMediaParams params) async {
    try {
      final url = await repository.uploadChatMedia(
        chatId: params.chatId,
        senderId: params.senderId,
        filePath: params.filePath,
        mediaType: params.mediaType,
      );
      return Right(url);
    } catch (e, stackTrace) {
      return Left(Failure.error(e, stackTrace));
    }
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

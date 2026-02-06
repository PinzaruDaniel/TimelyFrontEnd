import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/chat/chat_repository.dart';

class SendMessageUseCase extends UseCase<void, SendMessageParams> {
  final ChatRepository repository;

  SendMessageUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(SendMessageParams params) async {
    try {
      await repository.sendMessage(
        chatId: params.chatId,
        senderId: params.senderId,
        text: params.text,
        type: params.type,
      );
      return Right(null);
    } catch (e) {
      return Left(e as Failure);
    }
  }
}

class SendMessageParams {
  final String chatId;
  final String senderId;
  final String text;
  final String type;

  SendMessageParams({required this.chatId, required this.senderId, required this.text, this.type = 'text'});
}

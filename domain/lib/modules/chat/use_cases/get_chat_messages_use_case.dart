import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/chat/chat_repository.dart';
import 'package:domain/modules/chat/models/index.dart';

class GetChatMessagesUseCase extends UseCaseStreamEither<List<MessageEntity>, GetChatMessagesParams> {
  final ChatRepository repository;
  GetChatMessagesUseCase({required this.repository});

  @override
  Stream<Either<Failure, List<MessageEntity>>> call(GetChatMessagesParams params) {
    try {
      return repository.getChatMessages(params.chatId).map(
            (messages) => Right(messages),
      );
    } catch (e) {
      return Stream.value(Left(e as Failure));
    }
  }
  
  
  
}

class GetChatMessagesParams {
  final String chatId;

  GetChatMessagesParams({required this.chatId});
}

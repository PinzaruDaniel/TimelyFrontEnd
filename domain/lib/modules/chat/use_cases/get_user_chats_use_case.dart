import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/chat/chat_repository.dart';

import '../models/index.dart';

class GetUserChatsUseCase extends UseCaseStreamEither<List<ChatEntity>, GetUserChatsParams> {
  final ChatRepository repository;

  GetUserChatsUseCase({required this.repository});

  @override
  Stream<Either<Failure, List<ChatEntity>>> call(GetUserChatsParams params) {
    try {
      return repository.getUserChats(params.userId).map((chats) => Right(chats));
    } catch (failure) {
      return Stream.value(Left(failure as Failure));
    }
  }
}

class GetUserChatsParams {
  final String userId;

  GetUserChatsParams({required this.userId});
}

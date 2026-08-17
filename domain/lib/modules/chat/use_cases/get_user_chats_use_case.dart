import 'package:common/constants/failure_class.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/chat/chat_repository.dart';

import '../models/index.dart';

class GetUserChatsUseCase
    extends ResultStreamUseCase<List<ChatEntity>, GetUserChatsParams, Failure> {
  final ChatRepository repository;

  GetUserChatsUseCase({required this.repository});

  @override
  Stream<Result<List<ChatEntity>, Failure>> execute(GetUserChatsParams params) {
    return Result.guardStream(
      () => repository.getUserChats(params.userId),
      onError: Failure.error,
    );
  }
}

class GetUserChatsParams {
  final String userId;

  GetUserChatsParams({required this.userId});
}

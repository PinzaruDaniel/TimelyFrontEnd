import 'package:domain/core/usecase.dart';
import 'package:domain/modules/chat/chat_repository.dart';

class CreateDirectChatUseCase extends UseCaseNoEither<String, CreateDirectChatParams> {
  final ChatRepository repository;

  CreateDirectChatUseCase({required this.repository});

  @override
  Future<String> call(CreateDirectChatParams params) {
    return repository.createDirectChat(params.userId1, params.userId2);
  }
}

class CreateDirectChatParams {
  final String userId1;
  final String userId2;

  CreateDirectChatParams({required this.userId1, required this.userId2});
}

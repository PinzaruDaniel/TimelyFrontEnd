import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/chat/chat_repository.dart';

class CreateDirectChatUseCase
    extends FutureUseCase<String, CreateDirectChatParams> {
  final ChatRepository repository;

  CreateDirectChatUseCase({required this.repository});

  @override
  Future<String> execute(CreateDirectChatParams params) {
    return repository.createDirectChat(params.userId1, params.userId2);
  }
}

class CreateDirectChatParams {
  final String userId1;
  final String userId2;

  CreateDirectChatParams({required this.userId1, required this.userId2});
}

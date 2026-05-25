import 'package:domain/core/usecase.dart';
import 'package:domain/modules/chat/chat_repository.dart';

class CreateGroupChatUseCase extends UseCaseNoEither<String, CreateGroupChatParams> {
  final ChatRepository repository;

  CreateGroupChatUseCase({required this.repository});

  @override
  Future<String> call(CreateGroupChatParams params) {
    return repository.createGroupChat(
      groupName: params.groupName,
      participants: params.participants,
      createdBy: params.createdBy,
      groupAvatar: params.groupAvatar,
    );
  }
}

class CreateGroupChatParams {
  final String groupName;
  final List<String> participants;
  final String createdBy;
  final String? groupAvatar;

  CreateGroupChatParams({
    required this.groupName,
    required this.participants,
    required this.createdBy,
    this.groupAvatar,
  });
}


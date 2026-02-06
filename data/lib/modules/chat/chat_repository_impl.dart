import 'package:data/modules/chat/sources/remote/firebase_chat_data_source.dart';
import 'package:domain/modules/chat/chat_repository.dart';
import 'package:domain/modules/chat/models/index.dart';

class ChatRepositoryImpl implements ChatRepository {
  final FirebaseChatDataSource dataSource;

  ChatRepositoryImpl({required this.dataSource});

  @override
  Future<String> createDirectChat(String userId1, String userId2) {
    return dataSource.createDirectChat(userId1, userId2);
  }

  @override
  Future<String> createGroupChat({
    required String groupName,
    required List<String> participants,
    required String createdBy,
    String? groupAvatar,
  }) {
    return dataSource.createGroupChat(
      groupName: groupName,
      participants: participants,
      createdBy: createdBy,
      groupAvatar: groupAvatar,
    );
  }

  @override
  Future<void> sendMessage({
    required String chatId,
    required String senderId,
    required String text,
    String type = 'text',
  }) {
    return dataSource.sendMessage(chatId: chatId, senderId: senderId, text: text, type: type);
  }

  @override
  Stream<List<ChatEntity>> getUserChats(String userId) {
    return dataSource.getUserChats(userId).map((dtos) => dtos.map((dto) => dto.toEntity()).toList());
  }

  @override
  Stream<List<MessageEntity>> getChatMessages(String chatId) {
    return dataSource.getChatMessages(chatId).map((dtos) => dtos.map((dto) => dto.toEntity()).toList());
  }

  @override
  Future<void> markMessageAsRead(String chatId, String messageId, String userId) {
    return dataSource.markMessageAsRead(chatId, messageId, userId);
  }
}

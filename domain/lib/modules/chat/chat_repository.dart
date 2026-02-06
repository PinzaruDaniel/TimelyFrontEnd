import 'models/index.dart';

abstract class ChatRepository {
  Future<String> createDirectChat(String userId1, String userId2);

  Future<String> createGroupChat({
    required String groupName,
    required List<String> participants,
    required String createdBy,
    String? groupAvatar,
  });

  Future<void> sendMessage({
    required String chatId,
    required String senderId,
    required String text,
    String type,
  });

  Stream<List<ChatEntity>> getUserChats(String userId);

  Stream<List<MessageEntity>> getChatMessages(String chatId);

  Future<void> markMessageAsRead(String chatId, String messageId, String userId);
}
import 'package:domain/modules/chat/models/index.dart';
import 'package:presentation/view_models/chat_view_model.dart';
import 'package:presentation/view_models/message_view_model.dart';

extension ChatToModelMapper on ChatEntity {
  ChatViewModel get toModel {
    return ChatViewModel(
      chatId: chatId,
      type: type,
      participants: participants,
      groupAvatar: groupAvatar,
      groupName: groupName,
      lastMessage: lastMessage,
      lastMessageTime: lastMessageTime,
    );
  }
}

extension MessageToModelMapper on MessageEntity {
  MessageViewModel  toModel(String currentUserId) {
    return MessageViewModel(
      messageId: messageId,
      senderId: senderId,
      text: text,
      timestamp: timestamp,
      type: type,
      isRead: readBy.contains(currentUserId),
    );
  }
}

part of 'index.dart';
@freezed
abstract class ChatEntity with _$ChatEntity {
  const factory ChatEntity({
    required String chatId,
    required String type,
    required List<String> participants,
    String? groupName,
    String? groupAvatar,
    String? lastMessage,
    DateTime? lastMessageTime,
    String? createdBy,
  }) = _ChatEntity;
}
class ChatViewModel {
  final String chatId;
  final String type;
  final List<String> participants;
  final String? groupName;
  final String? groupAvatar;
  final String? lastMessage;
  final DateTime? lastMessageTime;

  const ChatViewModel({
    required this.chatId,
    required this.type,
    required this.participants,
    this.groupName,
    this.groupAvatar,
    this.lastMessage,
    this.lastMessageTime,
  });
}
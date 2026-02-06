class MessageViewModel {
  final String messageId;
  final String senderId;
  final String text;
  final DateTime timestamp;
  final String type;
  final bool isRead;

  const MessageViewModel({
    required this.messageId,
    required this.senderId,
    required this.text,
    required this.timestamp,
    this.type = 'text',
    this.isRead = false,
  });
}
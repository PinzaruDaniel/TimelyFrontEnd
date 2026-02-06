part of 'index.dart';
@freezed
abstract class ChatApiDto with _$ChatApiDto {
  const ChatApiDto._();

  const factory ChatApiDto({
    required String chatId,
    required String type,
    required List<String> participants,
    String? groupName,
    String? groupAvatar,
    String? lastMessage,
    DateTime? lastMessageTime,
    String? createdBy,
  }) = _ChatApiDto;

  factory ChatApiDto.fromJson(Map<String, dynamic> json) =>
      _$ChatApiDtoFromJson(json);

  factory ChatApiDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ChatApiDto(
      chatId: doc.id,
      type: data['type'] ?? 'direct',
      participants: List<String>.from(data['participants'] ?? []),
      groupName: data['groupName'],
      groupAvatar: data['groupAvatar'],
      lastMessage: data['lastMessage'],
      lastMessageTime: (data['lastMessageTime'] as Timestamp?)?.toDate(),
      createdBy: data['createdBy'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'type': type,
      'participants': participants,
      if (groupName != null) 'groupName': groupName,
      if (groupAvatar != null) 'groupAvatar': groupAvatar,
      if (lastMessage != null) 'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime != null
          ? Timestamp.fromDate(lastMessageTime!)
          : FieldValue.serverTimestamp(),
      if (createdBy != null) 'createdBy': createdBy,
    };
  }
  ChatEntity toEntity() {
    return ChatEntity(
      chatId: chatId,
      type: type,
      participants: participants,
      groupName: groupName,
      groupAvatar: groupAvatar,
      lastMessage: lastMessage,
      lastMessageTime: lastMessageTime,
      createdBy: createdBy,
    );
  }

}
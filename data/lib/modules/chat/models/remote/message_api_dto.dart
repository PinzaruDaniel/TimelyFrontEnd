part of 'index.dart';
@freezed
abstract class MessageApiDto with _$MessageApiDto {
  const MessageApiDto._();

  const factory MessageApiDto({
    required String messageId,
    required String senderId,
    required String text,
    required DateTime timestamp,
    @Default('text') String type,
    @Default([]) List<String> readBy,
  }) = _MessageApiDto;

  factory MessageApiDto.fromJson(Map<String, dynamic> json) =>
      _$MessageApiDtoFromJson(json);

  factory MessageApiDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MessageApiDto(
      messageId: doc.id,
      senderId: data['senderId'] ?? '',
      text: data['text'] ?? '',
      timestamp: (data['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
      type: data['type'] ?? 'text',
      readBy: List<String>.from(data['readBy'] ?? []),
    );
  }
//todo: to move these into mapper
  Map<String, dynamic> toFirestore() {
    return {
      'senderId': senderId,
      'text': text,
      'timestamp': Timestamp.fromDate(timestamp),
      'type': type,
      'readBy': readBy,
    };
  }

  MessageEntity toEntity() {
    return MessageEntity(
      messageId: messageId,
      senderId: senderId,
      text: text,
      timestamp: timestamp,
      type: type,
      readBy: readBy,
    );
  }
}
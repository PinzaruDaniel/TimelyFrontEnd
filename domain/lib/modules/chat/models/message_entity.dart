part of 'index.dart';

@freezed
abstract class MessageEntity with _$MessageEntity {
  const factory MessageEntity({
    required String messageId,
    required String senderId,
    required String text,
    required DateTime timestamp,
    @Default('text') String type,
    @Default([]) List<String> readBy,
  }) = _MessageEntity;
}
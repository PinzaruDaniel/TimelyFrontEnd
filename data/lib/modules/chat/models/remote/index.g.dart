// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatApiDto _$ChatApiDtoFromJson(Map<String, dynamic> json) => _ChatApiDto(
  chatId: json['chatId'] as String,
  type: json['type'] as String,
  participants: (json['participants'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  groupName: json['groupName'] as String?,
  groupAvatar: json['groupAvatar'] as String?,
  lastMessage: json['lastMessage'] as String?,
  lastMessageTime: json['lastMessageTime'] == null
      ? null
      : DateTime.parse(json['lastMessageTime'] as String),
  createdBy: json['createdBy'] as String?,
);

Map<String, dynamic> _$ChatApiDtoToJson(_ChatApiDto instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'type': instance.type,
      'participants': instance.participants,
      'groupName': instance.groupName,
      'groupAvatar': instance.groupAvatar,
      'lastMessage': instance.lastMessage,
      'lastMessageTime': instance.lastMessageTime?.toIso8601String(),
      'createdBy': instance.createdBy,
    };

_MessageApiDto _$MessageApiDtoFromJson(Map<String, dynamic> json) =>
    _MessageApiDto(
      messageId: json['messageId'] as String,
      senderId: json['senderId'] as String,
      text: json['text'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      type: json['type'] as String? ?? 'text',
      readBy:
          (json['readBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MessageApiDtoToJson(_MessageApiDto instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'senderId': instance.senderId,
      'text': instance.text,
      'timestamp': instance.timestamp.toIso8601String(),
      'type': instance.type,
      'readBy': instance.readBy,
    };

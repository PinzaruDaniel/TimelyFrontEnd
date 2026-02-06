import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/remote/index.dart';

abstract class FirebaseChatDataSource {
  Future<String> createDirectChat(String userId1, String userId2);

  Future<String> createGroupChat({
    required String groupName,
    required List<String> participants,
    required String createdBy,
    String? groupAvatar,
  });

  Future<void> sendMessage({required String chatId, required String senderId, required String text, String type});

  Stream<List<ChatApiDto>> getUserChats(String userId);

  Stream<List<MessageApiDto>> getChatMessages(String chatId);

  Future<void> markMessageAsRead(String chatId, String messageId, String userId);
}

class FirebaseChatDataSourceImpl implements FirebaseChatDataSource {
  final FirebaseFirestore firestore;

  FirebaseChatDataSourceImpl({required this.firestore});

  @override
  Future<String> createDirectChat(String userId1, String userId2) async {
    final existingChat = await firestore
        .collection('chats')
        .where('type', isEqualTo: 'direct')
        .where('participants', arrayContains: userId1)
        .get();

    for (var doc in existingChat.docs) {
      List participants = doc.data()['participants'];
      if (participants.contains(userId2)) {
        return doc.id;
      }
    }

    // Create new chat
    final chatRef = await firestore.collection('chats').add({
      'type': 'direct',
      'participants': [userId1, userId2],
      'lastMessage': null,
      'lastMessageTime': FieldValue.serverTimestamp(),
    });

    return chatRef.id;
  }

  @override
  Future<String> createGroupChat({
    required String groupName,
    required List<String> participants,
    required String createdBy,
    String? groupAvatar,
  }) async {
    final chatRef = await firestore.collection('chats').add({
      'type': 'group',
      'groupName': groupName,
      'participants': participants,
      'createdBy': createdBy,
      'groupAvatar': groupAvatar,
      'lastMessage': null,
      'lastMessageTime': FieldValue.serverTimestamp(),
    });

    return chatRef.id;
  }

  @override
  Future<void> sendMessage({
    required String chatId,
    required String senderId,
    required String text,
    String type = 'text',
  }) async {
    await firestore.collection('messages').doc(chatId).collection('messages').add({
      'senderId': senderId,
      'text': text,
      'timestamp': FieldValue.serverTimestamp(),
      'type': type,
      'readBy': [senderId],
    });

    await firestore.collection('chats').doc(chatId).update({
      'lastMessage': text,
      'lastMessageTime': FieldValue.serverTimestamp(),
    });
  }

  @override
  Stream<List<ChatApiDto>> getUserChats(String userId) {
    return firestore
        .collection('chats')
        .where('participants', arrayContains: userId)
        .orderBy('lastMessageTime', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => ChatApiDto.fromFirestore(doc)).toList());
  }

  @override
  Stream<List<MessageApiDto>> getChatMessages(String chatId) {
    return firestore
        .collection('messages')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => MessageApiDto.fromFirestore(doc)).toList());
  }

  @override
  Future<void> markMessageAsRead(String chatId, String messageId, String userId) async {
    await firestore.collection('messages').doc(chatId).collection('messages').doc(messageId).update({
      'readBy': FieldValue.arrayUnion([userId]),
    });
  }
}

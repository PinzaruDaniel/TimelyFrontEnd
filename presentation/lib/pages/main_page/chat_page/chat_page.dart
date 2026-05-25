import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/main_page/chat_page/chat_controller.dart';
import 'package:presentation/pages/main_page/chat_page/chat_media_utils.dart';

import '../../../util/widgets/text_form_field_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatController _controller = Get.put(ChatController.fromDi());
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final groupId = userProfileController.userViewModel.value?.groupId ?? '';
    _controller.loadGroupUsers(groupId);
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    final senderId = userProfileController.userViewModel.value?.id ?? '';
    if (senderId.isEmpty) return;

    _controller.sendActiveChatMessage(senderId: senderId, text: text);
    _messageController.clear();
  }



  @override
  Widget build(BuildContext context) {
    final currentUserId = userProfileController.userViewModel.value?.id ?? '';
    final groupId = userProfileController.userViewModel.value?.groupId ?? '';
    final currentUserName = userProfileController.userViewModel.value?.fullName ?? '';
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Obx(() {
            if (_controller.isLoadingGroupUsers.value) {
              return const Padding(padding: EdgeInsets.all(16), child: CircularProgressIndicator());
            }
            final error = _controller.groupUsersError.value;
            if (error != null && error.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Text(error, style: const TextStyle(color: Colors.red)),
              );
            }
            if (_controller.groupUsers.isEmpty) {
              return const Padding(padding: EdgeInsets.all(16), child: Text('No group members found.'));
            }
            return SizedBox(
              height: 160,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: _controller.groupUsers.length + 1,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return InkWell(
                      onTap: currentUserId.isEmpty || groupId.isEmpty
                          ? null
                          : () async {
                              final chatId = await _controller.createGroupChat(
                                groupId: groupId,
                                createdBy: currentUserId,
                              );
                              await _controller.selectChat(chatId);
                            },
                      child: Container(
                        width: 160,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Group Chat',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              groupId.isEmpty ? 'Missing group id' : 'All members',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            const Spacer(),
                            Row(
                              children: const [
                                Icon(Icons.groups_outlined, size: 18),
                                SizedBox(width: 6),
                                Text('Open', style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  final user = _controller.groupUsers[index - 1];
                  return InkWell(
                    onTap: currentUserId.isEmpty || user.id == currentUserId
                        ? null
                        : () async {
                            final chatId = await _controller.createDirectChat(
                              currentUserId: currentUserId,
                              otherUserId: user.id,
                            );
                            await _controller.selectChat(chatId);
                          },
                    child: Container(
                      width: 160,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user.fullName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            user.email,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const Spacer(),
                          Row(
                            children: const [
                              Icon(Icons.chat_bubble_outline, size: 18),
                              SizedBox(width: 6),
                              Text('Chat', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
          Obx(() {
            final token = _controller.fcmToken.value;
            if (token == null || token.isEmpty) return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Text(
                'FCM token: $token',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }),
          Expanded(
            child: Obx(() {
              if (_controller.activeChatId.value == null) {
                return const Center(child: Text('Select a user to start chatting'));
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemCount: _controller.chatMessages.length,
                itemBuilder: (context, index) {
                  final message = _controller.chatMessages[index];
                  final isMe = message.senderId == currentUserId;
                  final senderName = isMe
                      ? (currentUserName.isEmpty ? 'You' : currentUserName)
                      : _controller.groupUsers.firstWhereOrNull((user) => user.id == message.senderId)?.fullName ??
                            'Unknown';
                  final timestampLabel = formatMessageTimestamp(message.timestamp);
                  return Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue.shade100 : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(senderName, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                          const SizedBox(height: 4),
                          Text(message.text),
                          const SizedBox(height: 4),
                          Text(timestampLabel, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormFieldWidget(
                      item: TextFieldViewItem(controller: _messageController, hintText: 'Type a message'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(onPressed: _sendMessage, icon: const Icon(Icons.send_rounded)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

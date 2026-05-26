import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/main_page/chat_page/chat_controller.dart';
import 'package:presentation/pages/main_page/chat_page/chat_media_utils.dart';
import 'package:presentation/util/resources/app_colors.dart';

import '../../../util/widgets/main_circular_progress_indicator_widget.dart';
import '../../../util/widgets/text_form_field_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatController _controller = Get.put(ChatController.fromDi());
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _chatScrollController = ScrollController();
  final FocusNode _messageFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final groupId = userProfileController.userViewModel.value?.groupId ?? '';
    _controller.loadGroupUsers(groupId);
    _messageFocusNode.addListener(() {
      if (_messageFocusNode.hasFocus) {
        _scrollToBottom();
      }
    });
  }

  @override
  void dispose() {
    _messageFocusNode.dispose();
    _chatScrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_chatScrollController.hasClients) return;
      _chatScrollController.animateTo(
        _chatScrollController.position.maxScrollExtent +400 ,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    final senderId = userProfileController.userViewModel.value?.id ?? '';
    if (senderId.isEmpty) return;

    _controller.sendActiveChatMessage(senderId: senderId, text: text);
    _messageController.clear();
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = userProfileController.userViewModel.value?.id ?? '';
    final groupId = userProfileController.userViewModel.value?.groupId ?? '';
    final currentUserName = userProfileController.userViewModel.value?.fullName ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final type = _controller.activeChatType.value;
          final title = _controller.activeChatTitle.value;
          if (type == 'group' && title != null && title.isNotEmpty) {
            return Text('Group chat');
          }
          if (type == 'direct' && title != null && title.isNotEmpty) {
            return Text('Chat with $title');
          }
          return const Text('Chat');
        }),
      ),
      body: Column(
        children: [
          Obx(() {
            if (_controller.isLoadingGroupUsers.value) {
              return const Padding(padding: EdgeInsets.all(16), child: MainCircularProgressIndicatorWidget());
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
              height: 120.h,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: _controller.groupUsers.length + 1,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    final isSelected = _controller.activeChatType.value == 'group';
                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: currentUserId.isEmpty || groupId.isEmpty
                          ? null
                          : () async {
                              final chatId = await _controller.createGroupChat(
                                groupId: groupId,
                                createdBy: currentUserId,
                              );
                              _controller.setActiveChatContext(type: 'group', title: groupId);
                              await _controller.selectChat(chatId);
                              setState(() {});
                            },
                      child: Ink(
                        width: 160.w,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryBlue.withAlpha(20) : Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? AppColors.primaryBlue : Colors.blue.shade200,
                            width: isSelected ? 2 : 1,
                          ),
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
                  final isSelected =
                      _controller.activeChatType.value == 'direct' && _controller.activeChatPeerId.value == user.id;
                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: currentUserId.isEmpty || user.id == currentUserId
                        ? null
                        : () async {
                            final chatId = await _controller.createDirectChat(
                              currentUserId: currentUserId,
                              otherUserId: user.id,
                            );
                            _controller.setActiveChatContext(type: 'direct', title: user.fullName, peerId: user.id);
                            await _controller.selectChat(chatId);
                            setState(() {});
                          },
                    child: Container(
                      width: 160.w,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primaryBlue.withAlpha(20) : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? AppColors.primaryBlue : Colors.grey.shade300,
                          width: isSelected ? 2 : 1,
                        ),
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
          Expanded(
            child: Obx(() {
              if (_controller.activeChatId.value == null) {
                return const Center(child: Text('Select a user to start chatting'));
              }
              return ListView.builder(
                controller: _chatScrollController,
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
                      item: TextFieldViewItem(
                        controller: _messageController,
                        hintText: 'Type a message',
                        focusNode: _messageFocusNode,
                      ),
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

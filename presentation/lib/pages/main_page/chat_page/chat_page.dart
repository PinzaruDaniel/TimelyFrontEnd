import 'dart:async';
import 'dart:io';

import 'package:domain/modules/chat/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_liquid_glass_kit/flutter_liquid_glass_kit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/main_page/chat_page/chat_controller.dart';
import 'package:presentation/pages/main_page/chat_page/chat_media_utils.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/view_models/user_profile_view_model.dart';
import 'package:transfer_manager/transfer_manager.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  static const _composerGlass = LiquidGlassSettings(
    tintColor: Colors.white,
    tintOpacity: 0.84,
    blurSigma: 22,
    androidBlurSigma: 8,
    borderOpacity: 0.7,
    shadowOpacity: 0.08,
    shadowBlurRadius: 14,
  );

  final ChatController _controller = Get.put(ChatController.fromDi());
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _chatScrollController = ScrollController();
  final FocusNode _messageFocusNode = FocusNode();
  final ImagePicker _imagePicker = ImagePicker();
  final Map<String, double?> _downloadProgress = {};
  final Set<String> _downloadingMessageIds = {};

  late final TransferManager _transferManager;
  late final Future<void> _transferReady;
  late final Worker _messagesWorker;
  bool _hasMessageFocus = false;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _transferManager = TransferManager();
    _transferReady = _transferManager.initialize();
    _messagesWorker = ever(_controller.chatMessages, (_) => _scrollToBottom());
    _messageFocusNode.addListener(_onMessageFocusChange);
    final groupId = userProfileController.userViewModel.value?.groupId ?? '';
    _controller.loadGroupUsers(groupId);
  }

  @override
  void dispose() {
    _messagesWorker.dispose();
    _messageFocusNode.removeListener(_onMessageFocusChange);
    _messageFocusNode.dispose();
    _chatScrollController.dispose();
    _messageController.dispose();
    unawaited(_transferManager.close());
    super.dispose();
  }

  void _onMessageFocusChange() {
    final hasFocus = _messageFocusNode.hasFocus;
    if (_hasMessageFocus != hasFocus && mounted) {
      setState(() => _hasMessageFocus = hasFocus);
    }
    if (hasFocus) {
      unawaited(_scrollToBottom());
    }
  }

  Future<void> _scrollToBottom() async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    if (!mounted || !_chatScrollController.hasClients) return;
    await _chatScrollController.animateTo(
      _chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _sendMessage() async {
    final text = _messageController.text.trim();
    final senderId = userProfileController.userViewModel.value?.id ?? '';
    if (text.isEmpty ||
        senderId.isEmpty ||
        _controller.activeChatId.value == null) {
      return;
    }

    _messageController.clear();
    setState(() {});
    await _controller.sendActiveChatMessage(senderId: senderId, text: text);
    await _scrollToBottom();
  }

  Future<void> _pickAttachment() async {
    if (_controller.activeChatId.value == null || _isUploading) return;
    final mediaType = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 38,
                height: 4,
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                  color: AppColors.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Share with chat',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),
              _AttachmentOption(
                icon: Icons.photo_library_rounded,
                color: AppColors.primaryBlue,
                title: 'Photo',
                subtitle: 'Choose from your library',
                onTap: () => Navigator.pop(context, 'image'),
              ),
              _AttachmentOption(
                icon: Icons.videocam_rounded,
                color: const Color(0xFF7C3AED),
                title: 'Video',
                subtitle: 'Share a video clip',
                onTap: () => Navigator.pop(context, 'video'),
              ),
            ],
          ),
        ),
      ),
    );
    if (mediaType == null || !mounted) {
      return;
    }

    final file = mediaType == 'video'
        ? await _imagePicker.pickVideo(source: ImageSource.gallery)
        : await _imagePicker.pickImage(
            source: ImageSource.gallery,
            imageQuality: 88,
          );
    if (file == null || !mounted) return;

    final senderId = userProfileController.userViewModel.value?.id ?? '';
    if (senderId.isEmpty) return;
    setState(() => _isUploading = true);
    try {
      await _controller.sendActiveChatMedia(
        senderId: senderId,
        filePath: file.path,
        mediaType: mediaType,
      );
      await _scrollToBottom();
    } finally {
      if (mounted) setState(() => _isUploading = false);
    }
  }

  String _downloadFileName(MessageEntity message, Uri uri) {
    final sourceName = uri.pathSegments.isEmpty ? '' : uri.pathSegments.last;
    final extensionMatch = RegExp(
      r'\.[a-zA-Z0-9]{1,8}$',
    ).firstMatch(sourceName);
    final extension =
        extensionMatch?.group(0) ?? (message.type == 'video' ? '.mp4' : '.jpg');
    return 'timely-${message.messageId}$extension';
  }

  Future<void> _downloadMedia(MessageEntity message) async {
    final mediaUrl = message.mediaUrl;
    if (mediaUrl == null ||
        _downloadingMessageIds.contains(message.messageId)) {
      return;
    }
    final source = Uri.tryParse(mediaUrl);
    if (source == null || !source.hasScheme) {
      return;
    }

    setState(() {
      _downloadingMessageIds.add(message.messageId);
      _downloadProgress[message.messageId] = null;
    });

    StreamSubscription<TransferEvent>? subscription;
    try {
      await _transferReady;
      final fileName = _downloadFileName(message, source);
      final destination = '${Directory.systemTemp.path}/$fileName';
      final task = await _transferManager.enqueue(
        DownloadRequest(
          source: source,
          destination: TransferDestination.file(destination),
          existingFilePolicy: ExistingFilePolicy.replace,
          priority: TransferPriority.high,
        ),
      );
      final terminalEvent = Completer<TransferEvent>();
      subscription = task.events.listen((event) {
        if (mounted) {
          setState(
            () =>
                _downloadProgress[message.messageId] = event.progress.fraction,
          );
        }
        if ((event.state == TransferState.completed ||
                event.state == TransferState.failed ||
                event.state == TransferState.cancelled) &&
            !terminalEvent.isCompleted) {
          terminalEvent.complete(event);
        }
      });

      final event = await terminalEvent.future;
      if (!mounted) return;
      if (event.state == TransferState.completed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Attachment downloaded to $destination')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Download failed: ${event.error ?? event.state.name}',
            ),
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Download failed: $error')));
      }
    } finally {
      await subscription?.cancel();
      if (mounted) {
        setState(() {
          _downloadingMessageIds.remove(message.messageId);
          _downloadProgress.remove(message.messageId);
        });
      }
    }
  }

  Future<void> _openGroupChat(String currentUserId, String groupId) async {
    if (currentUserId.isEmpty || groupId.isEmpty) return;
    final chatId = await _controller.createGroupChat(
      groupId: groupId,
      createdBy: currentUserId,
    );
    _controller.setActiveChatContext(type: 'group', title: 'Class group');
    await _controller.selectChat(chatId);
    await _scrollToBottom();
  }

  Future<void> _openDirectChat(
    String currentUserId,
    UserProfileViewModel user,
  ) async {
    if (currentUserId.isEmpty || user.id == currentUserId) return;
    final chatId = await _controller.createDirectChat(
      currentUserId: currentUserId,
      otherUserId: user.id,
    );
    _controller.setActiveChatContext(
      type: 'direct',
      title: user.fullName,
      peerId: user.id,
    );
    await _controller.selectChat(chatId);
    await _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final profile = userProfileController.userViewModel.value;
    final currentUserId = profile?.id ?? '';
    final currentUserName = profile?.fullName ?? '';
    final groupId = profile?.groupId ?? '';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF4FAFF), Color(0xFFF8FAFC), Color(0xFFF0FDFA)],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              _buildHeader(),
              _buildPeopleRail(currentUserId, groupId),
              _buildErrorBanner(),
              Expanded(child: _buildMessages(currentUserId, currentUserName)),
              _buildComposer(),
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                height: _hasMessageFocus ? 8 : 86,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 16, 8),
      child: Row(
        children: [
          Expanded(
            child: Obx(() {
              final title = _controller.activeChatTitle.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Messages',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.7,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    title ?? 'Choose a conversation',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              );
            }),
          ),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withAlpha(18),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.mark_unread_chat_alt_rounded,
              color: AppColors.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeopleRail(String currentUserId, String groupId) {
    return Obx(() {
      if (_controller.isLoadingGroupUsers.value) {
        return const SizedBox(
          height: 88,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primaryBlue,
            ),
          ),
        );
      }

      return SizedBox(
        height: 96,
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 10),
          scrollDirection: Axis.horizontal,
          itemCount: _controller.groupUsers.length + 1,
          separatorBuilder: (_, _) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            if (index == 0) {
              return _ConversationAvatar(
                label: 'Class',
                icon: Icons.groups_rounded,
                selected: _controller.activeChatType.value == 'group',
                onTap: () => _openGroupChat(currentUserId, groupId),
              );
            }
            final user = _controller.groupUsers[index - 1];
            return _ConversationAvatar(
              label: _firstName(user.fullName),
              initials: _initials(user.fullName),
              selected:
                  _controller.activeChatType.value == 'direct' &&
                  _controller.activeChatPeerId.value == user.id,
              onTap: () => _openDirectChat(currentUserId, user),
            );
          },
        ),
      );
    });
  }

  Widget _buildErrorBanner() {
    return Obx(() {
      final error = _controller.groupUsersError.value;
      if (error == null || error.isEmpty) return const SizedBox.shrink();
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(18, 0, 18, 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        decoration: BoxDecoration(
          color: AppColors.error.withAlpha(18),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.info_outline_rounded,
              color: AppColors.error,
              size: 18,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                error,
                style: const TextStyle(color: AppColors.error, fontSize: 12),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildMessages(String currentUserId, String currentUserName) {
    return Obx(() {
      if (_controller.activeChatId.value == null) {
        return const _ChatEmptyState(
          icon: Icons.forum_outlined,
          title: 'Your class is here',
          subtitle:
              'Pick the class group or a classmate above to start talking.',
        );
      }
      if (_controller.chatMessages.isEmpty) {
        return const _ChatEmptyState(
          icon: Icons.waving_hand_rounded,
          title: 'Start the conversation',
          subtitle: 'Send the first message or share a photo from class.',
        );
      }

      return ListView.builder(
        controller: _chatScrollController,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: _controller.chatMessages.length,
        itemBuilder: (context, index) {
          final message = _controller.chatMessages[index];
          final isMe = message.senderId == currentUserId;
          final senderName = isMe
              ? (currentUserName.isEmpty ? 'You' : currentUserName)
              : _controller.groupUsers
                        .firstWhereOrNull((user) => user.id == message.senderId)
                        ?.fullName ??
                    'Classmate';
          return _MessageBubble(
            message: message,
            isMe: isMe,
            senderName: senderName,
            isDownloading: _downloadingMessageIds.contains(message.messageId),
            downloadProgress: _downloadProgress[message.messageId],
            onDownload: () => _downloadMedia(message),
          );
        },
      );
    });
  }

  Widget _buildComposer() {
    return Obx(() {
      final hasChat = _controller.activeChatId.value != null;
      return LiquidGlassCard(
        settings: _composerGlass,
        margin: const EdgeInsets.fromLTRB(12, 6, 12, 4),
        padding: const EdgeInsets.fromLTRB(8, 7, 7, 7),
        borderRadius: BorderRadius.circular(26),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              tooltip: 'Add attachment',
              onPressed: hasChat && !_isUploading ? _pickAttachment : null,
              icon: _isUploading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primaryCian,
                      ),
                    )
                  : const Icon(Icons.add_circle_rounded),
              color: AppColors.primaryCian,
            ),
            Expanded(
              child: LiquidGlassTextField(
                controller: _messageController,
                focusNode: _messageFocusNode,
                enabled: hasChat,
                settings: _composerGlass.copyWith(
                  tintOpacity: 0.36,
                  shadowOpacity: 0,
                ),
                minLines: 1,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.newline,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(
                  hintText: 'Message…',
                  border: InputBorder.none,
                  isDense: true,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 11,
                ),
                borderRadius: BorderRadius.circular(19),
              ),
            ),
            const SizedBox(width: 7),
            SizedBox(
              width: 44,
              height: 44,
              child: IconButton.filled(
                tooltip: 'Send message',
                onPressed: hasChat && _messageController.text.trim().isNotEmpty
                    ? _sendMessage
                    : null,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  disabledBackgroundColor: AppColors.disabled.withAlpha(130),
                ),
                icon: const Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _ConversationAvatar extends StatelessWidget {
  const _ConversationAvatar({
    required this.label,
    required this.selected,
    required this.onTap,
    this.icon,
    this.initials,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final IconData? icon;
  final String? initials;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: '$label conversation',
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: SizedBox(
          width: 62,
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  gradient: selected
                      ? const LinearGradient(
                          colors: [
                            AppColors.primaryBlue,
                            AppColors.primaryCian,
                          ],
                        )
                      : const LinearGradient(
                          colors: [Color(0xFFE8F1FF), Color(0xFFE7FAF7)],
                        ),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: selected
                      ? [
                          BoxShadow(
                            color: AppColors.primaryBlue.withAlpha(45),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                alignment: Alignment.center,
                child: icon != null
                    ? Icon(
                        icon,
                        color: selected ? Colors.white : AppColors.primaryBlue,
                        size: 25,
                      )
                    : Text(
                        initials ?? '?',
                        style: TextStyle(
                          color: selected
                              ? Colors.white
                              : AppColors.primaryBlue,
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
              ),
              const SizedBox(height: 5),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  color: selected
                      ? AppColors.primaryBlue
                      : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({
    required this.message,
    required this.isMe,
    required this.senderName,
    required this.isDownloading,
    required this.downloadProgress,
    required this.onDownload,
  });

  final MessageEntity message;
  final bool isMe;
  final String senderName;
  final bool isDownloading;
  final double? downloadProgress;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    final mediaUrl = message.mediaUrl;
    final hasMedia = mediaUrl != null && mediaUrl.isNotEmpty;
    final bubbleColor = isMe ? AppColors.primaryBlue : Colors.white;
    final foreground = isMe ? Colors.white : AppColors.textPrimary;
    final subtle = isMe ? Colors.white.withAlpha(185) : AppColors.textSecondary;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.78,
        ),
        margin: const EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(hasMedia ? 5 : 12),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: Radius.circular(isMe ? 20 : 6),
            bottomRight: Radius.circular(isMe ? 6 : 20),
          ),
          border: isMe ? null : Border.all(color: AppColors.borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMe)
              Padding(
                padding: EdgeInsets.fromLTRB(
                  hasMedia ? 8 : 0,
                  hasMedia ? 6 : 0,
                  8,
                  4,
                ),
                child: Text(
                  senderName,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.primaryCian,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            if (hasMedia) _buildMedia(context, mediaUrl),
            if (message.text.isNotEmpty)
              Padding(
                padding: EdgeInsets.fromLTRB(
                  hasMedia ? 8 : 0,
                  hasMedia ? 8 : 0,
                  hasMedia ? 8 : 0,
                  0,
                ),
                child: Text(
                  message.text,
                  style: TextStyle(
                    color: foreground,
                    fontSize: 15,
                    height: 1.32,
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                hasMedia ? 8 : 0,
                5,
                hasMedia ? 7 : 0,
                hasMedia ? 4 : 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    formatMessageTimestamp(message.timestamp),
                    style: TextStyle(fontSize: 10, color: subtle),
                  ),
                  if (isMe) ...[
                    const SizedBox(width: 4),
                    Icon(Icons.done_all_rounded, size: 14, color: subtle),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedia(BuildContext context, String mediaUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (message.type == 'image')
            Image.network(
              mediaUrl,
              width: 230,
              height: 160,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) => progress == null
                  ? child
                  : const SizedBox(
                      width: 230,
                      height: 160,
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
              errorBuilder: (_, _, _) => const _MediaPlaceholder(
                icon: Icons.broken_image_outlined,
                label: 'Image unavailable',
              ),
            )
          else
            const _MediaPlaceholder(
              icon: Icons.play_circle_fill_rounded,
              label: 'Video attachment',
            ),
          Positioned(
            right: 8,
            bottom: 8,
            child: Material(
              color: Colors.black.withAlpha(125),
              shape: const CircleBorder(),
              child: IconButton(
                tooltip: 'Download attachment',
                visualDensity: VisualDensity.compact,
                onPressed: isDownloading ? null : onDownload,
                icon: isDownloading
                    ? SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          value: downloadProgress,
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(
                        Icons.download_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MediaPlaceholder extends StatelessWidget {
  const _MediaPlaceholder({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 150,
      color: const Color(0xFF1E293B),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 42),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatEmptyState extends StatelessWidget {
  const _ChatEmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 42),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryBlue.withAlpha(28),
                    AppColors.primaryCian.withAlpha(38),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 34, color: AppColors.primaryBlue),
            ),
            const SizedBox(height: 18),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 7),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AttachmentOption extends StatelessWidget {
  const _AttachmentOption({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: color.withAlpha(20),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right_rounded),
    );
  }
}

String _initials(String name) {
  final parts = name
      .trim()
      .split(RegExp(r'\s+'))
      .where((part) => part.isNotEmpty)
      .toList();
  if (parts.isEmpty) return '?';
  return parts.take(2).map((part) => part[0].toUpperCase()).join();
}

String _firstName(String name) {
  final trimmed = name.trim();
  if (trimmed.isEmpty) return 'User';
  return trimmed.split(RegExp(r'\s+')).first;
}

import 'package:domain/modules/chat/use_cases/create_direct_chat_use_case.dart';
import 'package:domain/modules/chat/use_cases/create_group_chat_use_case.dart';
import 'package:domain/modules/chat/use_cases/get_chat_messages_use_case.dart';
import 'package:domain/modules/chat/use_cases/get_user_chats_use_case.dart';
import 'package:domain/modules/chat/use_cases/mark_message_as_read_use_case.dart';
import 'package:domain/modules/chat/use_cases/send_message_use_case.dart';
import 'package:domain/modules/messaging/use_cases/get_fcm_token_use_case.dart';
import 'package:domain/modules/messaging/use_cases/request_permission_use_case.dart';
import 'package:domain/modules/messaging/use_cases/set_auto_init_use_case.dart';
import 'package:domain/modules/messaging/use_cases/subscribe_to_topic_use_case.dart';
import 'package:domain/modules/messaging/use_cases/unsubscribe_from_topic_use_case.dart';
import 'package:domain/modules/user/use_cases/get_users_by_group_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/mappers/user_mapper.dart';
import 'package:presentation/view_models/user_profile_view_model.dart';
import 'dart:async';
import 'package:domain/modules/chat/models/index.dart';
import 'package:dartz/dartz.dart';
import 'package:common/constants/failure_class.dart';
import 'package:domain/modules/chat/use_cases/upload_chat_media_use_case.dart';

class ChatController extends GetxController {
  final UploadChatMediaUseCase uploadChatMediaUseCase;
  final CreateGroupChatUseCase createGroupChatUseCase;
  final CreateDirectChatUseCase createDirectChatUseCase;
  final GetUsersByGroupUseCase getUsersByGroupUseCase;
  final GetChatMessagesUseCase getChatMessagesUseCase;
  final GetUserChatsUseCase getUserChatsUseCase;
  final MarkMessageAsReadUseCase markMessageAsReadUseCase;
  final SendMessageUseCase sendMessageUseCase;
  final RequestMessagingPermissionUseCase requestMessagingPermissionUseCase;
  final GetFcmTokenUseCase getFcmTokenUseCase;
  final SetAutoInitEnabledUseCase setAutoInitEnabledUseCase;
  final SubscribeToTopicUseCase subscribeToTopicUseCase;
  final UnsubscribeFromTopicUseCase unsubscribeFromTopicUseCase;

  ChatController({
    required this.uploadChatMediaUseCase,
    required this.createGroupChatUseCase,
    required this.createDirectChatUseCase,
    required this.getUsersByGroupUseCase,
    required this.getChatMessagesUseCase,
    required this.getUserChatsUseCase,
    required this.markMessageAsReadUseCase,
    required this.sendMessageUseCase,
    required this.requestMessagingPermissionUseCase,
    required this.getFcmTokenUseCase,
    required this.setAutoInitEnabledUseCase,
    required this.subscribeToTopicUseCase,
    required this.unsubscribeFromTopicUseCase,
  });

  factory ChatController.fromDi() {
    final di = GetIt.instance;
    return ChatController(
      uploadChatMediaUseCase: di<UploadChatMediaUseCase>(),
      createGroupChatUseCase: di<CreateGroupChatUseCase>(),
      createDirectChatUseCase: di<CreateDirectChatUseCase>(),
      getUsersByGroupUseCase: di<GetUsersByGroupUseCase>(),
      getChatMessagesUseCase: di<GetChatMessagesUseCase>(),
      getUserChatsUseCase: di<GetUserChatsUseCase>(),
      markMessageAsReadUseCase: di<MarkMessageAsReadUseCase>(),
      sendMessageUseCase: di<SendMessageUseCase>(),
      requestMessagingPermissionUseCase: di<RequestMessagingPermissionUseCase>(),
      getFcmTokenUseCase: di<GetFcmTokenUseCase>(),
      setAutoInitEnabledUseCase: di<SetAutoInitEnabledUseCase>(),
      subscribeToTopicUseCase: di<SubscribeToTopicUseCase>(),
      unsubscribeFromTopicUseCase: di<UnsubscribeFromTopicUseCase>(),
    );
  }

  final RxnString fcmToken = RxnString();
  final RxList<UserProfileViewModel> groupUsers = <UserProfileViewModel>[].obs;
  final RxBool isLoadingGroupUsers = false.obs;
  final RxnString groupUsersError = RxnString();
  final RxnString activeChatId = RxnString();
  final RxList<MessageEntity> chatMessages = <MessageEntity>[].obs;
  StreamSubscription<Either<Failure, List<MessageEntity>>>? _messagesSub;

  @override
  void onInit() {
    super.onInit();
    _initMessaging();
  }

  @override
  void onClose() {
    _messagesSub?.cancel();
    super.onClose();
  }

  Future<void> _initMessaging() async {
    await setAutoInitEnabledUseCase.call(SetAutoInitParams(enabled: true));
    await requestMessagingPermissionUseCase.call();
    fcmToken.value = await getFcmTokenUseCase.call();
  }

  Future<void> sendMessage({
    required String chatId,
    required String senderId,
    required String text,
  }) {
    return sendMessageUseCase.call(
      SendMessageParams(chatId: chatId, senderId: senderId, text: text),
    );
  }

  Future<void> markMessageAsRead({
    required String chatId,
    required String messageId,
    required String userId,
  }) {
    return markMessageAsReadUseCase.call(
      MarkMessageAsReadParams(chatId: chatId, messageId: messageId, userId: userId),
    );
  }

  Future<void> subscribeToTopic(String topic) {
    return subscribeToTopicUseCase.call(SubscribeToTopicParams(topic: topic));
  }

  Future<void> unsubscribeFromTopic(String topic) {
    return unsubscribeFromTopicUseCase.call(UnsubscribeFromTopicParams(topic: topic));
  }

  Future<void> loadGroupUsers(String groupId) async {
    if (groupId.isEmpty) {
      groupUsersError.value = 'Missing group id';
      return;
    }

    isLoadingGroupUsers.value = true;
    groupUsersError.value = null;

    final either = await getUsersByGroupUseCase.call(GetUsersByGroupParams(groupId: groupId));
    either.fold(
      (failure) {
        groupUsersError.value = failure.message;
      },
      (users) {
        groupUsers.assignAll(users.map((user) => user.toModel).where((e)=> e.id != userProfileController.userViewModel.value!.id));
      },
    );

    isLoadingGroupUsers.value = false;
  }

  Future<void> selectChat(String chatId) async {
    if (chatId.isEmpty) return;
    if (activeChatId.value == chatId) return;

    activeChatId.value = chatId;
    await _messagesSub?.cancel();
    _messagesSub = getChatMessagesUseCase
        .call(GetChatMessagesParams(chatId: chatId))
        .listen((either) {
      either.fold(
        (failure) {
          groupUsersError.value = failure.message;
        },
        (messages) {
          chatMessages.assignAll(messages);
        },
      );
    });
  }

  Future<String> createDirectChat({
    required String currentUserId,
    required String otherUserId,
  }) {
    return createDirectChatUseCase.call(
      CreateDirectChatParams(userId1: currentUserId, userId2: otherUserId),
    );
  }

  Future<String> createGroupChat({
    required String groupId,
    required String createdBy,
  }) {
    final participants = groupUsers.map((user) => user.id).toSet().toList();
    if (!participants.contains(createdBy)) {
      participants.add(createdBy);
    }
    return createGroupChatUseCase.call(
      CreateGroupChatParams(
        groupName: 'Group $groupId',
        participants: participants,
        createdBy: createdBy,
      ),
    );
  }

  Future<void> sendActiveChatMessage({
    required String senderId,
    required String text,
  }) async {
    final chatId = activeChatId.value;
    if (chatId == null || chatId.isEmpty) return;
    await sendMessageUseCase.call(
      SendMessageParams(chatId: chatId, senderId: senderId, text: text),
    );
  }

  Future<void> sendActiveChatMedia({
    required String senderId,
    required String filePath,
    required String mediaType,
  }) async {
    final chatId = activeChatId.value;
    if (chatId == null || chatId.isEmpty) return;

    final uploadEither = await uploadChatMediaUseCase.call(
      UploadChatMediaParams(
        chatId: chatId,
        senderId: senderId,
        filePath: filePath,
        mediaType: mediaType,
      ),
    );

    await uploadEither.fold(
      (failure) async {
        groupUsersError.value = failure.message;
      },
      (url) async {
        await sendMessageUseCase.call(
          SendMessageParams(
            chatId: chatId,
            senderId: senderId,
            text: '',
            type: mediaType,
            mediaUrl: url,
          ),
        );
      },
    );
  }
}
import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/auth/use_cases/auth_login_use_case.dart';
import 'package:domain/modules/auth/use_cases/auth_logout_use_case.dart';
import 'package:domain/modules/auth/use_cases/auth_register_use_case.dart';
import 'package:domain/modules/auth/use_cases/auth_reset_password_use_case.dart';
import 'package:domain/modules/auth/use_cases/delete_tokens_use_case.dart';
import 'package:domain/modules/chat/chat_repository.dart';
import 'package:domain/modules/chat/use_cases/create_direct_chat_use_case.dart';
import 'package:domain/modules/chat/use_cases/create_group_chat_use_case.dart';
import 'package:domain/modules/chat/use_cases/get_chat_messages_use_case.dart';
import 'package:domain/modules/chat/use_cases/get_user_chats_use_case.dart';
import 'package:domain/modules/chat/use_cases/mark_message_as_read_use_case.dart';
import 'package:domain/modules/chat/use_cases/send_message_use_case.dart';
import 'package:domain/modules/chat/use_cases/upload_chat_media_use_case.dart';
import 'package:domain/modules/homework/homework_repository.dart';
import 'package:domain/modules/homework/use_cases/add_homework_use_case.dart';
import 'package:domain/modules/homework/use_cases/get_homeworks_from_cache_use_case.dart';
import 'package:domain/modules/homework/use_cases/get_homeworks_use_case.dart';
import 'package:domain/modules/homework/use_cases/set_homework_use_case.dart';
import 'package:domain/modules/messaging/messaging_repository.dart';
import 'package:domain/modules/messaging/use_cases/get_fcm_token_use_case.dart';
import 'package:domain/modules/messaging/use_cases/request_permission_use_case.dart';
import 'package:domain/modules/messaging/use_cases/set_auto_init_use_case.dart';
import 'package:domain/modules/messaging/use_cases/subscribe_to_topic_use_case.dart';
import 'package:domain/modules/messaging/use_cases/unsubscribe_from_topic_use_case.dart';
import 'package:domain/modules/schedule/schedule_repository.dart';
import 'package:domain/modules/schedule/use_cases/add_schedule_use_case.dart';
import 'package:domain/modules/schedule/use_cases/get_schedule_from_cache_use_case.dart';
import 'package:domain/modules/schedule/use_cases/get_schedule_use_case.dart';
import 'package:domain/modules/schedule/use_cases/set_schedule_use_case.dart';
import 'package:domain/modules/user/use_cases/get_user_profile_use_case.dart';
import 'package:domain/modules/user/use_cases/get_users_by_group_use_case.dart';
import 'package:domain/modules/user/user_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DomainModule {
  @lazySingleton
  AuthLoginUseCase authLoginUseCase(AuthRepository repository) =>
      AuthLoginUseCase(authRepository: repository);

  @lazySingleton
  AuthRegisterUseCase authRegisterUseCase(AuthRepository repository) =>
      AuthRegisterUseCase(authRepository: repository);

  @lazySingleton
  AuthResetPasswordUseCase authResetPasswordUseCase(
    AuthRepository repository,
  ) => AuthResetPasswordUseCase(authRepository: repository);

  @lazySingleton
  AuthLogoutUseCase authLogoutUseCase(AuthRepository repository) =>
      AuthLogoutUseCase(authRepository: repository);

  @lazySingleton
  DeleteTokensUseCase deleteTokensUseCase(AuthRepository repository) =>
      DeleteTokensUseCase(repository: repository);

  @lazySingleton
  CreateGroupChatUseCase createGroupChatUseCase(ChatRepository repository) =>
      CreateGroupChatUseCase(repository: repository);

  @lazySingleton
  CreateDirectChatUseCase createDirectChatUseCase(ChatRepository repository) =>
      CreateDirectChatUseCase(repository: repository);

  @lazySingleton
  GetChatMessagesUseCase getChatMessagesUseCase(ChatRepository repository) =>
      GetChatMessagesUseCase(repository: repository);

  @lazySingleton
  GetUserChatsUseCase getUserChatsUseCase(ChatRepository repository) =>
      GetUserChatsUseCase(repository: repository);

  @lazySingleton
  MarkMessageAsReadUseCase markMessageAsReadUseCase(
    ChatRepository repository,
  ) => MarkMessageAsReadUseCase(repository: repository);

  @lazySingleton
  SendMessageUseCase sendMessageUseCase(ChatRepository repository) =>
      SendMessageUseCase(repository: repository);

  @lazySingleton
  UploadChatMediaUseCase uploadChatMediaUseCase(ChatRepository repository) =>
      UploadChatMediaUseCase(repository: repository);

  @lazySingleton
  AddHomeworkUseCase addHomeworkUseCase(HomeworkRepository repository) =>
      AddHomeworkUseCase(repository: repository);

  @lazySingleton
  GetHomeworksUseCase getHomeworksUseCase(HomeworkRepository repository) =>
      GetHomeworksUseCase(repository: repository);

  @lazySingleton
  SetHomeworkUseCase setHomeworkUseCase(HomeworkRepository repository) =>
      SetHomeworkUseCase(repository: repository);

  @lazySingleton
  GetHomeworksFromCacheUseCase getHomeworksFromCacheUseCase(
    HomeworkRepository repository,
  ) => GetHomeworksFromCacheUseCase(repository: repository);

  @lazySingleton
  GetScheduleUseCase getScheduleUseCase(ScheduleRepository repository) =>
      GetScheduleUseCase(repository: repository);

  @lazySingleton
  AddScheduleUseCase addScheduleUseCase(ScheduleRepository repository) =>
      AddScheduleUseCase(repository: repository);

  @lazySingleton
  SetScheduleUseCase setScheduleUseCase(ScheduleRepository repository) =>
      SetScheduleUseCase(scheduleRepository: repository);

  @lazySingleton
  GetScheduleFromCacheUseCase getScheduleFromCacheUseCase(
    ScheduleRepository repository,
  ) => GetScheduleFromCacheUseCase(scheduleRepository: repository);

  @lazySingleton
  GetUserProfileUseCase getUserProfileUseCase(UserRepository repository) =>
      GetUserProfileUseCase(repository: repository);

  @lazySingleton
  GetUsersByGroupUseCase getUsersByGroupUseCase(UserRepository repository) =>
      GetUsersByGroupUseCase(repository: repository);

  @lazySingleton
  RequestMessagingPermissionUseCase requestMessagingPermissionUseCase(
    MessagingRepository repository,
  ) => RequestMessagingPermissionUseCase(repository: repository);

  @lazySingleton
  GetFcmTokenUseCase getFcmTokenUseCase(MessagingRepository repository) =>
      GetFcmTokenUseCase(repository: repository);

  @lazySingleton
  SetAutoInitEnabledUseCase setAutoInitEnabledUseCase(
    MessagingRepository repository,
  ) => SetAutoInitEnabledUseCase(repository: repository);

  @lazySingleton
  SubscribeToTopicUseCase subscribeToTopicUseCase(
    MessagingRepository repository,
  ) => SubscribeToTopicUseCase(repository: repository);

  @lazySingleton
  UnsubscribeFromTopicUseCase unsubscribeFromTopicUseCase(
    MessagingRepository repository,
  ) => UnsubscribeFromTopicUseCase(repository: repository);
}

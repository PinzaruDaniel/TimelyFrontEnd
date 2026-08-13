// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:common/constants/session_expired_callback.dart' as _i2;
import 'package:data/core/objectbox_store.dart' as _i456;
import 'package:data/modules/auth/sources/local/auth_local_source.dart'
    as _i145;
import 'package:data/modules/auth/sources/remote/auth_api_service.dart'
    as _i724;
import 'package:data/modules/chat/sources/remote/firebase_chat_data_source.dart'
    as _i1;
import 'package:data/modules/homework/sources/local/homework_local_source.dart'
    as _i991;
import 'package:data/modules/homework/sources/remote/homework_api_service.dart'
    as _i290;
import 'package:data/modules/messaging/sources/remote/firebase_messaging_data_source.dart'
    as _i866;
import 'package:data/modules/schedule/sources/local/schedule_local_source.dart'
    as _i534;
import 'package:data/modules/schedule/sources/remote/schedule_api_service.dart'
    as _i72;
import 'package:data/modules/user/sources/remote/user_api_service.dart'
    as _i459;
import 'package:di/modules/data_module.dart' as _i922;
import 'package:di/modules/domain_module.dart' as _i591;
import 'package:dio/dio.dart' as _i361;
import 'package:domain/modules/auth/auth_repository.dart' as _i736;
import 'package:domain/modules/auth/use_cases/auth_login_use_case.dart'
    as _i908;
import 'package:domain/modules/auth/use_cases/auth_logout_use_case.dart'
    as _i187;
import 'package:domain/modules/auth/use_cases/auth_register_use_case.dart'
    as _i879;
import 'package:domain/modules/auth/use_cases/auth_reset_password_use_case.dart'
    as _i340;
import 'package:domain/modules/auth/use_cases/delete_tokens_use_case.dart'
    as _i344;
import 'package:domain/modules/chat/chat_repository.dart' as _i173;
import 'package:domain/modules/chat/use_cases/create_direct_chat_use_case.dart'
    as _i214;
import 'package:domain/modules/chat/use_cases/create_group_chat_use_case.dart'
    as _i583;
import 'package:domain/modules/chat/use_cases/get_chat_messages_use_case.dart'
    as _i963;
import 'package:domain/modules/chat/use_cases/get_user_chats_use_case.dart'
    as _i60;
import 'package:domain/modules/chat/use_cases/mark_message_as_read_use_case.dart'
    as _i886;
import 'package:domain/modules/chat/use_cases/send_message_use_case.dart'
    as _i348;
import 'package:domain/modules/chat/use_cases/upload_chat_media_use_case.dart'
    as _i701;
import 'package:domain/modules/homework/homework_repository.dart' as _i557;
import 'package:domain/modules/homework/use_cases/add_homework_use_case.dart'
    as _i179;
import 'package:domain/modules/homework/use_cases/get_homeworks_from_cache_use_case.dart'
    as _i549;
import 'package:domain/modules/homework/use_cases/get_homeworks_use_case.dart'
    as _i469;
import 'package:domain/modules/homework/use_cases/set_homework_use_case.dart'
    as _i371;
import 'package:domain/modules/messaging/messaging_repository.dart' as _i562;
import 'package:domain/modules/messaging/use_cases/get_fcm_token_use_case.dart'
    as _i991;
import 'package:domain/modules/messaging/use_cases/request_permission_use_case.dart'
    as _i195;
import 'package:domain/modules/messaging/use_cases/set_auto_init_use_case.dart'
    as _i372;
import 'package:domain/modules/messaging/use_cases/subscribe_to_topic_use_case.dart'
    as _i768;
import 'package:domain/modules/messaging/use_cases/unsubscribe_from_topic_use_case.dart'
    as _i234;
import 'package:domain/modules/schedule/schedule_repository.dart' as _i660;
import 'package:domain/modules/schedule/use_cases/add_schedule_use_case.dart'
    as _i564;
import 'package:domain/modules/schedule/use_cases/get_schedule_from_cache_use_case.dart'
    as _i742;
import 'package:domain/modules/schedule/use_cases/get_schedule_use_case.dart'
    as _i762;
import 'package:domain/modules/schedule/use_cases/set_schedule_use_case.dart'
    as _i89;
import 'package:domain/modules/user/use_cases/get_user_profile_use_case.dart'
    as _i875;
import 'package:domain/modules/user/use_cases/get_users_by_group_use_case.dart'
    as _i654;
import 'package:domain/modules/user/user_repository.dart' as _i200;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:refresh_interceptor/refresh_interceptor.dart' as _i616;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dataModule = _$DataModule();
    final domainModule = _$DomainModule();
    await gh.lazySingletonAsync<_i456.ObjectBoxStore>(
      () => dataModule.objectBoxStore(),
      preResolve: true,
    );
    gh.lazySingleton<_i2.SessionExpiredCallback>(
      () => dataModule.sessionExpiredCallback(),
    );
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => dataModule.firebaseFirestore(),
    );
    gh.lazySingleton<_i892.FirebaseMessaging>(
      () => dataModule.firebaseMessaging(),
    );
    gh.lazySingleton<_i457.FirebaseStorage>(() => dataModule.firebaseStorage());
    gh.lazySingleton<_i145.AuthLocalSource>(
      () => dataModule.authLocalSource(gh<_i456.ObjectBoxStore>()),
    );
    gh.lazySingleton<_i991.HomeworkLocalSource>(
      () => dataModule.homeworkLocalSource(gh<_i456.ObjectBoxStore>()),
    );
    gh.lazySingleton<_i534.ScheduleLocalSource>(
      () => dataModule.scheduleLocalSource(gh<_i456.ObjectBoxStore>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dataModule.authDio(),
      instanceName: 'authDio',
    );
    gh.lazySingleton<_i724.AuthApiService>(
      () => dataModule.authApiService(gh<_i361.Dio>(instanceName: 'authDio')),
    );
    gh.lazySingleton<_i866.FirebaseMessagingDataSource>(
      () =>
          dataModule.firebaseMessagingDataSource(gh<_i892.FirebaseMessaging>()),
    );
    gh.lazySingleton<_i736.AuthRepository>(
      () => dataModule.authRepository(
        gh<_i724.AuthApiService>(),
        gh<_i145.AuthLocalSource>(),
      ),
    );
    gh.lazySingleton<_i616.RefreshInterceptor>(
      () => dataModule.refreshInterceptor(
        gh<_i145.AuthLocalSource>(),
        gh<_i724.AuthApiService>(),
        gh<_i2.SessionExpiredCallback>(),
      ),
    );
    gh.lazySingleton<_i908.AuthLoginUseCase>(
      () => domainModule.authLoginUseCase(gh<_i736.AuthRepository>()),
    );
    gh.lazySingleton<_i879.AuthRegisterUseCase>(
      () => domainModule.authRegisterUseCase(gh<_i736.AuthRepository>()),
    );
    gh.lazySingleton<_i340.AuthResetPasswordUseCase>(
      () => domainModule.authResetPasswordUseCase(gh<_i736.AuthRepository>()),
    );
    gh.lazySingleton<_i187.AuthLogoutUseCase>(
      () => domainModule.authLogoutUseCase(gh<_i736.AuthRepository>()),
    );
    gh.lazySingleton<_i344.DeleteTokensUseCase>(
      () => domainModule.deleteTokensUseCase(gh<_i736.AuthRepository>()),
    );
    gh.lazySingleton<_i1.FirebaseChatDataSource>(
      () => dataModule.firebaseChatDataSource(
        gh<_i974.FirebaseFirestore>(),
        gh<_i457.FirebaseStorage>(),
      ),
    );
    gh.lazySingleton<_i173.ChatRepository>(
      () => dataModule.chatRepository(gh<_i1.FirebaseChatDataSource>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dataModule.appDio(gh<_i616.RefreshInterceptor>()),
      instanceName: 'appDio',
    );
    gh.lazySingleton<_i562.MessagingRepository>(
      () => dataModule.messagingRepository(
        gh<_i866.FirebaseMessagingDataSource>(),
      ),
    );
    gh.lazySingleton<_i583.CreateGroupChatUseCase>(
      () => domainModule.createGroupChatUseCase(gh<_i173.ChatRepository>()),
    );
    gh.lazySingleton<_i214.CreateDirectChatUseCase>(
      () => domainModule.createDirectChatUseCase(gh<_i173.ChatRepository>()),
    );
    gh.lazySingleton<_i963.GetChatMessagesUseCase>(
      () => domainModule.getChatMessagesUseCase(gh<_i173.ChatRepository>()),
    );
    gh.lazySingleton<_i60.GetUserChatsUseCase>(
      () => domainModule.getUserChatsUseCase(gh<_i173.ChatRepository>()),
    );
    gh.lazySingleton<_i886.MarkMessageAsReadUseCase>(
      () => domainModule.markMessageAsReadUseCase(gh<_i173.ChatRepository>()),
    );
    gh.lazySingleton<_i348.SendMessageUseCase>(
      () => domainModule.sendMessageUseCase(gh<_i173.ChatRepository>()),
    );
    gh.lazySingleton<_i701.UploadChatMediaUseCase>(
      () => domainModule.uploadChatMediaUseCase(gh<_i173.ChatRepository>()),
    );
    gh.lazySingleton<_i72.ScheduleApiService>(
      () =>
          dataModule.scheduleApiService(gh<_i361.Dio>(instanceName: 'appDio')),
    );
    gh.lazySingleton<_i290.HomeworkApiService>(
      () =>
          dataModule.homeworkApiService(gh<_i361.Dio>(instanceName: 'appDio')),
    );
    gh.lazySingleton<_i459.UserApiService>(
      () => dataModule.userApiService(gh<_i361.Dio>(instanceName: 'appDio')),
    );
    gh.lazySingleton<_i195.RequestMessagingPermissionUseCase>(
      () => domainModule.requestMessagingPermissionUseCase(
        gh<_i562.MessagingRepository>(),
      ),
    );
    gh.lazySingleton<_i991.GetFcmTokenUseCase>(
      () => domainModule.getFcmTokenUseCase(gh<_i562.MessagingRepository>()),
    );
    gh.lazySingleton<_i372.SetAutoInitEnabledUseCase>(
      () => domainModule.setAutoInitEnabledUseCase(
        gh<_i562.MessagingRepository>(),
      ),
    );
    gh.lazySingleton<_i768.SubscribeToTopicUseCase>(
      () =>
          domainModule.subscribeToTopicUseCase(gh<_i562.MessagingRepository>()),
    );
    gh.lazySingleton<_i234.UnsubscribeFromTopicUseCase>(
      () => domainModule.unsubscribeFromTopicUseCase(
        gh<_i562.MessagingRepository>(),
      ),
    );
    gh.lazySingleton<_i557.HomeworkRepository>(
      () => dataModule.homeworkRepository(
        gh<_i290.HomeworkApiService>(),
        gh<_i991.HomeworkLocalSource>(),
      ),
    );
    gh.lazySingleton<_i660.ScheduleRepository>(
      () => dataModule.scheduleRepository(
        gh<_i72.ScheduleApiService>(),
        gh<_i534.ScheduleLocalSource>(),
      ),
      dispose: _i922.disposeScheduleRepository,
    );
    gh.lazySingleton<_i762.GetScheduleUseCase>(
      () => domainModule.getScheduleUseCase(gh<_i660.ScheduleRepository>()),
    );
    gh.lazySingleton<_i564.AddScheduleUseCase>(
      () => domainModule.addScheduleUseCase(gh<_i660.ScheduleRepository>()),
    );
    gh.lazySingleton<_i89.SetScheduleUseCase>(
      () => domainModule.setScheduleUseCase(gh<_i660.ScheduleRepository>()),
    );
    gh.lazySingleton<_i742.GetScheduleFromCacheUseCase>(
      () => domainModule.getScheduleFromCacheUseCase(
        gh<_i660.ScheduleRepository>(),
      ),
    );
    gh.lazySingleton<_i179.AddHomeworkUseCase>(
      () => domainModule.addHomeworkUseCase(gh<_i557.HomeworkRepository>()),
    );
    gh.lazySingleton<_i469.GetHomeworksUseCase>(
      () => domainModule.getHomeworksUseCase(gh<_i557.HomeworkRepository>()),
    );
    gh.lazySingleton<_i371.SetHomeworkUseCase>(
      () => domainModule.setHomeworkUseCase(gh<_i557.HomeworkRepository>()),
    );
    gh.lazySingleton<_i549.GetHomeworksFromCacheUseCase>(
      () => domainModule.getHomeworksFromCacheUseCase(
        gh<_i557.HomeworkRepository>(),
      ),
    );
    gh.lazySingleton<_i200.UserRepository>(
      () => dataModule.userRepository(gh<_i459.UserApiService>()),
    );
    gh.lazySingleton<_i875.GetUserProfileUseCase>(
      () => domainModule.getUserProfileUseCase(gh<_i200.UserRepository>()),
    );
    gh.lazySingleton<_i654.GetUsersByGroupUseCase>(
      () => domainModule.getUsersByGroupUseCase(gh<_i200.UserRepository>()),
    );
    return this;
  }
}

class _$DataModule extends _i922.DataModule {}

class _$DomainModule extends _i591.DomainModule {}

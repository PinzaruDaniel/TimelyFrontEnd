import 'package:domain/modules/chat/chat_repository.dart';
import 'package:domain/modules/chat/use_cases/create_direct_chat_use_case.dart';
import 'package:domain/modules/chat/use_cases/create_group_chat_use_case.dart';
import 'package:domain/modules/chat/use_cases/get_chat_messages_use_case.dart';
import 'package:domain/modules/chat/use_cases/get_user_chats_use_case.dart';
import 'package:domain/modules/chat/use_cases/mark_message_as_read_use_case.dart';
import 'package:domain/modules/chat/use_cases/send_message_use_case.dart';
import 'package:domain/modules/chat/use_cases/upload_chat_media_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<CreateGroupChatUseCase>(
    () => CreateGroupChatUseCase(repository: dataDi<ChatRepository>()),
  );
  dataDi.registerLazySingleton<CreateDirectChatUseCase>(
    () => CreateDirectChatUseCase(repository: dataDi<ChatRepository>()),
  );
  dataDi.registerLazySingleton<GetChatMessagesUseCase>(
    () => GetChatMessagesUseCase(repository: dataDi<ChatRepository>()),
  );
  dataDi.registerLazySingleton<GetUserChatsUseCase>(() => GetUserChatsUseCase(repository: dataDi<ChatRepository>()));
  dataDi.registerLazySingleton<MarkMessageAsReadUseCase>(
    () => MarkMessageAsReadUseCase(repository: dataDi<ChatRepository>()),
  );
  dataDi.registerLazySingleton<SendMessageUseCase>(() => SendMessageUseCase(repository: dataDi<ChatRepository>()));
  dataDi.registerLazySingleton<UploadChatMediaUseCase>(
    () => UploadChatMediaUseCase(repository: dataDi<ChatRepository>()),
  );
}
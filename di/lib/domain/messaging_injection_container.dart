import 'package:domain/modules/messaging/messaging_repository.dart';
import 'package:domain/modules/messaging/use_cases/get_fcm_token_use_case.dart';
import 'package:domain/modules/messaging/use_cases/request_permission_use_case.dart';
import 'package:domain/modules/messaging/use_cases/set_auto_init_use_case.dart';
import 'package:domain/modules/messaging/use_cases/subscribe_to_topic_use_case.dart';
import 'package:domain/modules/messaging/use_cases/unsubscribe_from_topic_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<RequestMessagingPermissionUseCase>(
    () => RequestMessagingPermissionUseCase(repository: dataDi<MessagingRepository>()),
  );
  dataDi.registerLazySingleton<GetFcmTokenUseCase>(
    () => GetFcmTokenUseCase(repository: dataDi<MessagingRepository>()),
  );
  dataDi.registerLazySingleton<SetAutoInitEnabledUseCase>(
    () => SetAutoInitEnabledUseCase(repository: dataDi<MessagingRepository>()),
  );
  dataDi.registerLazySingleton<SubscribeToTopicUseCase>(
    () => SubscribeToTopicUseCase(repository: dataDi<MessagingRepository>()),
  );
  dataDi.registerLazySingleton<UnsubscribeFromTopicUseCase>(
    () => UnsubscribeFromTopicUseCase(repository: dataDi<MessagingRepository>()),
  );
}

import 'package:data/modules/messaging/sources/remote/firebase_messaging_data_source.dart';
import 'package:domain/modules/messaging/messaging_repository.dart';

class MessagingRepositoryImpl implements MessagingRepository {
  final FirebaseMessagingDataSource dataSource;

  MessagingRepositoryImpl({required this.dataSource});

  @override
  Future<void> requestPermission() {
    return dataSource.requestPermission();
  }

  @override
  Future<void> setAutoInitEnabled(bool enabled) {
    return dataSource.setAutoInitEnabled(enabled);
  }

  @override
  Future<String?> getToken() {
    return dataSource.getToken();
  }

  @override
  Future<void> subscribeToTopic(String topic) {
    return dataSource.subscribeToTopic(topic);
  }

  @override
  Future<void> unsubscribeFromTopic(String topic) {
    return dataSource.unsubscribeFromTopic(topic);
  }
}

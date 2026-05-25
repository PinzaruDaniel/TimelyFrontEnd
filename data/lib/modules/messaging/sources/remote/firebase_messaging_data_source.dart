import 'package:firebase_messaging/firebase_messaging.dart';

abstract class FirebaseMessagingDataSource {
  Future<void> requestPermission();

  Future<void> setAutoInitEnabled(bool enabled);

  Future<String?> getToken();

  Future<void> subscribeToTopic(String topic);

  Future<void> unsubscribeFromTopic(String topic);
}

class FirebaseMessagingDataSourceImpl implements FirebaseMessagingDataSource {
  final FirebaseMessaging messaging;

  FirebaseMessagingDataSourceImpl({required this.messaging});

  @override
  Future<void> requestPermission() async {
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  @override
  Future<void> setAutoInitEnabled(bool enabled) {
    return messaging.setAutoInitEnabled(enabled);
  }

  @override
  Future<String?> getToken() {
    return messaging.getToken();
  }

  @override
  Future<void> subscribeToTopic(String topic) {
    return messaging.subscribeToTopic(topic);
  }

  @override
  Future<void> unsubscribeFromTopic(String topic) {
    return messaging.unsubscribeFromTopic(topic);
  }
}

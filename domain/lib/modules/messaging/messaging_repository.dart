abstract class MessagingRepository {
  Future<void> requestPermission();

  Future<void> setAutoInitEnabled(bool enabled);

  Future<String?> getToken();

  Future<void> subscribeToTopic(String topic);

  Future<void> unsubscribeFromTopic(String topic);
}

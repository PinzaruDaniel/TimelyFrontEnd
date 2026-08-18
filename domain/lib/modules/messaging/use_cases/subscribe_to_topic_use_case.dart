import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/messaging/messaging_repository.dart';

class SubscribeToTopicUseCase
    extends FutureUseCase<void, SubscribeToTopicParams> {
  final MessagingRepository repository;

  SubscribeToTopicUseCase({required this.repository});

  @override
  Future<void> execute(SubscribeToTopicParams params) {
    return repository.subscribeToTopic(params.topic);
  }
}

class SubscribeToTopicParams {
  final String topic;

  SubscribeToTopicParams({required this.topic});
}

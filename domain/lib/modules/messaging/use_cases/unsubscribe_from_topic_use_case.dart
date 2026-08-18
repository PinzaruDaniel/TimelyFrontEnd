import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/messaging/messaging_repository.dart';

class UnsubscribeFromTopicUseCase
    extends FutureUseCase<void, UnsubscribeFromTopicParams> {
  final MessagingRepository repository;

  UnsubscribeFromTopicUseCase({required this.repository});

  @override
  Future<void> execute(UnsubscribeFromTopicParams params) {
    return repository.unsubscribeFromTopic(params.topic);
  }
}

class UnsubscribeFromTopicParams {
  final String topic;

  UnsubscribeFromTopicParams({required this.topic});
}

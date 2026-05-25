import 'package:domain/core/usecase.dart';
import 'package:domain/modules/messaging/messaging_repository.dart';

class UnsubscribeFromTopicUseCase extends UseCaseNoEither<void, UnsubscribeFromTopicParams> {
  final MessagingRepository repository;

  UnsubscribeFromTopicUseCase({required this.repository});

  @override
  Future<void> call(UnsubscribeFromTopicParams params) {
    return repository.unsubscribeFromTopic(params.topic);
  }
}

class UnsubscribeFromTopicParams {
  final String topic;

  UnsubscribeFromTopicParams({required this.topic});
}

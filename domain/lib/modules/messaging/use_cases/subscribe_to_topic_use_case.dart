import 'package:domain/core/usecase.dart';
import 'package:domain/modules/messaging/messaging_repository.dart';

class SubscribeToTopicUseCase extends UseCaseNoEither<void, SubscribeToTopicParams> {
  final MessagingRepository repository;

  SubscribeToTopicUseCase({required this.repository});

  @override
  Future<void> call(SubscribeToTopicParams params) {
    return repository.subscribeToTopic(params.topic);
  }
}

class SubscribeToTopicParams {
  final String topic;

  SubscribeToTopicParams({required this.topic});
}

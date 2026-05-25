import 'package:domain/core/usecase.dart';
import 'package:domain/modules/messaging/messaging_repository.dart';

class RequestMessagingPermissionUseCase extends UseCaseNoEitherNoParamsNoStream<void> {
  final MessagingRepository repository;

  RequestMessagingPermissionUseCase({required this.repository});

  @override
  Future<void> call() {
    return repository.requestPermission();
  }
}

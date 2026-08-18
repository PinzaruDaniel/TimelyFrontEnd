import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/messaging/messaging_repository.dart';

class RequestMessagingPermissionUseCase extends NoParamsFutureUseCase<void> {
  final MessagingRepository repository;

  RequestMessagingPermissionUseCase({required this.repository});

  @override
  Future<void> execute() {
    return repository.requestPermission();
  }
}

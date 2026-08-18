import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/messaging/messaging_repository.dart';

class GetFcmTokenUseCase extends NoParamsFutureUseCase<String?> {
  final MessagingRepository repository;

  GetFcmTokenUseCase({required this.repository});

  @override
  Future<String?> execute() {
    return repository.getToken();
  }
}

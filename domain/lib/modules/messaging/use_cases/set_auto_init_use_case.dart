import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/messaging/messaging_repository.dart';

class SetAutoInitEnabledUseCase extends FutureUseCase<void, SetAutoInitParams> {
  final MessagingRepository repository;

  SetAutoInitEnabledUseCase({required this.repository});

  @override
  Future<void> execute(SetAutoInitParams params) {
    return repository.setAutoInitEnabled(params.enabled);
  }
}

class SetAutoInitParams {
  final bool enabled;

  SetAutoInitParams({required this.enabled});
}

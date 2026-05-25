import 'package:domain/core/usecase.dart';
import 'package:domain/modules/messaging/messaging_repository.dart';

class SetAutoInitEnabledUseCase extends UseCaseNoEither<void, SetAutoInitParams> {
  final MessagingRepository repository;

  SetAutoInitEnabledUseCase({required this.repository});

  @override
  Future<void> call(SetAutoInitParams params) {
    return repository.setAutoInitEnabled(params.enabled);
  }
}

class SetAutoInitParams {
  final bool enabled;

  SetAutoInitParams({required this.enabled});
}

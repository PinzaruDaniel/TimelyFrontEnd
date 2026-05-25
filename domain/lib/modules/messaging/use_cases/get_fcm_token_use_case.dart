import 'package:domain/core/usecase.dart';
import 'package:domain/modules/messaging/messaging_repository.dart';

class GetFcmTokenUseCase extends UseCaseNoEitherNoParamsNoStream<String?> {
  final MessagingRepository repository;

  GetFcmTokenUseCase({required this.repository});

  @override
  Future<String?> call() {
    return repository.getToken();
  }
}

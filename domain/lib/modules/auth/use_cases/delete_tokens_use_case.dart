import 'package:domain/core/usecase.dart';
import 'package:domain/modules/auth/auth_repository.dart';

class DeleteTokensUseCase extends UseCaseNoEitherNoParamsNoStream<void> {
  final AuthRepository repository;

  DeleteTokensUseCase({required this.repository});

  @override
  Future<void> call() async {
    return await repository.deleteTokens();
  }
}

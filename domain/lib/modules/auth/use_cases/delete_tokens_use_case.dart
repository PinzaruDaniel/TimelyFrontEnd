import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/auth/auth_repository.dart';

class DeleteTokensUseCase extends NoParamsFutureUseCase<void> {
  final AuthRepository repository;

  DeleteTokensUseCase({required this.repository});

  @override
  Future<void> execute() async {
    return await repository.deleteTokens();
  }
}

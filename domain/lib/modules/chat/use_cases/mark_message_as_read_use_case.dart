import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/chat/chat_repository.dart';

class MarkMessageAsReadUseCase extends UseCase<void, MarkMessageAsReadParams> {
  final ChatRepository repository;

  MarkMessageAsReadUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(MarkMessageAsReadParams params) async {
    try {
      await repository.markMessageAsRead(params.chatId, params.messageId, params.userId);
      return Right(null);
    } catch (e) {
      return Left(e as Failure);
    }
  }
}

class MarkMessageAsReadParams {
  final String chatId;
  final String messageId;
  final String userId;

  MarkMessageAsReadParams({required this.chatId, required this.messageId, required this.userId});
}

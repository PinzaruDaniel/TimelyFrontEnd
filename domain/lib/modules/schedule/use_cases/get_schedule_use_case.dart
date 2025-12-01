import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/schedule/models/index.dart';
import 'package:uuid/uuid.dart';

import '../schedule_repository.dart';

class GetScheduleUseCase extends UseCase<ScheduleEntity, GetScheduleParams> {
  final ScheduleRepository _repository;

  GetScheduleUseCase(this._repository);

  @override
  Future<Either<Failure, ScheduleEntity>> call(params) {
    return _repository.getSchedule(params.groupId);
  }
}

class GetScheduleParams {
  final Uuid groupId;

  GetScheduleParams(this.groupId);
}

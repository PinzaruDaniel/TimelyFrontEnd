import 'package:domain/core/usecase.dart';
import 'package:domain/modules/schedule/models/index.dart';
import 'package:domain/modules/schedule/schedule_repository.dart';

class GetScheduleFromCacheUseCase extends UseCaseNoEither<ScheduleEntity, GetScheduleFromCacheParams> {
  final ScheduleRepository scheduleRepository;

  GetScheduleFromCacheUseCase({required this.scheduleRepository});

  @override
  Future<ScheduleEntity> call(GetScheduleFromCacheParams params) {
    return scheduleRepository.getScheduleFromCache(params.groupId);
  }
}

class GetScheduleFromCacheParams {
  final String groupId;

  GetScheduleFromCacheParams({required this.groupId});
}

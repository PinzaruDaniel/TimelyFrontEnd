import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/schedule/models/index.dart';
import 'package:domain/modules/schedule/schedule_repository.dart';

class GetScheduleFromCacheUseCase
    extends FutureUseCase<ScheduleEntity, GetScheduleFromCacheParams> {
  final ScheduleRepository scheduleRepository;

  GetScheduleFromCacheUseCase({required this.scheduleRepository});

  @override
  Future<ScheduleEntity> execute(GetScheduleFromCacheParams params) {
    return scheduleRepository.getScheduleFromCache(params.groupId);
  }
}

class GetScheduleFromCacheParams {
  final String groupId;

  GetScheduleFromCacheParams({required this.groupId});
}

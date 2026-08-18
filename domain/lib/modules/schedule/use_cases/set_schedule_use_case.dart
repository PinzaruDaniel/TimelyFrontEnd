import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/schedule/models/index.dart';
import 'package:domain/modules/schedule/schedule_repository.dart';

class SetScheduleUseCase extends FutureUseCase<void, SetScheduleParams> {
  final ScheduleRepository scheduleRepository;

  SetScheduleUseCase({required this.scheduleRepository});

  @override
  Future<void> execute(SetScheduleParams params) async {
    scheduleRepository.setSchedule(params.scheduleEntity);
  }
}

class SetScheduleParams {
  final ScheduleEntity scheduleEntity;

  SetScheduleParams({required this.scheduleEntity});
}

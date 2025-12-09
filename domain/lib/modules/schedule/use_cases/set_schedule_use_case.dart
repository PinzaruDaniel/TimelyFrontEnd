import 'package:domain/core/usecase.dart';
import 'package:domain/modules/schedule/models/index.dart';
import 'package:domain/modules/schedule/schedule_repository.dart';

class SetScheduleUseCase extends UseCaseNoEither<void, SetScheduleParams> {
  final ScheduleRepository scheduleRepository;

  SetScheduleUseCase({required this.scheduleRepository});

  @override
  Future<void> call(SetScheduleParams params) async {
    scheduleRepository.setSchedule(params.scheduleEntity);
  }
}

class SetScheduleParams {
  final ScheduleEntity scheduleEntity;

  SetScheduleParams({required this.scheduleEntity});
}

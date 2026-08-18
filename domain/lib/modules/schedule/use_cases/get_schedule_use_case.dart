import 'package:common/constants/failure_class.dart';
import 'package:smart_domain/smart_domain.dart' hide Failure;
import 'package:domain/modules/schedule/models/index.dart';

import '../schedule_repository.dart';

class GetScheduleUseCase extends UseCase<ScheduleEntity, GetScheduleParams> {
  final ScheduleRepository repository;

  GetScheduleUseCase({required this.repository});

  @override
  Future<Result<ScheduleEntity, Failure>> execute(GetScheduleParams params) {
    return repository.getSchedule(params.groupId);
  }
}

class GetScheduleParams {
  final String groupId;

  GetScheduleParams(this.groupId);
}

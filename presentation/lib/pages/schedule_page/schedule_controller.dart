import 'package:domain/modules/schedule/use_cases/get_schedule_use_case.dart';
import 'package:domain/modules/schedule/use_cases/set_schedule_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mappers/schedule_mapper.dart';
import 'package:presentation/view_models/schedule_view_model.dart';

class ScheduleController extends GetxController {
  GetScheduleUseCase getScheduleUseCase = GetIt.instance<GetScheduleUseCase>();
  SetScheduleUseCase setScheduleUseCase = GetIt.instance<SetScheduleUseCase>();
  Rxn<ScheduleViewModel> scheduleVm = Rxn();

  Future<void> getSchedule() async {
    getScheduleUseCase.call(GetScheduleParams('cb41031e-f64e-484b-a38b-3ac7c6995c38')).then((either) {
      either.fold(
        (failure) {
          print('failure');
        },
        (scheduleEntity) {
          scheduleVm.value = scheduleEntity.toModel;
          print('schedule id: ${scheduleVm.value?.groupId}');
          print('schedule monday: ${scheduleVm.value?.monday[0].subject}');
          print('schedule room: ${scheduleVm.value?.monday[0].room}');
          setScheduleUseCase.call(SetScheduleParams(scheduleEntity: scheduleEntity));

        },
      );
    });
  }
}

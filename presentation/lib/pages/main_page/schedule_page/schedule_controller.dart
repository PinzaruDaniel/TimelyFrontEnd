import 'package:domain/modules/schedule/use_cases/get_schedule_use_case.dart';
import 'package:domain/modules/schedule/use_cases/set_schedule_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/mappers/schedule_mapper.dart';
import 'package:presentation/view_models/schedule_view_model.dart';

class ScheduleController extends GetxController {
  GetScheduleUseCase getScheduleUseCase = GetIt.instance<GetScheduleUseCase>();
  SetScheduleUseCase setScheduleUseCase = GetIt.instance<SetScheduleUseCase>();
  Rxn<ScheduleViewModel> scheduleVm = Rxn();

  Future<void> getSchedule(String groupId) async {
    await userProfileController.getUser();
    getScheduleUseCase(GetScheduleParams(groupId)).then((result) {
      result.fold(
        onFailure: (failure) {
          print('failure');
        },
        onSuccess: (scheduleEntity) {
          scheduleVm.value = scheduleEntity.toModel;
          setScheduleUseCase.call(
            SetScheduleParams(scheduleEntity: scheduleEntity),
          );
        },
      );
    });
  }
}

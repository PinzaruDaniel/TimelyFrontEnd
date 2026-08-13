import 'package:common/constants/logger.dart';
import 'package:domain/modules/schedule/use_cases/get_schedule_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/mappers/schedule_mapper.dart';
import 'package:presentation/view_models/schedule_view_model.dart';

class ScheduleController extends GetxController {
  GetScheduleUseCase getScheduleUseCase = GetIt.instance<GetScheduleUseCase>();
  Rxn<ScheduleViewModel> scheduleVm = Rxn();

  Future<void> getSchedule(String groupId) async {
    await userProfileController.getUser();
    getScheduleUseCase.call(GetScheduleParams(groupId)).then((either) {
      either.fold(
        (failure) {
          consoleLog('Schedule load failed: ${failure.message}');
        },
        (scheduleEntity) {
          scheduleVm.value = scheduleEntity.toModel;
        },
      );
    });
  }
}

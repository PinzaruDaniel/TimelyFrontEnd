import 'package:domain/modules/schedule/use_cases/get_schedule_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

class ScheduleController extends GetxController {
 GetScheduleUseCase getScheduleUseCase=GetIt.instance<GetScheduleUseCase>();

 void getSchedule() {

   getScheduleUseCase.call(GetScheduleParams('cb41031e-f64e-484b-a38b-3ac7c6995c38')).then((either) {
     either.fold(
           (failure) {},
           (scheduleApi) {
         print('schedule id: ${scheduleApi.groupId}');
         print('schedule monday: ${scheduleApi.monday[0].subject}');
         print('schedule room: ${scheduleApi.monday[0].room}');
       },
     );
   });
 }

}
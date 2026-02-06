import 'package:domain/modules/homework/use_cases/get_homeworks_use_case.dart';
import 'package:domain/modules/homework/use_cases/set_homework_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/view_models/homework_view_model.dart';

import '../../util/mappers/homework_mapper.dart';

class HomeworkController extends GetxController {
  GetHomeworksUseCase getHomeworksUseCase = GetIt.instance<GetHomeworksUseCase>();
  SetHomeworkUseCase setHomeworkUseCase = GetIt.instance<SetHomeworkUseCase>();
  RxList<HomeworkViewModel> homeworks = RxList([]);

  void getHomeworks() {
    getHomeworksUseCase.call(GetHomeworksParams(groupId: 'cb41031e-f64e-484b-a38b-3ac7c6995c38')).then((either) {
      either.fold(
        (failure) {
          print('failure: $failure');
        },
        (homeworkList) {
          homeworks.value = homeworkList.map((hw) => hw.toModel).toList();

          print('homeworks count: ${homeworks.length}');
          if (homeworks.isNotEmpty) {
            print('first homework id: ${homeworks[0].homeworkId}');
            print('first homework subject: ${homeworks[0].subject}');
            print('first homework description: ${homeworks[0].description}');
            print('first homework dueDate: ${homeworks[0].dueDate}');
            setHomeworkUseCase.call(SetHomeworkParams(homeworksEntity: homeworkList));
          }
        },
      );
    });
  }
}

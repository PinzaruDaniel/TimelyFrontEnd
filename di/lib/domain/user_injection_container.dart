import 'package:domain/modules/user/use_cases/get_user_profile_use_case.dart';
import 'package:domain/modules/user/use_cases/get_users_by_group_use_case.dart';
import 'package:domain/modules/user/user_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<GetUserProfileUseCase>(
    () => GetUserProfileUseCase(repository: dataDi<UserRepository>()),
  );
  dataDi.registerLazySingleton<GetUsersByGroupUseCase>(
    () => GetUsersByGroupUseCase(repository: dataDi<UserRepository>()),
  );
}
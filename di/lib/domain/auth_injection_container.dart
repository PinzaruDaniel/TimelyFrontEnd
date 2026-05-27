import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/auth/use_cases/auth_login_use_case.dart';
import 'package:domain/modules/auth/use_cases/auth_logout_use_case.dart';
import 'package:domain/modules/auth/use_cases/auth_register_use_case.dart';
import 'package:domain/modules/auth/use_cases/auth_reset_password_use_case.dart';
import 'package:domain/modules/auth/use_cases/delete_tokens_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<AuthLoginUseCase>(() => AuthLoginUseCase(authRepository: dataDi<AuthRepository>()));

  dataDi.registerLazySingleton<AuthRegisterUseCase>(
    () => AuthRegisterUseCase(authRepository: dataDi<AuthRepository>()),
  );

  dataDi.registerLazySingleton<AuthResetPasswordUseCase>(
    () => AuthResetPasswordUseCase(authRepository: dataDi<AuthRepository>()),
  );

  dataDi.registerLazySingleton<AuthLogoutUseCase>(() => AuthLogoutUseCase(authRepository: dataDi<AuthRepository>()));
  dataDi.registerLazySingleton<DeleteTokensUseCase>(() => DeleteTokensUseCase(repository: dataDi<AuthRepository>()));
}

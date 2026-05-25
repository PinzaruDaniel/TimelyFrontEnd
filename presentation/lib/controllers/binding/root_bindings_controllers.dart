import 'package:get/get.dart';
import 'package:presentation/controllers/user_profile_controller.dart';
import '../main_app_controller.dart';

class RootBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<MainAppController>(() async => MainAppController(), permanent: true);
    await Get.putAsync<UserProfileController>(()async => UserProfileController(), permanent: true);
  }
}

import 'package:domain/modules/user/use_cases/get_user_profile_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/view_models/user_profile_view_model.dart';

import '../util/mappers/user_mapper.dart';

class UserProfileController extends GetxController{
  GetUserProfileUseCase getUserProfileUseCase= GetIt.instance<GetUserProfileUseCase>();
  Rxn<UserProfileViewModel> userViewModel=.new();

  Future<void> getUser() async{
    final either= await getUserProfileUseCase.call();
    either.fold(
      (failure) {
        print('Failed to get user profile: $failure');
      },
      (userEntity) {
       userViewModel.value = userEntity.toModel;
        print('User profile loaded: ${userViewModel.value?.fullName}');
      },
    );
  }
}
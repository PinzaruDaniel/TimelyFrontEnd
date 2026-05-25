import 'package:domain/modules/user/models/index.dart';
import 'package:presentation/view_models/user_profile_view_model.dart';

extension UserMapperToModel on UserProfileEntity {
  UserProfileViewModel get toModel => UserProfileViewModel(id: id, fullName: fullName, email: email, groupId: groupId);
}

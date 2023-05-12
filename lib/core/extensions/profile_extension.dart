import '../../modules/profile/data/models/profile_model.dart';
import '../../modules/profile/domain/entities/profile.dart';

extension ProfileExtension on ProfileData {
  ProfileModelData toProfileData() {
    return ProfileModelData(
      name: name,
      email: email,
      phone: phone,
    );
  }
}

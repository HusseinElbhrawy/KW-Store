import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_point.dart';
import '../../../../core/usecase/params/params.dart';
import '../models/faqs_model.dart';
import '../models/notifications_model.dart';
import '../models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  //! Get Profile
  Future<ProfileModel> getProfileData();
  Future<ProfileModel> updateProfileData(UpdateProfileParams profile);
  //! Get Notification
  Future<NotificationsModel> getNotificationData();
  //! Get FAQs
  Future<FaqsModel> getFAQsData();
}

class ProfileRemoteDataSourceImplementation implements ProfileRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ProfileRemoteDataSourceImplementation(this._apiConsumer) {
    EndPoint.selectedBaseUrl = EndPoint.baseUrl;
  }

  @override
  Future<ProfileModel> getProfileData() async {
    final response = await _apiConsumer.get(EndPoint.profile);
    return ProfileModel.fromJson(response.data);
  }

  @override
  Future<ProfileModel> updateProfileData(UpdateProfileParams profile) async {
    final response = await _apiConsumer.put(
      EndPoint.updateProfile,
      body: profile.toMap(),
    );

    return ProfileModel.fromJson(response.data);
  }

  @override
  Future<NotificationsModel> getNotificationData() async {
    final result = await _apiConsumer.get(EndPoint.notifications);
    return NotificationsModel.fromJson(result.data);
  }

  @override
  Future<FaqsModel> getFAQsData() async {
    final result = await _apiConsumer.get(EndPoint.faqs);
    return FaqsModel.fromJson(result.data);
  }
}

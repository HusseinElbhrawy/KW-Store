import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/params/params.dart';
import '../entities/address.dart';
import '../entities/faqs.dart';
import '../entities/notification.dart';
import '../entities/profile.dart';

abstract class ProfileRepository {
  //! Get Profile
  Future<Either<Failure, Profile>> getProfileData();

  //! update Profile
  Future<Either<Failure, Profile>> updateProfileData(
    UpdateProfileParams profile,
  );

  //! Get Notification
  Future<Either<Failure, Notifications>> getNotificationData();

  //! Get FAQs
  Future<Either<Failure, FAQs>> getFAQsData();

  //! Get Address
  Future<Either<Failure, List<Address>>> getAddressData();

  //! Save New Address
  Future<Either<Failure, int>> saveNewAddressData(Address address);

  //! Delete Address
  Future<Either<Failure, Unit>> deleteAddressData(Address address);

  //! Update Address
  Future<Either<Failure, Unit>> updateAddressData(Address address);
}

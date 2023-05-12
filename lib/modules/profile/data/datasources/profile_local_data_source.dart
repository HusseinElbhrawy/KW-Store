import 'package:hive_flutter/hive_flutter.dart';

import '../../../../app/injector.dart';
import '../../../../core/database/i_local_data_base.dart';
import '../../../../core/utils/constant.dart';
import '../../domain/entities/address.dart';
import '../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  //! Get Profile
  Future<ProfileModel> getProfileData();

  //! Save Profile
  Future<void> saveProfileData(ProfileModel profile);

  //! Save New Address
  Future<int> saveNewAddress(Address address);

  //! Delete Address
  Future<void> deleteAddress(Address address);

  //! Update Address
  Future<void> updateAddress(Address address);

  //! Get Address
  Future<List<Address>> getAddress();

  //! Delete All Address
  Future<void> deleteAllAddress();
}

class ProfileLocalDataSourceImplementation implements ProfileLocalDataSource {
  final ILocalDataBase _localDataBase;
  final _value =
      serviceLocator<HiveInterface>().box<Address>(AppConstant.addressDatabase);
  ProfileLocalDataSourceImplementation(
    this._localDataBase,
  );
  @override
  Future<ProfileModel> getProfileData() async {
    return await _localDataBase.get(AppConstant.kProfileKey);
  }

  @override
  Future<void> saveProfileData(ProfileModel profile) async {
    return await _localDataBase.set(
      AppConstant.kProfileKey,
      profile.toString(),
    );
  }

  @override
  Future<void> deleteAddress(Address address) async {
    return await address.delete();
  }

  @override
  Future<List<Address>> getAddress() async {
    return _value.values.toList();
  }

  @override
  Future<int> saveNewAddress(Address address) async {
    return await _value.add(address);
  }

  @override
  Future<void> updateAddress(Address address) async {
    return await address.save();
  }

  @override
  Future<void> deleteAllAddress() async {
    return await _value.deleteAll(_value.keys);
  }
}

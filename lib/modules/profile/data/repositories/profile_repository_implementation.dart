import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network.dart';
import '../../../../core/usecase/params/params.dart';
import '../../domain/entities/address.dart';
import '../../domain/entities/faqs.dart';
import '../../domain/entities/notification.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_data_source.dart';
import '../datasources/profile_remote_data_source.dart';

class ProfileRepositoryImplementation implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;
  final ProfileLocalDataSource _localDataSource;
  final NetworkInformation _information;
  ProfileRepositoryImplementation(
    this._remoteDataSource,
    this._localDataSource,
    this._information,
  );
  @override
  Future<Either<Failure, Profile>> getProfileData() async {
    try {
      final profile = await _remoteDataSource.getProfileData();
      await _localDataSource.saveProfileData(profile);
      if (profile.status!) {
        return Right(profile);
      } else {
        return Left(ServerFailure(profile.message.toString()));
      }
    } on CacheFailure {
      return const Left(CacheFailure());
    } on ServerFailure {
      return const Left(ServerFailure('Server Failure'));
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
    // if (await _information.isConnected) {
    //   try {
    //     final profile = await _remoteDataSource.getProfileData();
    //     await _localDataSource.saveProfileData(profile);
    //     if (profile.status) {
    //       return Right(profile);
    //     }
    //     return Left(ServerFailure(profile.message.toString()));
    //   } on CacheFailure {
    //     return const Left(CacheFailure());
    //   } on ServerFailure {
    //     return const Left(ServerFailure('Server Failure'));
    //   }
    // }
    // return const Left(NoInternetFailure());
  }

  @override
  Future<Either<Failure, Profile>> updateProfileData(
    UpdateProfileParams params,
  ) async {
    try {
      final profile = await _remoteDataSource.updateProfileData(params);

      if (profile.status!) {
        return Right(profile);
      } else {
        return Left(ServerFailure(profile.message.toString()));
      }
    } on CacheFailure {
      return const Left(CacheFailure());
    } on ServerFailure {
      return const Left(ServerFailure('Server Failure'));
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Notifications>> getNotificationData() async {
    try {
      final notifications = await _remoteDataSource.getNotificationData();

      if (notifications.status) {
        return Right(notifications);
      } else {
        return Left(ServerFailure(notifications.message.toString()));
      }
    } on CacheFailure {
      return const Left(CacheFailure());
    } on ServerFailure {
      return const Left(ServerFailure('Server Failure'));
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, FAQs>> getFAQsData() async {
    try {
      final faqs = await _remoteDataSource.getFAQsData();

      if (faqs.status) {
        return Right(faqs);
      } else {
        return Left(ServerFailure(faqs.message.toString()));
      }
    } on CacheFailure {
      return const Left(CacheFailure());
    } on ServerFailure {
      return const Left(ServerFailure('Server Failure'));
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAddressData(Address address) async {
    try {
      await _localDataSource.deleteAddress(address);
      return const Right(unit);
    } on CacheFailure {
      return const Left(CacheFailure());
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Address>>> getAddressData() async {
    try {
      final address = await _localDataSource.getAddress();
      return Right(address);
    } on CacheFailure {
      return const Left(CacheFailure());
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> saveNewAddressData(Address address) async {
    try {
      final addressId = await _localDataSource.saveNewAddress(address);
      return Right(addressId);
    } on CacheFailure {
      return const Left(CacheFailure());
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateAddressData(Address address) async {
    try {
      await _localDataSource.updateAddress(address);
      return const Right(unit);
    } on CacheFailure {
      return const Left(CacheFailure());
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }
}

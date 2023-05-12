import 'package:dartz/dartz.dart';
import 'package:kw_store/core/usecase/params/params.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class UpdateProfileUseCase extends Usecase<Profile, UpdateProfileParams> {
  final ProfileRepository _profileRepository;

  UpdateProfileUseCase(this._profileRepository);

  @override
  Future<Either<Failure, Profile>> call(UpdateProfileParams params) async {
    return await _profileRepository.updateProfileData(params);
  }
}

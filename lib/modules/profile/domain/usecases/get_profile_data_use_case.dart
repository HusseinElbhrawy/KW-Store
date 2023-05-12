import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/params/params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class GetProfileDataUseCase extends Usecase<Profile, NoParams> {
  final ProfileRepository _profileRepository;

  GetProfileDataUseCase(this._profileRepository);

  @override
  Future<Either<Failure, Profile>> call(NoParams params) async {
    return await _profileRepository.getProfileData();
  }
}

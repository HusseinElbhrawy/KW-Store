import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/params/params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/address.dart';
import '../repositories/profile_repository.dart';

class GetUserAddressUseCase extends Usecase<List<Address>, NoParams> {
  final ProfileRepository _repository;

  GetUserAddressUseCase(this._repository);

  @override
  Future<Either<Failure, List<Address>>> call(NoParams params) async {
    return await _repository.getAddressData();
  }
}

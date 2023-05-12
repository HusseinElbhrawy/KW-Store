import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/address.dart';
import '../repositories/profile_repository.dart';

class UpdateUserAddressUseCase extends Usecase<Unit, Address> {
  final ProfileRepository _repository;

  UpdateUserAddressUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(Address params) async {
    return await _repository.updateAddressData(params);
  }
}

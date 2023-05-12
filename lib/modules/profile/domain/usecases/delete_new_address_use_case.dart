import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/address.dart';
import '../repositories/profile_repository.dart';

class DeleteNewAddressUseCase extends Usecase<Unit, Address> {
  final ProfileRepository _repository;

  DeleteNewAddressUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(Address params) async {
    return await _repository.deleteAddressData(params);
  }
}

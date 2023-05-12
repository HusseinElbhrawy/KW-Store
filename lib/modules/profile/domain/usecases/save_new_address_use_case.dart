import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/address.dart';
import '../repositories/profile_repository.dart';

class SaveNewAddressUseCase extends Usecase<int, Address> {
  final ProfileRepository _repository;

  SaveNewAddressUseCase(this._repository);

  @override
  Future<Either<Failure, int>> call(Address params) async {
    return await _repository.saveNewAddressData(params);
  }
}

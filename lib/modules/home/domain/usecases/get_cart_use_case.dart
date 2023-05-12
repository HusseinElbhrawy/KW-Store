import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/params/params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/cart.dart';
import '../repositories/home_repository.dart';

class GetCartUseCase extends Usecase<AllCart, NoParams> {
  final HomeRepository _homeRepository;

  GetCartUseCase(this._homeRepository);

  @override
  Future<Either<Failure, AllCart>> call(NoParams params) async {
    return await _homeRepository.getCart();
  }
}

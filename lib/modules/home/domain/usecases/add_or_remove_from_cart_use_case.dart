import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/cart.dart';
import '../repositories/home_repository.dart';

class AddOrRemoveFromCartUseCase extends Usecase<Cart, String> {
  final HomeRepository _repository;

  AddOrRemoveFromCartUseCase(this._repository);
  @override
  Future<Either<Failure, Cart>> call(String params) async {
    return _repository.addOrRemoveFromCart(productId: params);
  }
}

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/favorites.dart';
import '../repositories/home_repository.dart';

class AddOrRemoveFavoritesUseCase extends Usecase<Favorites, String> {
  final HomeRepository _homeRepository;

  AddOrRemoveFavoritesUseCase(this._homeRepository);

  @override
  Future<Either<Failure, Favorites>> call(String params) async {
    return await _homeRepository.addOrRemoveFromFavorites(productId: params);
  }
}

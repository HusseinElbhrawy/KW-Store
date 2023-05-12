// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:kw_store/modules/home/domain/repositories/home_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/params/params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/favorites.dart';

class GetAllFavoritesUseCase extends Usecase<AllFavorites, NoParams> {
  final HomeRepository _homeRepository;
  GetAllFavoritesUseCase(this._homeRepository);

  @override
  Future<Either<Failure, AllFavorites>> call(NoParams params) async {
    return await _homeRepository.getFavorites();
  }
}

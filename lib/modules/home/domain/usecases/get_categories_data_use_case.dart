import 'package:dartz/dartz.dart';
import 'package:kw_store/core/usecase/params/params.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/categories.dart';
import '../repositories/home_repository.dart';

class GetCategoriesDataUseCase extends Usecase<Categories, NoParams> {
  final HomeRepository _homeRepository;

  GetCategoriesDataUseCase(this._homeRepository);

  @override
  Future<Either<Failure, Categories>> call(NoParams params) async {
    return await _homeRepository.getCategoriesData();
  }
}

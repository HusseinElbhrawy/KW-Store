import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/categories.dart';
import '../repositories/home_repository.dart';

class GetSpecificCategoryUseCase extends Usecase<SpecificCategory, String> {
  final HomeRepository _repository;

  GetSpecificCategoryUseCase(this._repository);

  @override
  Future<Either<Failure, SpecificCategory>> call(String params) async {
    return await _repository.getSpecificCategory(categoryId: params);
  }
}

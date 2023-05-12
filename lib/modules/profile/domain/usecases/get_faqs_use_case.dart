import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/params/params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/faqs.dart';
import '../repositories/profile_repository.dart';

class GetFaqsUseCase extends Usecase<FAQs, NoParams> {
  final ProfileRepository _repository;

  GetFaqsUseCase(this._repository);

  @override
  Future<Either<Failure, FAQs>> call(NoParams params) async {
    return await _repository.getFAQsData();
  }
}

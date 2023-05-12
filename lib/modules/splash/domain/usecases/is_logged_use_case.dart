import 'package:dartz/dartz.dart';
import 'package:kw_store/core/usecase/params/params.dart';

import '../../../../../../../../core/error/failure.dart';
import '../../../../../../../../core/usecase/usecase.dart';
import '../repositories/splash_repository.dart';

class IsLoggedUseCase extends Usecase<bool, NoParams> {
  final SplashRepository _splashRepository;

  IsLoggedUseCase(this._splashRepository);

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _splashRepository.isLogged();
  }
}

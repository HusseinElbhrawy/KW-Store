import 'package:kw_store/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:kw_store/core/usecase/usecase.dart';

import '../../../../core/usecase/params/params.dart';
import '../repositories/splash_repository.dart';

class IsDarkModeUseCase extends Usecase<bool, NoParams> {
  final SplashRepository _splashRepository;

  IsDarkModeUseCase(this._splashRepository);
  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _splashRepository.isDarkMode();
  }
}

import '../../../../core/database/i_local_data_base.dart';
import '../../../../core/utils/constant.dart';

abstract class SplashLocalDataSource {
  Future<bool?> isLogged();
  Future<String?> getUid();
  Future<bool?> isOnBoardingSkipped();
  Future<bool?> isDarkMode();
  Future skipOnBoarding();
}

class SplashLocalDataSourceImplementation implements SplashLocalDataSource {
  final ILocalDataBase _localDataBase;

  SplashLocalDataSourceImplementation(this._localDataBase);

  @override
  Future<String?> getUid() async {
    return await _localDataBase.get(AppConstant.kUserUID) ?? '';
  }

  @override
  Future<bool?> isLogged() async {
    return await _localDataBase.get(AppConstant.kUserUID) != null;
  }

  @override
  Future<bool?> isOnBoardingSkipped() async {
    return await _localDataBase.get(AppConstant.kOnBoarding) != null;
  }

  @override
  Future skipOnBoarding() async {
    return await _localDataBase.set(
      AppConstant.kOnBoarding,
      true.toString(),
    );
  }

  @override
  Future<bool?> isDarkMode() async {
    return await _localDataBase.get(AppConstant.kDarkMode) != null;
  }
}

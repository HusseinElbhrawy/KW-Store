import '../../../../core/database/i_local_data_base.dart';
import '../../../../core/utils/constant.dart';

abstract class AuthLocalDataSource {
  Future cacheLogin(String uid);
  Future cacheRegister(String uid);
  Future cacheLogout();
}

class AuthLocalDataSourceImplementation implements AuthLocalDataSource {
  final ILocalDataBase _localDataBase;

  AuthLocalDataSourceImplementation(this._localDataBase);

  @override
  Future cacheLogin(String uid) async {
    return await _localDataBase.set(AppConstant.kUserUID, uid);
  }

  @override
  Future cacheLogout() async {
    return await _localDataBase.deleteValue(AppConstant.kUserUID);
  }

  @override
  Future cacheRegister(String uid) async {
    final result = await _localDataBase.set(AppConstant.kUserUID, uid);
    return result;
  }
}

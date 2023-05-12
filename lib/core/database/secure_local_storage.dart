import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'i_local_data_base.dart';

class SecureLocalStorageImplementation implements ILocalDataBase {
  final FlutterSecureStorage _flutterSecureStorage;

  SecureLocalStorageImplementation(this._flutterSecureStorage);

  @override
  Future<void> deleteAll() async {
    return await _flutterSecureStorage.deleteAll();
  }

  @override
  Future<void> deleteValue(String key) async {
    return await _flutterSecureStorage.delete(key: key);
  }

  @override
  Future<String?> get(String key) async {
    return await _flutterSecureStorage.read(key: key);
  }

  @override
  Future<void> set(String key, dynamic value) async {
    return await _flutterSecureStorage.write(key: key, value: value);
  }
}

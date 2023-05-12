import 'package:shared_preferences/shared_preferences.dart';

import 'i_local_data_base.dart';

class SharedPreferenceLocalStorageImplementation implements ILocalDataBase {
  final SharedPreferences shared;

  SharedPreferenceLocalStorageImplementation({required this.shared});

  @override
  Future<bool> deleteAll() async {
    return await shared.clear();
  }

  @override
  Future<bool> deleteValue(String key) async {
    return await shared.remove(key);
  }

  @override
  Future get(String key) async {
    return shared.get(key);
  }

  @override
  Future<bool> set(String key, dynamic value) async {
    if (value is bool) {
      return shared.setBool(key, value);
    } else if (value is int) {
      return shared.setInt(key, value);
    } else if (value is double) {
      return shared.setDouble(key, value);
    } else if (value is String) {
      return shared.setString(key, value);
    } else if (value is List<String>) {
      return shared.setStringList(key, value);
    } else {
      return shared.setString(key, value);
    }
  }
}

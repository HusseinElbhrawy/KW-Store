import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../utils/constant.dart';
import 'i_local_data_base.dart';

class HiveLocalDataBaseImplementation implements ILocalDataBase {
  late Box box;
  HiveLocalDataBaseImplementation() {
    box = Hive.box(AppConstant.generalDatabaseName);
  }

  @override
  Future deleteAll() async {
    final path = await getApplicationDocumentsDirectory();
    return await Hive.deleteBoxFromDisk(
      AppConstant.generalDatabaseName,
      path: path.path,
    );
  }

  @override
  Future deleteValue(String key) async {
    return await box.delete(key);
  }

  @override
  Future get(String key) async {
    return await box.get(key);
  }

  @override
  Future set(String key, dynamic value) async {
    return await box.put(key, value);
  }
}

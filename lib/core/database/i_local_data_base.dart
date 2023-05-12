abstract class ILocalDataBase {
  Future deleteValue(String key);
  Future deleteAll();
  Future get(String key);
  Future set(String key, dynamic value);
}

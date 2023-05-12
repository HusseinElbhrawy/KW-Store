abstract class IAppLocalStorage {
  Future setValue(String key, String value);
  Future getValue(String key);
  Future remove(String key);
  Future removeAll();
}

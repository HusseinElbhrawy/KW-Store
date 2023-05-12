import '../models/categories_model.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTERVAL = 120 * 1000; // 1 minute cache in millis

abstract class HomeLocalDataSource {
  Future<void> cacheCategoryData(
    SpecificCategoryModel categoryDataModel,
    String id,
  );
  Future<SpecificCategoryModel?> getCategoryData(String id);

  void clearCache();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  Map<String, CachedItem> cacheMap = {};

  @override
  Future<void> cacheCategoryData(
    SpecificCategoryModel categoryDataModel,
    String id,
  ) async {
    cacheMap[CACHE_HOME_KEY + id] = CachedItem(categoryDataModel);
  }

  @override
  Future<SpecificCategoryModel?> getCategoryData(String id) async {
    CachedItem? cachedItem = cacheMap[CACHE_HOME_KEY + id];

    if (cachedItem != null && cachedItem.isValid(CACHE_HOME_INTERVAL)) {
      return cachedItem.data;
    } else {
      return null;
    }
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }
}

class CachedItem {
  dynamic data;

  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTimeInMillis) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;

    bool isValid = currentTimeInMillis - cacheTime <= expirationTimeInMillis;

    return isValid;
  }
}

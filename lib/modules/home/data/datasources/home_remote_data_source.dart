import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_point.dart';
import '../models/cart_model.dart';
import '../models/categories_model.dart';
import '../models/favorites_model.dart';
import '../models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getHomeData();
  Future<CategoriesModel> getCategoriesData();
  Future<CartModel> addOrRemoveFromCart({required String productId});
  Future<AllCartModel> getCart();
  Future<FavoritesModel> addOrRemoveFromFavorites({required String productId});
  Future<ALlFavoritesModel> getFavorites();
  Future<SpecificCategoryModel> getSpecificCategory(String id);
}

class HomeRemoteDataSourceImplementation implements HomeRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRemoteDataSourceImplementation(this.apiConsumer);
  @override
  Future<HomeModel> getHomeData() async {
    final response = await apiConsumer.get(EndPoint.home);
    return HomeModel.fromJson(response.data);
  }

  @override
  Future<CategoriesModel> getCategoriesData() async {
    final response = await apiConsumer.get(EndPoint.categories);
    return CategoriesModel.fromJson(response.data);
  }

  @override
  Future<AllCartModel> getCart() async {
    final response = await apiConsumer.get(EndPoint.cart);
    return AllCartModel.fromJson(response.data);
  }

  @override
  Future<CartModel> addOrRemoveFromCart({required String productId}) async {
    final response = await apiConsumer.post(
      EndPoint.cart,
      body: {'product_id': productId},
    );
    return CartModel.fromJson(response.data);
  }

  @override
  Future<FavoritesModel> addOrRemoveFromFavorites(
      {required String productId}) async {
    final response = await apiConsumer.post(
      EndPoint.favorites,
      body: {'product_id': productId},
    );

    return FavoritesModel.fromJson(response.data);
  }

  @override
  Future<ALlFavoritesModel> getFavorites() async {
    final response = await apiConsumer.get(EndPoint.favorites);

    return ALlFavoritesModel.fromJson(response.data);
  }

  @override
  Future<SpecificCategoryModel> getSpecificCategory(String id) async {
    final response = await apiConsumer.get('${EndPoint.categories}/$id');
    return SpecificCategoryModel.fromJson(response.data);
  }
}

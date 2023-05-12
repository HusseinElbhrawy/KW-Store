import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/cart.dart';
import '../entities/categories.dart';
import '../entities/favorites.dart';
import '../entities/home.dart';

abstract class HomeRepository {
  Future<Either<Failure, Home>> getHomeData();
  Future<Either<Failure, Categories>> getCategoriesData();

  //! Add To Cart
  Future<Either<Failure, Cart>> addOrRemoveFromCart(
      {required String productId});

  //! Get Cart
  Future<Either<Failure, AllCart>> getCart();

  //! Add To Favorites
  Future<Either<Failure, Favorites>> addOrRemoveFromFavorites(
      {required String productId});

  //! Get Favorites
  Future<Either<Failure, AllFavorites>> getFavorites();

  //! Get Product of special Category
  Future<Either<Failure, SpecificCategory>> getSpecificCategory({
    required String categoryId,
  });
}

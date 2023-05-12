import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/cart.dart';
import '../../domain/entities/categories.dart';
import '../../domain/entities/favorites.dart';
import '../../domain/entities/home.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_data_source.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepositoryImplementation(
    this.homeRemoteDataSource,
    this.homeLocalDataSource,
  );

  @override
  Future<Either<Failure, Home>> getHomeData() async {
    try {
      final homeData = await homeRemoteDataSource.getHomeData();
      return Right(homeData);
    } on ServerException catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Categories>> getCategoriesData() async {
    try {
      final categories = await homeRemoteDataSource.getCategoriesData();
      return Right(categories);
    } on ServerException catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> addOrRemoveFromCart(
      {required String productId}) async {
    try {
      final addOrRemove =
          await homeRemoteDataSource.addOrRemoveFromCart(productId: productId);
      return Right(addOrRemove);
    } on ServerException catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, AllCart>> getCart() async {
    try {
      final cart = await homeRemoteDataSource.getCart();
      return Right(cart);
    } on ServerException catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Favorites>> addOrRemoveFromFavorites(
      {required String productId}) async {
    try {
      final addOrRemove = await homeRemoteDataSource.addOrRemoveFromFavorites(
          productId: productId);
      return Right(addOrRemove);
    } on ServerException catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, AllFavorites>> getFavorites() async {
    try {
      final favorites = await homeRemoteDataSource.getFavorites();
      return Right(favorites);
    } on ServerException catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, SpecificCategory>> getSpecificCategory(
      {required String categoryId}) async {
    //Todo : use cached data

    try {
      final cachedData = await homeLocalDataSource.getCategoryData(categoryId);
      cachedData != null ? log('cached data') : log('no cached data');
      if (cachedData == null) {
        final category =
            await homeRemoteDataSource.getSpecificCategory(categoryId);
        await homeLocalDataSource.cacheCategoryData(category, categoryId);
        return Right(category);
      }
      return Right(cachedData);
    } on ServerException catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }
}

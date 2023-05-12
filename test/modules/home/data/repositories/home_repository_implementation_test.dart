import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kw_store/core/error/exceptions.dart';
import 'package:kw_store/core/error/failure.dart';
import 'package:kw_store/modules/home/data/datasources/home_local_data_source.dart';
import 'package:kw_store/modules/home/data/datasources/home_remote_data_source.dart';
import 'package:kw_store/modules/home/data/models/cart_model.dart';
import 'package:kw_store/modules/home/data/models/categories_model.dart';
import 'package:kw_store/modules/home/data/models/favorites_model.dart';
import 'package:kw_store/modules/home/data/repositories/home_repository_implementation.dart';
import 'package:kw_store/modules/home/domain/entities/cart.dart';
import 'package:kw_store/modules/home/domain/entities/categories.dart';
import 'package:kw_store/modules/home/domain/entities/favorites.dart';
import 'package:kw_store/modules/home/domain/repositories/home_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_implementation_test.mocks.dart';

@GenerateMocks([HomeRemoteDataSourceImplementation])
void main() {
  late HomeRepository homeRepository;
  late HomeRemoteDataSource homeRemoteDataSource;
  late HomeLocalDataSource homeLocalDataSource;
  setUp(() {
    homeRemoteDataSource = MockHomeRemoteDataSourceImplementation();
    homeRepository =
        HomeRepositoryImplementation(homeRemoteDataSource, homeLocalDataSource);
  });
  group(
    'Home Repository Add or Remove From Cart',
    () {
      test(
        'test add or remove product cart with no error',
        () async {
          // arrange
          const matcher = Right<Failure, Cart>(
            CartModel(status: false, message: ''),
          );

          when(homeRemoteDataSource.addOrRemoveFromCart(productId: '1'))
              .thenAnswer(
            (_) async {
              return Future<CartModel>.value(
                const CartModel(
                  status: false,
                  message: '',
                ),
              );
            },
          );
          // act
          final actual =
              await homeRepository.addOrRemoveFromCart(productId: '1');

          // assert
          expect(actual, equals(matcher));
        },
      );

      test(
        'test add or remove product cart with Exception',
        () async {
          // arrange
          const matcher = Left<Failure, Cart>(ServerFailure(''));

          when(homeRemoteDataSource.addOrRemoveFromCart(productId: '1'))
              .thenThrow(const ServerException(''));

          // act
          final actual =
              await homeRepository.addOrRemoveFromCart(productId: '1');

          // assert
          expect(actual, equals(matcher));
        },
      );
    },
  );
  group(
    'Get Cart With Success & Failure',
    () {
      test(
        'Get Cart With No Error',
        () async {
          // arrange
          final matcher = Right<Failure, AllCartModel>(
            AllCartModel(
              status: false,
              message: '',
              data: CartData(total: 0.0, products: const []),
            ),
          );

          when(homeRemoteDataSource.getCart()).thenAnswer(
            (_) async {
              return await Future<AllCartModel>.value(
                AllCartModel(
                  status: false,
                  message: '',
                  data: CartData(total: 0.0, products: const []),
                ),
              );
            },
          );
          // act
          final actual = await homeRepository.getCart();

          // assert
          expect(actual, equals(matcher));
        },
      );

      test(
        'Get Cart With Failure',
        () async {
          // arrange
          const matcher = Left<Failure, Cart>(ServerFailure(''));

          when(homeRemoteDataSource.getCart())
              .thenThrow(const ServerException(''));

          // act
          final actual = await homeRepository.getCart();

          // assert
          expect(actual, equals(matcher));
        },
      );
    },
  );

  group(
    'test add or remove from fav with success and failure case',
    () {
      test(
        'add or remove with right case (success)',
        () async {
          // arrange
          const matcher = Right<Failure, Favorites>(
            FavoritesModel(status: false, message: ''),
          );

          when(homeRemoteDataSource.addOrRemoveFromFavorites(productId: '1'))
              .thenAnswer(
            (_) async {
              return Future<FavoritesModel>.value(
                const FavoritesModel(
                  status: false,
                  message: '',
                ),
              );
            },
          );
          // act
          final actual =
              await homeRepository.addOrRemoveFromFavorites(productId: '1');

          // assert
          expect(actual, equals(matcher));
        },
      );

      test(
        'test add or remove with Left (Failure)',
        () async {
          // arrange
          const matcher = Left<Failure, Favorites>(ServerFailure(''));

          when(homeRemoteDataSource.addOrRemoveFromFavorites(productId: '1'))
              .thenThrow(const ServerException(''));

          // act
          final actual =
              await homeRepository.addOrRemoveFromFavorites(productId: '1');

          // assert
          expect(actual, equals(matcher));
        },
      );
    },
  );

  group(
    'test get fav items with Right and Left (Success & Failure)',
    () {
      test(
        'test get fav items with Right (Success)',
        () async {
          // arrange
          const matcher = Right<Failure, Favorites>(
            ALlFavoritesModel(
              status: false,
              message: '',
              data: FavoritesDataModel(
                total: 0,
                data: [],
              ),
            ),
          );

          when(homeRemoteDataSource.getFavorites()).thenAnswer(
            (_) async {
              return await Future<ALlFavoritesModel>.value(
                const ALlFavoritesModel(
                  status: false,
                  message: '',
                  data: FavoritesDataModel(
                    total: 0,
                    data: [],
                  ),
                ),
              );
            },
          );
          // act
          final actual = await homeRepository.getFavorites();

          // assert
          expect(actual, equals(matcher));
        },
      );

      test('test get fav with Left (Failure)', () async {
        // arrange
        const matcher = Left<Failure, Favorites>(ServerFailure(''));

        when(homeRemoteDataSource.getFavorites())
            .thenThrow(const ServerException(''));

        // act
        final actual = await homeRepository.getFavorites();

        // assert
        expect(actual, equals(matcher));
      });
    },
  );

  group(
    'test get specific category with id (Left and Right)',
    () {
      test(
        'get right',
        () async {
          // arrange
          const matcher = Right<Failure, SpecificCategory>(
            SpecificCategoryModel(
              data: SpecificCategoryData(total: 1, data: []),
              message: '',
              status: true,
            ),
          );
          // act
          when(homeRemoteDataSource.getSpecificCategory('1')).thenAnswer(
            (_) async {
              return await Future<SpecificCategoryModel>.value(
                const SpecificCategoryModel(
                  data: SpecificCategoryData(total: 1, data: []),
                  message: '',
                  status: true,
                ),
              );
            },
          );

          final actual =
              await homeRepository.getSpecificCategory(categoryId: '1');

          // assert
          expect(actual, equals(matcher));
        },
      );
    },
  );
}

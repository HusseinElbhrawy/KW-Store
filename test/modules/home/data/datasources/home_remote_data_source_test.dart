import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kw_store/core/api/api_consumer.dart';
import 'package:kw_store/core/api/dio_consumer.dart';
import 'package:kw_store/core/api/end_point.dart';
import 'package:kw_store/modules/home/data/datasources/home_remote_data_source.dart';
import 'package:kw_store/modules/home/data/models/cart_model.dart';
import 'package:kw_store/modules/home/data/models/categories_model.dart';
import 'package:kw_store/modules/home/data/models/favorites_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_remote_data_source_test.mocks.dart';

@GenerateMocks([DioConsumer])
void main() {
  late HomeRemoteDataSource homeRemoteDataSource;
  late ApiConsumer apiConsumer;

  setUp(() {
    apiConsumer = MockDioConsumer();
    homeRemoteDataSource = HomeRemoteDataSourceImplementation(apiConsumer);
  });

  group(
    'Home Remote Data Source',
    () {
      test(
        'test add or remove product to/from cart',
        () async {
          //AAA
          //Arrange
          // const matcher = CartModel(
          //   status: true,
          //   message: 'added or removed',
          // );
          final matcher = isA<CartModel>();
          //Act
          when(apiConsumer.post(
            EndPoint.cart,
            body: {
              'product_id': '1',
            },
          )).thenAnswer(
            (_) => Future.value(
              Response(
                requestOptions: RequestOptions(
                  path: EndPoint.cart,
                ),
                statusCode: 200,
                // data: matcher.toJson(),
                data: {
                  'status': true,
                  'message': 'added or removed',
                },
              ),
            ),
          );
          final actual =
              await homeRemoteDataSource.addOrRemoveFromCart(productId: '1');

          //Assert
          expect(actual, matcher);
        },
      );

      test(
        'Get Cart With No Error',
        () async {
          // AAA
          // Arrange
          final matcher = isA<CartModel>();
          // Act
          when(apiConsumer.get(EndPoint.cart)).thenAnswer(
            (_) => Future.value(
              Response(
                requestOptions: RequestOptions(
                  path: EndPoint.cart,
                ),
                statusCode: 200,
                data: {
                  'status': true,
                  'message': 'success',
                  'data': {
                    'total': 0,
                    'products': const [],
                  },
                },
              ),
            ),
          );

          final actual = await homeRemoteDataSource.getCart();

          expect(actual, matcher);
        },
      );
    },
  );

  group(
    'test get fav items and add or remove ',
    () {
      //Todo : Add Or Remove Fav
      //Todo : Get Fav

      test(
        'add or remove fav item',
        () async {
          //AAA
          //Arrange
          final matcher = isA<FavoritesModel>();
          //Act
          when(apiConsumer.post(
            EndPoint.favorites,
            body: {
              'product_id': '1',
            },
          )).thenAnswer(
            (_) => Future.value(
              Response(
                requestOptions: RequestOptions(
                  path: EndPoint.favorites,
                ),
                statusCode: 200,
                data: {
                  'status': true,
                  'message': 'added or removed',
                },
              ),
            ),
          );
          final actual = await homeRemoteDataSource.addOrRemoveFromFavorites(
              productId: '1');

          //Assert
          expect(actual, matcher);
        },
      );

      test(
        'test GET all Fav items',
        () async {
          //AAA
          //Arrange
          final matcher = isA<ALlFavoritesModel>();
          //Act
          when(apiConsumer.get(EndPoint.favorites)).thenAnswer(
            (_) => Future.value(
              Response(
                requestOptions: RequestOptions(
                  path: EndPoint.favorites,
                ),
                statusCode: 200,
                data: {
                  'status': true,
                  'message': 'success',
                  'data': {
                    'total': 0,
                    'data': const [],
                  },
                },
              ),
            ),
          );
          final actual = await homeRemoteDataSource.getFavorites();

          //Assert
          expect(actual, matcher);
        },
      );
    },
  );

  group('test get specific category with id ', () {
    test(
      'get specific category with id with no error',
      () async {
        // AAA
        // Arrange
        final matcher = isA<SpecificCategoryModel>();

        // Act
        when(apiConsumer.get(
          '${EndPoint.categories}/1',
        )).thenAnswer(
          (_) => Future.value(
            Response(
              requestOptions: RequestOptions(
                path: '${EndPoint.categories}/1',
              ),
              statusCode: 200,
              data: {
                'status': true,
                'message': 'success',
                'data': {
                  'total': 0,
                  'data': const [],
                },
              },
            ),
          ),
        );

        final actual = await homeRemoteDataSource.getSpecificCategory('1');

        expect(actual, matcher);
      },
    );
  });
}

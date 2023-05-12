import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kw_store/core/api/api_consumer.dart';
import 'package:kw_store/core/api/end_point.dart';
import 'package:kw_store/core/usecase/params/params.dart';
import 'package:kw_store/modules/profile/data/datasources/profile_remote_data_source.dart';
import 'package:kw_store/modules/profile/data/models/notifications_model.dart';
import 'package:kw_store/modules/profile/data/models/profile_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiConsumer])
void main() {
  late ProfileRemoteDataSource profileRemoteDataSource;
  late ApiConsumer apiConsumer;
  setUp(() {
    apiConsumer = MockApiConsumer();
    profileRemoteDataSource =
        ProfileRemoteDataSourceImplementation(apiConsumer);
  });

  test('test update profile ', () async {
    // Arrange

    final result = isA<ProfileModel>();

    final profile = UpdateProfileParams(
      email: 'hussein@gmail.com',
      name: 'Hussein',
      phone: '01000000000',
    );

    // Act
    when(
      apiConsumer.put(
        EndPoint.updateProfile,
        body: profile.toMap(),
      ),
    ).thenAnswer(
      (_) {
        return Future(() {
          return Response(
            requestOptions: RequestOptions(
              baseUrl: EndPoint.baseUrl,
              path: EndPoint.updateProfile,
              data: profile.toMap(),
            ),
            data: {
              'result': true,
              'message': 'success',
              'data': {
                'email': 'hussein@gmail.com',
                'image': '',
                'name': 'Hussein',
                'phone': '01000000000',
                'token': 'token',
              },
            },
            statusCode: 200,
          );
        });
      },
    );

    final actual = await profileRemoteDataSource.updateProfileData(profile);
    // Assert

    expect(actual, result);
  });

  group(
    ' Test Get Notification ',
    () {
      test(
        'Get Notification With No Errors',
        () async {
          //Arrange
          final result = isA<NotificationsModel>();
          final data = {
            'result': true,
            'message': 'success',
            'data': [
              {
                "total": 11,
                'data': [
                  {
                    'id': 1,
                    'title': 'title',
                    'message': 'body',
                  },
                ],
              },
            ],
          };
          //Act
          when(
            apiConsumer.get(EndPoint.notifications),
          ).thenAnswer(
            (_) {
              return Future(() {
                return Response(
                  requestOptions: RequestOptions(
                    baseUrl: EndPoint.baseUrl,
                    path: EndPoint.notifications,
                  ),
                  data: data,
                  statusCode: 200,
                );
              });
            },
          );

          final actual = await profileRemoteDataSource.getNotificationData();

          //Assert

          expect(actual, equals(result));
        },
      );
    },
  );
}

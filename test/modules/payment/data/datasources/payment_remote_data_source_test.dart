import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kw_store/core/api/api_consumer.dart';
import 'package:kw_store/core/api/dio_consumer.dart';
import 'package:kw_store/core/api/end_point.dart';
import 'package:kw_store/core/usecase/params/params.dart';
import 'package:kw_store/core/utils/constant.dart';
import 'package:kw_store/modules/payment/data/datasources/payment_remote_data_source.dart';
import 'package:kw_store/modules/payment/data/models/order_registration_model.dart';
import 'package:kw_store/modules/payment/data/models/payment_authentication_model.dart';
import 'package:kw_store/modules/payment/data/models/payment_key_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../home/data/datasources/home_remote_data_source_test.mocks.dart';

@GenerateMocks([DioConsumer])
void main() {
  late PaymentRemoteDataSource dataSource;
  late ApiConsumer apiConsumer;
  setUp(() {
    apiConsumer = MockDioConsumer();
    dataSource = PaymentRemoteDataSourceImplementation(apiConsumer);
  });

  test('test get auth token without any failure', () async {
    // arrange
    const actual = PaymentAuthenticationModel('token');
    // act

    verifyNever(apiConsumer.post(EndPoint.paymentAuthentication));

    when(apiConsumer.post(
      EndPoint.paymentAuthentication,
      body: {
        'api_key': AppConstant.paymentApiKey,
      },
    )).thenAnswer(
      (_) async => await Future.value(
        Response(
          requestOptions: RequestOptions(
            baseUrl: EndPoint.paymentBaseUrl,
            path: EndPoint.paymentAuthentication,
          ),
          statusCode: 200,
          data: actual.toJson(),
        ),
      ),
    );
    final result = await dataSource.authentication();

    // verify(apiConsumer.post(EndPoint.paymentAuthentication)).called(1);
    // assert
    expect(result, actual);
  });

  test('test order registration ', () async {
    //Arrange
    const params = OrderRegistrationParams(
      authToken: 'token',
      delivery: false,
      amountCents: 10000,
      currency: 'EGP',
      terminalId: 23772,
      items: [
        Item(
          name: 'name',
          amountCents: '10000',
          description: 'description',
          quantity: 1,
        )
      ],
      shippingData: ShippingDataParams(
        email: 'email',
        firstName: 'firstName',
        lastName: 'lastName',
        phoneNumber: 'phoneNumber',
        street: 'street',
        city: 'city',
        country: 'country',
        state: 'state',
      ),
    );

    const actual = OrderRegistrationModel(
      id: 0,
      createdAt: '',
      deliveryNeeded: false,
      merchant: MerchantModel(
        id: 0,
        createdAt: '',
        phones: [''],
        companyEmails: [''],
        companyName: '',
        state: '',
        country: '',
        city: '',
        postalCode: '',
        street: '',
      ),
      amountCents: 0,
      shippingData: ShippingDataModel(
        firstName: '',
        lastName: '',
        email: '',
        phoneNumber: '',
        street: '',
        building: '',
        floor: '',
        apartment: '',
        city: '',
        state: '',
        country: '',
        postalCode: '',
        extraDescription: '',
        id: 0,
        order: 0,
        orderId: 0,
        shippingMethod: '',
      ),
      currency: '',
      isPaymentLocked: false,
      isReturn: false,
      isCancel: false,
      isReturned: false,
      isCanceled: false,
      paidAmountCents: 0,
      notifyUserWithEmail: false,
      items: [
        ItemsModel(
          name: 'name',
          description: 'description',
          amountCents: 1000,
          quantity: 0,
        ),
      ],
      orderUrl: '',
      commissionFees: 0,
      deliveryFeesCents: 0,
      deliveryVatCents: 0,
      paymentMethod: '',
      apiSource: '',
      token: '',
      url: '',
    );

    verifyNever(apiConsumer.post(EndPoint.paymentOrderRegistration));
    //Act
    when(
      apiConsumer.post(
        EndPoint.paymentOrderRegistration,
        body: params.toMap(),
      ),
    ).thenAnswer(
      (realInvocation) {
        return Future.value(
          Response(
            requestOptions: RequestOptions(
              baseUrl: EndPoint.paymentBaseUrl,
              path: EndPoint.paymentOrderRegistration,
            ),
            statusCode: 200,
            data: actual.toJson(),
          ),
        );
      },
    );
    final result = await dataSource.orderRegistration(params);
    //Assert
    expect(result, actual);
  });

  test('get payment key without any errors', () async {
    // arrange
    const params = PaymentKeyRequestParams(
      authToken: 'token',
      amountCents: '1000',
      expiration: '3600',
      orderId: '1',
      billingData: BillingData(
        apartment: 'apartment',
        email: 'email',
        floor: 'floor',
        firstName: 'firstName',
        lastName: 'lastName',
        shippingMethod: 'shippingMethod',
        street: 'street',
        building: 'building',
        city: 'city',
        country: 'country',
        postalCode: 'postalCode',
        state: 'state',
        phone: '',
      ),
      currency: 'EGP',
      integrationId: 'integrationId',
      lockOrderWhenPaid: 'lockOrderWhenPaid',
    );
    const actual = PaymentKeyModel('token');
    // act
    verifyNever(apiConsumer.post(EndPoint.paymentKey));
    when(
      apiConsumer.post(
        EndPoint.paymentKey,
        body: params.toMap(),
      ),
    ).thenAnswer(
      (realInvocation) {
        return Future.value(
          Response(
            requestOptions: RequestOptions(
              baseUrl: EndPoint.paymentBaseUrl,
              path: EndPoint.paymentKey,
            ),
            statusCode: 200,
            data: actual.toJson(),
          ),
        );
      },
    );

    final result = await dataSource.getPaymentKey(params);
    // assert
    expect(result, actual);
  });

  test('get Ref Code Without any Errors', () async {
    // arrange
    const params = 'paymentToken';
    const actual = PaymentKeyModel('token');
    // act
    when(
      apiConsumer.post(
        EndPoint.paymentRefCode,
        body: {
          'payment_token': params,
        },
      ),
    ).thenAnswer(
      (realInvocation) {
        return Future.value(
          Response(
            requestOptions: RequestOptions(
              baseUrl: EndPoint.paymentBaseUrl,
              path: EndPoint.paymentRefCode,
            ),
            statusCode: 200,
            data: actual.toJson(),
          ),
        );
      },
    );
    final result = await dataSource.gerRefCode(params);
    // assert
    expect(result, actual);
  });
}

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_point.dart';
import '../../../../core/usecase/params/params.dart';
import '../../../../core/utils/constant.dart';
import '../models/kiosk_data_payment_model.dart';
import '../models/order_registration_model.dart';
import '../models/payment_authentication_model.dart';
import '../models/payment_key_model.dart';

abstract class PaymentRemoteDataSource {
  Future<PaymentAuthenticationModel> authentication();
  Future<KioskDataPaymentModel> gerRefCode(String paymentToken);
  Future<PaymentKeyModel> getPaymentKey(PaymentKeyRequestParams params);
  Future<OrderRegistrationModel> orderRegistration(
    OrderRegistrationParams params,
  );
}

class PaymentRemoteDataSourceImplementation implements PaymentRemoteDataSource {
  final ApiConsumer _apiConsumer;

  PaymentRemoteDataSourceImplementation(this._apiConsumer) {
    EndPoint.selectedBaseUrl = EndPoint.paymentBaseUrl;
  }

  @override
  Future<PaymentAuthenticationModel> authentication() async {
    final response = await _apiConsumer.post(
      EndPoint.paymentAuthentication,
      body: {
        'api_key': AppConstant.paymentApiKey,
      },
    );
    return PaymentAuthenticationModel.fromJson(response.data);
  }

  @override
  Future<OrderRegistrationModel> orderRegistration(
      OrderRegistrationParams params) async {
    final response = await _apiConsumer.post(
      EndPoint.paymentOrderRegistration,
      body: params.toMap(),
    );
    return OrderRegistrationModel.fromJson(response.data);
  }

  @override
  Future<PaymentKeyModel> getPaymentKey(PaymentKeyRequestParams params) async {
    final response = await _apiConsumer.post(
      EndPoint.paymentKey,
      // body: params.toMap(),
      body: {
        "auth_token": params.authToken,
        "amount_cents": params.amountCents,
        "expiration": 3600,
        "order_id": "46786099",
        "billing_data": {
          "apartment": "803",
          "email": params.billingData.email,
          "floor": "42",
          "first_name": params.billingData.firstName,
          "street": "Ethan Land",
          "building": "8028",
          "phone_number": params.billingData.phone,
          "shipping_method": "PKG",
          "postal_code": "01898",
          "city": "Jaskolskiburgh",
          "country": "CR",
          "last_name": "Nicolas",
          "state": "Utah"
        },
        "currency": "EGP",
        "integration_id": 2030245,
        "lock_order_when_paid": "false"
      },
    );
    return PaymentKeyModel.fromJson(response.data);
  }

  @override
  Future<KioskDataPaymentModel> gerRefCode(String paymentToken) async {
    final response = await _apiConsumer.post(
      EndPoint.paymentRefCode,
      body: {
        "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
        'payment_token': paymentToken,
      },
    );
    return KioskDataPaymentModel.fromJson(response.data);
  }
}

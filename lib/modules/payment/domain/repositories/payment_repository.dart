// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/params/params.dart';
import '../entities/kiosk_payment.dart';
import '../entities/order_registration.dart';
import '../entities/payment_authentication.dart';
import '../entities/payment_key.dart';

abstract class PaymentRepository {
  Future<Either<Failure, PaymentAuthentication>> authentication();

  Future<Either<Failure, OrderRegistration>> orderRegistration(
    OrderRegistrationParams params,
  );

  Future<Either<Failure, PaymentKey>> getPaymentKey(
      PaymentKeyRequestParams params);
  Future<Either<Failure, KioskDataPayment>> gerRefCode(String paymentToken);
}

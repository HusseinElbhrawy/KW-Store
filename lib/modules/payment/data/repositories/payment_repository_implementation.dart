// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:dartz/dartz.dart';
// import 'package:kw_store/modules/payment/domain/entities/kiosk_payment.dart';

// import '../../../../core/error/failure.dart';
// import '../../../../core/usecase/params/params.dart';
// import '../../domain/entities/order_registration.dart';
// import '../../domain/entities/payment_authentication.dart';
// import '../../domain/entities/payment_key.dart';
// import '../../domain/repositories/payment_repository.dart';
// import '../datasources/payment_remote_data_source.dart';

// class PaymentRepositoryImplementation implements PaymentRepository {
//   final PaymentRemoteDataSource _paymentRemoteDataSource;

//   PaymentRepositoryImplementation(this._paymentRemoteDataSource);
//   @override
//   Future<Either<Failure, PaymentAuthentication>> authentication() async {
//     try {
//       final result = await _paymentRemoteDataSource.authentication();
//       return Right(result);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, KioskDataPayment>> gerRefCode(
//       String paymentToken) async {
//     try {
//       final result = await _paymentRemoteDataSource.gerRefCode(paymentToken);
//       return Right(result);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, PaymentKey>> getPaymentKey(
//       PaymentKeyRequestParams params) async {
//     try {
//       final result = await _paymentRemoteDataSource.getPaymentKey(params);
//       return Right(result);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, OrderRegistration>> orderRegistration(
//       OrderRegistrationParams params) async {
//     try {
//       final result = await _paymentRemoteDataSource.orderRegistration(params);
//       return Right(result);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
// }

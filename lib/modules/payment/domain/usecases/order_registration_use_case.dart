// import 'package:dartz/dartz.dart';

// import '../../../../core/error/failure.dart';
// import '../../../../core/usecase/params/params.dart';
// import '../../../../core/usecase/usecase.dart';
// import '../entities/order_registration.dart';
// import '../repositories/payment_repository.dart';

// class OrderRegistrationUseCase
//     extends Usecase<OrderRegistration, OrderRegistrationParams> {
//   final PaymentRepository _repository;

//   OrderRegistrationUseCase(this._repository);
//   @override
//   Future<Either<Failure, OrderRegistration>> call(
//       OrderRegistrationParams params) async {
//     return await _repository.orderRegistration(params);
//   }
// }

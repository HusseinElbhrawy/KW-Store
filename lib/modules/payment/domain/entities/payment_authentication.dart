import 'package:equatable/equatable.dart';

class PaymentAuthentication extends Equatable {
  final String token;

  const PaymentAuthentication(this.token);
  @override
  List<Object> get props => [token];
}

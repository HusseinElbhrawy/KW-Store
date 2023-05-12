import 'package:equatable/equatable.dart';

class PaymentKey extends Equatable {
  final String token;

  const PaymentKey(this.token);
  @override
  List<Object?> get props => [token];
}

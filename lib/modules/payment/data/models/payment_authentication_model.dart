import 'dart:convert';

import '../../domain/entities/payment_authentication.dart';

class PaymentAuthenticationModel extends PaymentAuthentication {
  const PaymentAuthenticationModel(super.token);

  PaymentAuthenticationModel copyWith({String? token}) {
    return PaymentAuthenticationModel(
      token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory PaymentAuthenticationModel.fromMap(Map<String, dynamic> map) {
    return PaymentAuthenticationModel(
      map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentAuthenticationModel.fromJson(String source) =>
      PaymentAuthenticationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PaymentAuthenticationMode(token: $token)';

  @override
  bool operator ==(covariant PaymentAuthenticationModel other) {
    if (identical(this, other)) return true;

    return other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}

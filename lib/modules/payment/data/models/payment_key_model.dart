// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/payment_key.dart';

class PaymentKeyModel extends PaymentKey {
  const PaymentKeyModel(super.token);

  PaymentKeyModel copyWith({
    String? token,
  }) {
    return PaymentKeyModel(
      token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'token': token};
  }

  factory PaymentKeyModel.fromMap(Map<String, dynamic> map) {
    return PaymentKeyModel(
      map['token'] != null ? map['token'] as String : map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentKeyModel.fromJson(String source) =>
      PaymentKeyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PaymentKeyModel(token: $token)';

  @override
  bool operator ==(covariant PaymentKeyModel other) {
    if (identical(this, other)) return true;

    return other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}

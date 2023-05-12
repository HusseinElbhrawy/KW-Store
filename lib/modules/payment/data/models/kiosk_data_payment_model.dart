// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/kiosk_payment.dart';

class KioskDataPaymentModel extends KioskDataPayment {
  const KioskDataPaymentModel({
    required super.billReference,
  });

  KioskDataPaymentModel copyWith({
    int? billReference,
  }) {
    return KioskDataPaymentModel(
      billReference: billReference ?? this.billReference,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bill_reference': billReference,
    };
  }

  factory KioskDataPaymentModel.fromMap(Map<String, dynamic> map) {
    return KioskDataPaymentModel(
      billReference: map['data']['bill_reference'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory KioskDataPaymentModel.fromJson(String source) =>
      KioskDataPaymentModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'KioskDataPaymentModel(billReference: $billReference)';

  @override
  bool operator ==(covariant KioskDataPaymentModel other) {
    if (identical(this, other)) return true;

    return other.billReference == billReference;
  }

  @override
  int get hashCode => billReference.hashCode;
}

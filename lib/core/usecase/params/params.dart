// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginParams {
  final String email;
  final String password;
  final bool isRememberMe;

  LoginParams(this.email, this.password, {this.isRememberMe = true});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}

class RegisterParams {
  final String email;
  final String password;
  final String phone;
  final String name;
  RegisterParams({
    required this.email,
    required this.password,
    required this.phone,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'phone': phone,
      'name': name,
    };
  }
}

class UpdateProfileParams {
  final String name;
  final String phone;
  final String email;
  UpdateProfileParams({
    required this.name,
    required this.phone,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
}

class LocationParams {
  final double latitude;
  final double longitude;

  LocationParams(this.latitude, this.longitude);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class OrderRegistrationParams extends Equatable {
  final String authToken;
  final bool delivery;
  final double amountCents;
  final String currency;
  final int terminalId;
  final List<Item> items;
  final ShippingDataParams shippingData;
  const OrderRegistrationParams({
    required this.authToken,
    required this.delivery,
    required this.amountCents,
    required this.currency,
    required this.terminalId,
    required this.items,
    required this.shippingData,
  });

  @override
  List<Object> get props {
    return [
      authToken,
      delivery,
      amountCents,
      currency,
      terminalId,
      items,
      shippingData,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'auth_token': authToken,
      'delivery_needed': delivery,
      'amount_cents': amountCents,
      'currency': currency,
      'terminal_id': terminalId,
      'items': items.map((x) => x.toMap()).toList(),
      'shipping_data': shippingData.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;
}

class Item extends Equatable {
  final String name;
  final String amountCents;
  final int quantity;
  final String description;

  const Item({
    required this.name,
    required this.amountCents,
    required this.quantity,
    required this.description,
  });

  @override
  List<Object?> get props => [
        name,
        amountCents,
        quantity,
        description,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'amount_cents': amountCents,
      'quantity': quantity,
      'description': description,
    };
  }

  String toJson() => json.encode(toMap());
}

class ShippingDataParams extends Equatable {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  final String street;
  final String city;
  final String country;
  final String state;

  const ShippingDataParams({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.country,
    required this.state,
  });

  @override
  List<Object> get props {
    return [
      email,
      firstName,
      lastName,
      phoneNumber,
      street,
      city,
      country,
      state,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'street': street,
      'city': city,
      'country': country,
      'state': state,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;
}

class PaymentKeyRequestParams extends Equatable {
  final String authToken;
  final String amountCents;
  final int expiration;
  final String orderId;
  final BillingData billingData;
  final String currency;
  final int integrationId;
  final String lockOrderWhenPaid;
  const PaymentKeyRequestParams({
    required this.authToken,
    required this.amountCents,
    required this.expiration,
    required this.orderId,
    required this.billingData,
    required this.currency,
    required this.integrationId,
    required this.lockOrderWhenPaid,
  });

  @override
  List<Object> get props {
    return [
      authToken,
      amountCents,
      expiration,
      orderId,
      billingData,
      currency,
      integrationId,
      lockOrderWhenPaid,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'auth_token': authToken,
      'amount_cents': amountCents,
      'expiration': expiration,
      'order_id': orderId,
      'billing_data': billingData.toMap(),
      'currency': currency,
      'integration_id': integrationId,
      'lock_order_when_paid': lockOrderWhenPaid,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;
}

class BillingData extends Equatable {
  final String apartment;
  final String email;
  final String floor;
  final String firstName;
  final String street;
  final String building;
  final String phone;
  final String shippingMethod;
  final String postalCode;
  final String city;
  final String country;
  final String lastName;
  final String state;

  const BillingData({
    required this.apartment,
    required this.email,
    required this.floor,
    required this.firstName,
    required this.street,
    required this.building,
    required this.phone,
    required this.shippingMethod,
    required this.postalCode,
    required this.city,
    required this.country,
    required this.lastName,
    required this.state,
  });

  @override
  List<Object?> get props => [
        apartment,
        email,
        floor,
        firstName,
        street,
        building,
        phone,
        shippingMethod,
        postalCode,
        city,
        country,
        lastName,
        state,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apartment': apartment,
      'email': email,
      'floor': floor,
      'first_name': firstName,
      'street': street,
      'building': building,
      'phone_number': phone,
      'shipping_method': shippingMethod,
      'postal_code': postalCode,
      'city': city,
      'country': country,
      'last_name': lastName,
      'state': state,
    };
  }

  String toJson() => json.encode(toMap());
}

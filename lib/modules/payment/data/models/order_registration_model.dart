// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../domain/entities/order_registration.dart';

class OrderRegistrationModel extends OrderRegistration {
  const OrderRegistrationModel({
    required super.id,
    required super.createdAt,
    required super.deliveryNeeded,
    required super.merchant,
    required super.amountCents,
    required super.shippingData,
    required super.currency,
    required super.isPaymentLocked,
    required super.isReturn,
    required super.isCancel,
    required super.isReturned,
    required super.isCanceled,
    required super.paidAmountCents,
    required super.notifyUserWithEmail,
    required super.items,
    required super.orderUrl,
    required super.commissionFees,
    required super.deliveryFeesCents,
    required super.deliveryVatCents,
    required super.paymentMethod,
    required super.apiSource,
    required super.token,
    required super.url,
  });

  OrderRegistrationModel copyWith({
    int? id,
    String? createdAt,
    bool? deliveryNeeded,
    MerchantModel? merchant,
    int? amountCents,
    ShippingDataModel? shippingData,
    String? currency,
    bool? isPaymentLocked,
    bool? isReturn,
    bool? isCancel,
    bool? isReturned,
    bool? isCanceled,
    int? paidAmountCents,
    bool? notifyUserWithEmail,
    List<ItemsModel>? items,
    String? orderUrl,
    int? commissionFees,
    int? deliveryFeesCents,
    int? deliveryVatCents,
    String? paymentMethod,
    String? apiSource,
    String? token,
    String? url,
  }) {
    return OrderRegistrationModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      deliveryNeeded: deliveryNeeded ?? this.deliveryNeeded,
      merchant: merchant ?? this.merchant,
      amountCents: amountCents ?? this.amountCents,
      shippingData: shippingData ?? this.shippingData,
      currency: currency ?? this.currency,
      isPaymentLocked: isPaymentLocked ?? this.isPaymentLocked,
      isReturn: isReturn ?? this.isReturn,
      isCancel: isCancel ?? this.isCancel,
      isReturned: isReturned ?? this.isReturned,
      isCanceled: isCanceled ?? this.isCanceled,
      paidAmountCents: paidAmountCents ?? this.paidAmountCents,
      notifyUserWithEmail: notifyUserWithEmail ?? this.notifyUserWithEmail,
      items: items ?? this.items,
      orderUrl: orderUrl ?? this.orderUrl,
      commissionFees: commissionFees ?? this.commissionFees,
      deliveryFeesCents: deliveryFeesCents ?? this.deliveryFeesCents,
      deliveryVatCents: deliveryVatCents ?? this.deliveryVatCents,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      apiSource: apiSource ?? this.apiSource,
      token: token ?? this.token,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'delivery_needed': deliveryNeeded,
      'merchant': merchant,
      'amount_cents': amountCents,
      'shipping_data': shippingData,
      'currency': currency,
      'is_payment_locked': isPaymentLocked,
      'is_return': isReturn,
      'is_cancel': isCancel,
      'is_returned': isReturned,
      'is_canceled': isCanceled,
      'paid_amount_cents': paidAmountCents,
      'notify_user_with_email': notifyUserWithEmail,
      'items': items.map((x) => x).toList(),
      'order_url': orderUrl,
      'commission_fees': commissionFees,
      'delivery_fees_cents': deliveryFeesCents,
      'delivery_vat_cents': deliveryVatCents,
      'payment_method': paymentMethod,
      'api_source': apiSource,
      'token': token,
      'url': url,
    };
  }

  factory OrderRegistrationModel.fromMap(Map<String, dynamic> map) {
    return OrderRegistrationModel(
      id: map['id'] as int,
      createdAt: map['created_at'] as String,
      deliveryNeeded: map['delivery_needed'] as bool,
      merchant: MerchantModel.fromJson(map['merchant']),
      amountCents: map['amount_cents'] as int,
      shippingData: ShippingDataModel.fromJson(map['shipping_data']),
      currency: map['currency'] as String,
      isPaymentLocked: map['is_payment_locked'] as bool,
      isReturn: map['is_return'] as bool,
      isCancel: map['is_cancel'] as bool,
      isReturned: map['is_returned'] as bool,
      isCanceled: map['is_canceled'] as bool,
      paidAmountCents: map['paid_amount_cents'] as int,
      notifyUserWithEmail: map['notify_user_with_email'] as bool,
      items: List<ItemsModel>.from(
        (map['items'] as List<dynamic>)
            .map<ItemsModel>((x) => ItemsModel.fromJson(x)),
      ),
      orderUrl: map['order_url'] as String,
      commissionFees: map['commission_fees'] as int,
      deliveryFeesCents: map['delivery_fees_cents'] as int,
      deliveryVatCents: map['delivery_vat_cents'] as int,
      paymentMethod: map['payment_method'] as String,
      apiSource: map['api_source'] as String,
      token: map['token'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderRegistrationModel.fromJson(String source) =>
      OrderRegistrationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderRegistrationModel(id: $id, createdAt: $createdAt, deliveryNeeded: $deliveryNeeded, merchant: $merchant, amountCents: $amountCents, shippingData: $shippingData, currency: $currency, isPaymentLocked: $isPaymentLocked, isReturn: $isReturn, isCancel: $isCancel, isReturned: $isReturned, isCanceled: $isCanceled, paidAmountCents: $paidAmountCents, notifyUserWithEmail: $notifyUserWithEmail, items: $items, orderUrl: $orderUrl, commissionFees: $commissionFees, deliveryFeesCents: $deliveryFeesCents, deliveryVatCents: $deliveryVatCents, paymentMethod: $paymentMethod, apiSource: $apiSource, token: $token, url: $url)';
  }

  @override
  bool operator ==(covariant OrderRegistrationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createdAt == createdAt &&
        other.deliveryNeeded == deliveryNeeded &&
        other.merchant == merchant &&
        other.amountCents == amountCents &&
        other.shippingData == shippingData &&
        other.currency == currency &&
        other.isPaymentLocked == isPaymentLocked &&
        other.isReturn == isReturn &&
        other.isCancel == isCancel &&
        other.isReturned == isReturned &&
        other.isCanceled == isCanceled &&
        other.paidAmountCents == paidAmountCents &&
        other.notifyUserWithEmail == notifyUserWithEmail &&
        listEquals(other.items, items) &&
        other.orderUrl == orderUrl &&
        other.commissionFees == commissionFees &&
        other.deliveryFeesCents == deliveryFeesCents &&
        other.deliveryVatCents == deliveryVatCents &&
        other.paymentMethod == paymentMethod &&
        other.apiSource == apiSource &&
        other.token == token &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdAt.hashCode ^
        deliveryNeeded.hashCode ^
        merchant.hashCode ^
        amountCents.hashCode ^
        shippingData.hashCode ^
        currency.hashCode ^
        isPaymentLocked.hashCode ^
        isReturn.hashCode ^
        isCancel.hashCode ^
        isReturned.hashCode ^
        isCanceled.hashCode ^
        paidAmountCents.hashCode ^
        notifyUserWithEmail.hashCode ^
        items.hashCode ^
        orderUrl.hashCode ^
        commissionFees.hashCode ^
        deliveryFeesCents.hashCode ^
        deliveryVatCents.hashCode ^
        paymentMethod.hashCode ^
        apiSource.hashCode ^
        token.hashCode ^
        url.hashCode;
  }
}

class MerchantModel extends Merchant {
  const MerchantModel({
    required super.id,
    required super.createdAt,
    required super.phones,
    required super.companyEmails,
    required super.companyName,
    required super.state,
    required super.country,
    required super.city,
    required super.postalCode,
    required super.street,
  });

  MerchantModel copyWith({
    int? id,
    String? createdAt,
    List<String>? phones,
    List<String>? companyEmails,
    String? companyName,
    String? state,
    String? country,
    String? city,
    String? postalCode,
    String? street,
  }) {
    return MerchantModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      phones: phones ?? this.phones,
      companyEmails: companyEmails ?? this.companyEmails,
      companyName: companyName ?? this.companyName,
      state: state ?? this.state,
      country: country ?? this.country,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      street: street ?? this.street,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'phones': phones,
      'company_emails': companyEmails,
      'company_name': companyName,
      'state': state,
      'country': country,
      'city': city,
      'postal_code': postalCode,
      'street': street,
    };
  }

  factory MerchantModel.fromMap(Map<String, dynamic> map) {
    return MerchantModel(
      id: map['id'] as int,
      createdAt: map['created_at'] as String,
      phones: List<String>.from((map['phones'] as List<dynamic>)),
      companyEmails:
          List<String>.from((map['company_emails'] as List<dynamic>)),
      companyName: map['company_name'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
      city: map['city'] as String,
      postalCode: map['postal_code'] as String,
      street: map['street'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MerchantModel.fromJson(String source) =>
      MerchantModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MerchantModel(id: $id, createdAt: $createdAt, phones: $phones, companyEmails: $companyEmails, companyName: $companyName, state: $state, country: $country, city: $city, postalCode: $postalCode, street: $street)';
  }

  @override
  bool operator ==(covariant MerchantModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createdAt == createdAt &&
        listEquals(other.phones, phones) &&
        listEquals(other.companyEmails, companyEmails) &&
        other.companyName == companyName &&
        other.state == state &&
        other.country == country &&
        other.city == city &&
        other.postalCode == postalCode &&
        other.street == street;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdAt.hashCode ^
        phones.hashCode ^
        companyEmails.hashCode ^
        companyName.hashCode ^
        state.hashCode ^
        country.hashCode ^
        city.hashCode ^
        postalCode.hashCode ^
        street.hashCode;
  }
}

class ShippingDataModel extends ShippingData {
  const ShippingDataModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.street,
    required super.building,
    required super.floor,
    required super.apartment,
    required super.city,
    required super.state,
    required super.country,
    required super.email,
    required super.phoneNumber,
    required super.postalCode,
    required super.extraDescription,
    required super.shippingMethod,
    required super.orderId,
    required super.order,
  });

  ShippingDataModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? street,
    String? building,
    String? floor,
    String? apartment,
    String? city,
    String? state,
    String? country,
    String? email,
    String? phoneNumber,
    String? postalCode,
    String? extraDescription,
    String? shippingMethod,
    int? orderId,
    int? order,
  }) {
    return ShippingDataModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      street: street ?? this.street,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      apartment: apartment ?? this.apartment,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      postalCode: postalCode ?? this.postalCode,
      extraDescription: extraDescription ?? this.extraDescription,
      shippingMethod: shippingMethod ?? this.shippingMethod,
      orderId: orderId ?? this.orderId,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'street': street,
      'building': building,
      'floor': floor,
      'apartment': apartment,
      'city': city,
      'state': state,
      'country': country,
      'email': email,
      'phone_number': phoneNumber,
      'postal_code': postalCode,
      'extra_description': extraDescription,
      'shipping_method': shippingMethod,
      'order_id': orderId,
      'order': order,
    };
  }

  factory ShippingDataModel.fromMap(Map<String, dynamic> map) {
    return ShippingDataModel(
      id: map['id'] as int,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      street: map['street'] as String,
      building: map['building'] as String,
      floor: map['floor'] as String,
      apartment: map['apartment'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
      email: map['email'] as String,
      phoneNumber: map['phone_number'] as String,
      postalCode: map['postal_code'] as String,
      extraDescription: map['extra_description'] as String,
      shippingMethod: map['shipping_method'] as String,
      orderId: map['order_id'] as int,
      order: map['order'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShippingDataModel.fromJson(String source) =>
      ShippingDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShippingDataModel(id: $id, firstName: $firstName, lastName: $lastName, street: $street, building: $building, floor: $floor, apartment: $apartment, city: $city, state: $state, country: $country, email: $email, phoneNumber: $phoneNumber, postalCode: $postalCode, extraDescription: $extraDescription, shippingMethod: $shippingMethod, orderId: $orderId, order: $order)';
  }

  @override
  bool operator ==(covariant ShippingDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.street == street &&
        other.building == building &&
        other.floor == floor &&
        other.apartment == apartment &&
        other.city == city &&
        other.state == state &&
        other.country == country &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.postalCode == postalCode &&
        other.extraDescription == extraDescription &&
        other.shippingMethod == shippingMethod &&
        other.orderId == orderId &&
        other.order == order;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        street.hashCode ^
        building.hashCode ^
        floor.hashCode ^
        apartment.hashCode ^
        city.hashCode ^
        state.hashCode ^
        country.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        postalCode.hashCode ^
        extraDescription.hashCode ^
        shippingMethod.hashCode ^
        orderId.hashCode ^
        order.hashCode;
  }
}

class ItemsModel extends Items {
  const ItemsModel({
    required super.name,
    required super.description,
    required super.amountCents,
    required super.quantity,
  });

  ItemsModel copyWith({
    String? name,
    String? description,
    int? amountCents,
    int? quantity,
  }) {
    return ItemsModel(
      name: name ?? this.name,
      description: description ?? this.description,
      amountCents: amountCents ?? this.amountCents,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'amount_cents': amountCents,
      'quantity': quantity,
    };
  }

  factory ItemsModel.fromMap(Map<String, dynamic> map) {
    return ItemsModel(
      name: map['name'] as String,
      description: map['description'] as String,
      amountCents: map['amount_cents'] as int,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemsModel.fromJson(String source) =>
      ItemsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemsModel(name: $name, description: $description, amount_cents: $amountCents, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant ItemsModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.amountCents == amountCents &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        amountCents.hashCode ^
        quantity.hashCode;
  }
}

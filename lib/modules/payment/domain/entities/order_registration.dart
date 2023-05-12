import 'package:equatable/equatable.dart';

class OrderRegistration extends Equatable {
  final int id;
  final String createdAt;
  final bool deliveryNeeded;
  final Merchant merchant;
  final int amountCents;
  final ShippingData shippingData;
  final String currency;
  final bool isPaymentLocked;
  final bool isReturn;
  final bool isCancel;
  final bool isReturned;
  final bool isCanceled;
  final int paidAmountCents;
  final bool notifyUserWithEmail;
  final List<Items> items;
  final String orderUrl;
  final int commissionFees;
  final int deliveryFeesCents;
  final int deliveryVatCents;
  final String paymentMethod;
  final String apiSource;
  final String token;
  final String url;

  const OrderRegistration({
    required this.id,
    required this.createdAt,
    required this.deliveryNeeded,
    required this.merchant,
    required this.amountCents,
    required this.shippingData,
    required this.currency,
    required this.isPaymentLocked,
    required this.isReturn,
    required this.isCancel,
    required this.isReturned,
    required this.isCanceled,
    required this.paidAmountCents,
    required this.notifyUserWithEmail,
    required this.items,
    required this.orderUrl,
    required this.commissionFees,
    required this.deliveryFeesCents,
    required this.deliveryVatCents,
    required this.paymentMethod,
    required this.apiSource,
    required this.token,
    required this.url,
  });
  @override
  List<Object?> get props => [
        id,
        createdAt,
        deliveryNeeded,
        merchant,
        amountCents,
        shippingData,
        currency,
        isPaymentLocked,
        isReturn,
        isCancel,
        isReturned,
        isCanceled,
        paidAmountCents,
        notifyUserWithEmail,
        items,
        orderUrl,
        commissionFees,
        deliveryFeesCents,
        deliveryVatCents,
        paymentMethod,
        apiSource,
        token,
        url,
      ];
}

class Merchant extends Equatable {
  const Merchant({
    required this.id,
    required this.createdAt,
    required this.phones,
    required this.companyEmails,
    required this.companyName,
    required this.state,
    required this.country,
    required this.city,
    required this.postalCode,
    required this.street,
  });
  final int id;
  final String createdAt;
  final List<String> phones;
  final List<String> companyEmails;
  final String companyName;
  final String state;
  final String country;
  final String city;
  final String postalCode;
  final String street;

  @override
  List<Object?> get props => [
        id,
        createdAt,
        phones,
        companyEmails,
        companyName,
        state,
        country,
        city,
        postalCode,
        street,
      ];
}

class ShippingData extends Equatable {
  const ShippingData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.building,
    required this.floor,
    required this.apartment,
    required this.city,
    required this.state,
    required this.country,
    required this.email,
    required this.phoneNumber,
    required this.postalCode,
    required this.extraDescription,
    required this.shippingMethod,
    required this.orderId,
    required this.order,
  });
  final int id;
  final String firstName;
  final String lastName;
  final String street;
  final String building;
  final String floor;
  final String apartment;
  final String city;
  final String state;
  final String country;
  final String email;
  final String phoneNumber;
  final String postalCode;
  final String extraDescription;
  final String shippingMethod;
  final int orderId;
  final int order;

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        street,
        building,
        floor,
        apartment,
        city,
        state,
        country,
        email,
        phoneNumber,
        postalCode,
        extraDescription,
        shippingMethod,
        orderId,
        order,
      ];
}

class Items extends Equatable {
  const Items({
    required this.name,
    required this.description,
    required this.amountCents,
    required this.quantity,
  });
  final String name;
  final String description;
  final int amountCents;
  final int quantity;

  @override
  List<Object?> get props => [
        name,
        description,
        amountCents,
        quantity,
      ];
}

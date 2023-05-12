// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../domain/entities/cart.dart';

class CartModel extends Cart {
  const CartModel({
    required super.status,
    required super.message,
  });

  CartModel copyWith({
    bool? status,
    String? message,
    CartDataModel? data,
  }) {
    return CartModel(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      status: map['status'] as bool,
      message: map['message'] != null ? map['message'] as String : null,
      // data: map['data'] != null
      //     ? CartDataModel.fromMap(map['data'] as Map<String, dynamic>)
      //     : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.status == status && other.message == message;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode;
}

class AllCartModel extends AllCart {
  const AllCartModel({
    required super.data,
    required super.status,
    required super.message,
  });

  AllCartModel copyWith({
    CartDataModel? data,
    String? message,
    bool? status,
  }) {
    return AllCartModel(
      data: data ?? this.data,
      message: message ?? this.message!,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'message': message,
      'status': status,
    };
  }

  factory AllCartModel.fromMap(Map<String, dynamic> map) {
    return AllCartModel(
      data: CartDataModel.fromMap(map['data'] as Map<String, dynamic>),
      message: map['message'],
      status: map['status'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllCartModel.fromJson(String source) =>
      AllCartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AllCartModel(data: $data, message: $message, status: $status)';

  @override
  bool operator ==(covariant AllCartModel other) {
    if (identical(this, other)) return true;

    return other.data == data &&
        other.message == message &&
        other.status == status;
  }

  @override
  int get hashCode => data.hashCode ^ message.hashCode ^ status.hashCode;
}

class CartDataModel extends CartData {
  CartDataModel({
    required super.total,
    required super.products,
  });

  CartDataModel copyWith({
    num? total,
    List<CartItemModel>? products,
  }) {
    return CartDataModel(
      total: total ?? this.total,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'cart_items': products.map((x) => x).toList(),
    };
  }

  factory CartDataModel.fromMap(Map<String, dynamic> map) {
    return CartDataModel(
      total: map['total'],
      products: List<CartItemModel>.from(
        (map['cart_items'] as List).map<CartItemModel>(
          (x) => CartItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartDataModel.fromJson(String source) =>
      CartDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartDataModel(total: $total, cart_items: $products)';

  @override
  bool operator ==(covariant CartDataModel other) {
    if (identical(this, other)) return true;

    return other.total == total && listEquals(other.products, products);
  }

  @override
  int get hashCode => total.hashCode ^ products.hashCode;
}

class CartProductModel extends CartProduct {
  const CartProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
    required super.price,
    required super.oldPrice,
    required super.discount,
  });

  CartProductModel copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    num? price,
    num? oldPrice,
    num? discount,
  }) {
    return CartProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      discount: discount ?? this.discount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'old_price': oldPrice,
      'discount': discount,
    };
  }

  factory CartProductModel.fromMap(Map<String, dynamic> map) {
    return CartProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: map['price'] as num,
      oldPrice: map['old_price'] as num,
      discount: map['discount'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProductModel.fromJson(String source) =>
      CartProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartProductModel(id: $id, name: $name, description: $description, image: $image, price: $price, oldPrice: $oldPrice, discount: $discount)';
  }

  @override
  bool operator ==(covariant CartProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.image == image &&
        other.price == price &&
        other.oldPrice == oldPrice &&
        other.discount == discount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        image.hashCode ^
        price.hashCode ^
        oldPrice.hashCode ^
        discount.hashCode;
  }
}

class CartItemModel extends CartItem {
  CartItemModel({
    required super.id,
    required super.quantity,
    required super.product,
  });

  CartItemModel copyWith({
    num? id,
    num? quantity,
    CartProductModel? product,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
      'product': product,
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'] as num,
      quantity: map['quantity'] as num,
      product: CartProductModel.fromMap(map['product'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CartItemModel(id: $id, quantity: $quantity, product: $product)';

  @override
  bool operator ==(covariant CartItemModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.quantity == quantity &&
        other.product == product;
  }

  @override
  int get hashCode => id.hashCode ^ quantity.hashCode ^ product.hashCode;
}

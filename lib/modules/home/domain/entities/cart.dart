// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';

import 'favorites.dart';

class Cart extends Equatable {
  final bool status;
  final String? message;
  const Cart({
    required this.status,
    required this.message,
  });

  @override
  List<Object> get props => [status, message!];
}

class AllCart extends Cart {
  final CartData data;

  const AllCart({required this.data, required bool status, String? message})
      : super(
          message: message,
          status: status,
        );

  @override
  List<Object> get props => [status, message!, data];
}

class CartData extends Equatable {
  num total;
  final List<CartItem> products;

  CartData({required this.total, required this.products});

  @override
  List<Object?> get props => [
        total,
        products,
      ];
}

class CartProduct extends FavoritesProduct {
  const CartProduct({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
    required super.price,
    required super.oldPrice,
    required super.discount,
  });
}

class CartItem extends Equatable {
  final num id;

  num quantity;
  final CartProduct product;

  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  @override
  List<Object> get props => [id, quantity, product];
}

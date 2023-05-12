// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Favorites extends Equatable {
  final bool status;
  final String message;
  const Favorites({
    required this.status,
    required this.message,
  });

  @override
  List<Object> get props => [status, message];
}

class AllFavorites extends Favorites {
  final FavoritesData data;
  const AllFavorites({
    required this.data,
    required bool status,
    required String message,
  }) : super(status: status, message: message);

  @override
  List<Object> get props => [data, status, message];
}

class FavoritesData extends Equatable {
  final int total;
  final List<FavoritesItemData> data;
  const FavoritesData({
    required this.total,
    required this.data,
  });
  @override
  List<Object?> get props => [
        total,
        data,
      ];
}

class FavoritesProduct extends Equatable {
  final int id;
  final String name;
  final String description;
  final String image;
  final num price;
  final num oldPrice;
  final num discount;

  const FavoritesProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
        price,
        oldPrice,
        discount,
      ];
}

class FavoritesItemData extends Equatable {
  final int id;
  final FavoritesProduct product;
  const FavoritesItemData({
    required this.id,
    required this.product,
  });

  @override
  List<Object?> get props => [
        id,
        product,
      ];
}

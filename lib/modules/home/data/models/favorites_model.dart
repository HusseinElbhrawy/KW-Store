// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../domain/entities/favorites.dart';

class FavoritesModel extends Favorites {
  const FavoritesModel({
    required super.status,
    required super.message,
  });

  FavoritesModel copyWith({
    bool? status,
    String? message,
  }) {
    return FavoritesModel(
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

  factory FavoritesModel.fromMap(Map<String, dynamic> map) {
    return FavoritesModel(
      status: map['status'] as bool,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoritesModel.fromJson(String source) =>
      FavoritesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FavoritesModel(status: $status, message: $message)';

  @override
  bool operator ==(covariant FavoritesModel other) {
    if (identical(this, other)) return true;

    return other.status == status && other.message == message;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode;
}

class ALlFavoritesModel extends AllFavorites {
  const ALlFavoritesModel({
    required super.data,
    required super.status,
    required super.message,
  });

  ALlFavoritesModel copyWith({
    FavoritesDataModel? data,
    String? message,
    bool? status,
  }) {
    return ALlFavoritesModel(
      data: data ?? this.data,
      message: message ?? this.message,
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

  factory ALlFavoritesModel.fromMap(Map<String, dynamic> map) {
    return ALlFavoritesModel(
      data: FavoritesDataModel.fromMap(map['data'] as Map<String, dynamic>),
      message: map['message'].toString(),
      status: map['status'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ALlFavoritesModel.fromJson(String source) =>
      ALlFavoritesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ALlFavoritesModel(data: $data)';

  @override
  bool operator ==(covariant ALlFavoritesModel other) {
    if (identical(this, other)) return true;

    return other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class FavoritesDataModel extends FavoritesData {
  const FavoritesDataModel({
    required super.total,
    required super.data,
  });

  FavoritesDataModel copyWith({
    int? total,
    List<FavoritesItemDataModel>? data,
  }) {
    return FavoritesDataModel(
      total: total ?? this.total,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'data': data.map((x) => x).toList(),
    };
  }

  factory FavoritesDataModel.fromMap(Map<String, dynamic> map) {
    return FavoritesDataModel(
      total: map['total'] as int,
      data: List<FavoritesItemDataModel>.from(
        (map['data'] as List).map<FavoritesItemDataModel>(
          (x) => FavoritesItemDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoritesDataModel.fromJson(String source) =>
      FavoritesDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FavoritesDataModel(total: $total, data: $data)';

  @override
  bool operator ==(covariant FavoritesDataModel other) {
    if (identical(this, other)) return true;

    return other.total == total && listEquals(other.data, data);
  }

  @override
  int get hashCode => total.hashCode ^ data.hashCode;
}

class FavoritesProductModel extends FavoritesProduct {
  const FavoritesProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
    required super.price,
    required super.oldPrice,
    required super.discount,
  });

  FavoritesProductModel copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    double? price,
    double? oldPrice,
    double? discount,
  }) {
    return FavoritesProductModel(
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

  factory FavoritesProductModel.fromMap(Map<String, dynamic> map) {
    return FavoritesProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: map['price'],
      oldPrice: map['old_price'],
      discount: map['discount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoritesProductModel.fromJson(String source) =>
      FavoritesProductModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FavoritesProductModel(id: $id, name: $name, description: $description, image: $image, price: $price, oldPrice: $oldPrice, discount: $discount)';
  }

  @override
  bool operator ==(covariant FavoritesProductModel other) {
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

class FavoritesItemDataModel extends FavoritesItemData {
  const FavoritesItemDataModel({
    required super.id,
    required super.product,
  });

  FavoritesItemDataModel copyWith({
    int? id,
    FavoritesProductModel? product,
  }) {
    return FavoritesItemDataModel(
      id: id ?? this.id,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': product,
    };
  }

  factory FavoritesItemDataModel.fromMap(Map<String, dynamic> map) {
    return FavoritesItemDataModel(
      id: map['id'] as int,
      product:
          FavoritesProductModel.fromMap(map['product'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoritesItemDataModel.fromJson(String source) =>
      FavoritesItemDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FavoritesItemDataModel(id: $id, product: $product)';

  @override
  bool operator ==(covariant FavoritesItemDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.product == product;
  }

  @override
  int get hashCode => id.hashCode ^ product.hashCode;
}

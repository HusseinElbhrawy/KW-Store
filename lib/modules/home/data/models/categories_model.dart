// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kw_store/modules/home/data/models/home_model.dart';

import '../../domain/entities/categories.dart';

class CategoriesModel extends Categories {
  const CategoriesModel({
    required super.status,
    super.data,
    super.message,
  });

  CategoriesModel copyWith({
    bool? status,
    String? message,
    CategoriesDataModel? data,
  }) {
    return CategoriesModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      status: map['status'] as bool,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? CategoriesDataModel.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CategoriesModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant CategoriesModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class CategoriesDataModel extends CategoriesData {
  const CategoriesDataModel({
    required super.total,
    required super.data,
  });

  CategoriesDataModel copyWith({
    int? total,
    List<CategoriesInnerDataModel>? data,
  }) {
    return CategoriesDataModel(
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

  factory CategoriesDataModel.fromMap(Map<String, dynamic> map) {
    return CategoriesDataModel(
      total: map['total'] as int,
      data: List<CategoriesInnerDataModel>.from(
        (map['data'] as List).map<CategoriesInnerDataModel>(
          (x) => CategoriesInnerDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesDataModel.fromJson(String source) =>
      CategoriesDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoriesDataModel(total: $total, data: $data)';

  @override
  bool operator ==(covariant CategoriesDataModel other) {
    if (identical(this, other)) return true;

    return other.total == total && listEquals(other.data, data);
  }

  @override
  int get hashCode => total.hashCode ^ data.hashCode;
}

class CategoriesInnerDataModel extends CategoriesInnerData {
  const CategoriesInnerDataModel({
    required super.id,
    required super.name,
    required super.image,
  });

  CategoriesInnerDataModel copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return CategoriesInnerDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CategoriesInnerDataModel.fromMap(Map<String, dynamic> map) {
    return CategoriesInnerDataModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesInnerDataModel.fromJson(String source) =>
      CategoriesInnerDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CategoriesInnerDataModel(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant CategoriesInnerDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}

class SpecificCategoryModel extends SpecificCategory {
  const SpecificCategoryModel({
    required super.status,
    required super.message,
    required super.data,
  });

  SpecificCategoryModel copyWith({
    bool? status,
    String? message,
    SpecificCategoryDataModel? data,
  }) {
    return SpecificCategoryModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory SpecificCategoryModel.fromMap(Map<String, dynamic> map) {
    return SpecificCategoryModel(
      status: map['status'] as bool,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? SpecificCategoryDataModel.fromMap(
              map['data'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecificCategoryModel.fromJson(String source) =>
      SpecificCategoryModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SpecificCategoryModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant SpecificCategoryModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class SpecificCategoryDataModel extends SpecificCategoryData {
  const SpecificCategoryDataModel({
    required super.total,
    required super.data,
  });

  SpecificCategoryDataModel copyWith({
    int? total,
    List<ProductModel>? data,
  }) {
    return SpecificCategoryDataModel(
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

  factory SpecificCategoryDataModel.fromMap(Map<String, dynamic> map) {
    return SpecificCategoryDataModel(
      total: map['total'] as int,
      data: List<ProductModel>.from(
        (map['data'] as List).map<ProductModel>(
          (x) => ProductModel.fromMap(
            x as Map<String, dynamic>,
            //
          ),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecificCategoryDataModel.fromJson(String source) =>
      SpecificCategoryDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SpecificCategoryDataModel(total: $total, data: $data)';

  @override
  bool operator ==(covariant SpecificCategoryDataModel other) {
    if (identical(this, other)) return true;

    return other.total == total && listEquals(other.data, data);
  }

  @override
  int get hashCode => total.hashCode ^ data.hashCode;
}

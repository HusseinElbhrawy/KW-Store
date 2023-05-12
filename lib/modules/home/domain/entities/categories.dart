import 'package:equatable/equatable.dart';

import 'home.dart';

class Categories extends Equatable {
  final bool status;
  final String? message;
  final CategoriesData? data;

  const Categories({
    required this.status,
    this.message,
    this.data,
  });
  @override
  List<Object?> get props => [
        message,
        status,
        data,
      ];
}

class CategoriesData extends Equatable {
  final int total;
  final List<CategoriesInnerData> data;

  const CategoriesData({
    required this.total,
    required this.data,
  });
  @override
  List<Object?> get props => [
        total,
        data,
      ];
}

class CategoriesInnerData extends Equatable {
  final int id;
  final String name;
  final String image;

  const CategoriesInnerData({
    required this.id,
    required this.name,
    required this.image,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}

class SpecificCategory extends Equatable {
  final bool status;
  final String? message;
  final SpecificCategoryData? data;

  const SpecificCategory({
    required this.status,
    required this.message,
    required this.data,
  });
  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}

class SpecificCategoryData extends Equatable {
  final int total;
  final List<Product> data;

  const SpecificCategoryData({required this.total, required this.data});
  @override
  List<Object?> get props => [
        total,
        data,
      ];
}

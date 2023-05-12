part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetHomeDataEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class GetCategoriesDataEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class AddOrRemoveToCartEvent extends HomeEvent {
  final CartItem product;
  final int index;
  final bool removeFromCartScreen;
  const AddOrRemoveToCartEvent({
    required this.product,
    required this.index,
    this.removeFromCartScreen = false,
  });
  @override
  List<Object?> get props => [
        product,
        index,
        removeFromCartScreen,
      ];
}

class GetCartDataEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class AddOrRemoveToFavoriteEvent extends HomeEvent {
  final FavoritesProduct product;
  final int index;
  const AddOrRemoveToFavoriteEvent({
    required this.product,
    required this.index,
  });
  @override
  List<Object?> get props => [
        product,
        index,
      ];
}

class GetFavoriteDataEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class GetTotalPriceEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class GetSpecificCategoryEvent extends HomeEvent {
  final String categoryId;

  const GetSpecificCategoryEvent(this.categoryId);
  @override
  List<Object?> get props => [categoryId];
}

class SearchEvent extends HomeEvent {
  final String searchQuery;

  const SearchEvent(this.searchQuery);
  @override
  List<Object?> get props => [searchQuery];
}

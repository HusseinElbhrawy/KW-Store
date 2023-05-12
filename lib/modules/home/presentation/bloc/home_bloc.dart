// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/modules/home/domain/usecases/get_specific_category_use_case.dart';

import '../../../../core/usecase/params/params.dart';
import '../../../../core/utils/enums.dart';
import '../../data/models/cart_model.dart';
import '../../data/models/favorites_model.dart';
import '../../domain/entities/cart.dart';
import '../../domain/entities/categories.dart';
import '../../domain/entities/favorites.dart';
import '../../domain/entities/home.dart';
import '../../domain/usecases/add_or_remove_favorites_use_case.dart';
import '../../domain/usecases/add_or_remove_from_cart_use_case.dart';
import '../../domain/usecases/get_all_favorites_use_case.dart';
import '../../domain/usecases/get_cart_use_case.dart';
import '../../domain/usecases/get_categories_data_use_case.dart';
import '../../domain/usecases/get_home_data_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  final GetCategoriesDataUseCase getCategoriesDataUsecase;
  final AddOrRemoveFavoritesUseCase addOrRemoveFavoritesUseCase;
  final AddOrRemoveFromCartUseCase addOrRemoveCartUseCase;
  final GetAllFavoritesUseCase getAllFavoritesUseCase;
  final GetCartUseCase getCartUseCase;
  final GetSpecificCategoryUseCase getSpecificCategoryUseCase;
  HomeBloc(
    this.getHomeDataUseCase,
    this.getCategoriesDataUsecase,
    this.addOrRemoveCartUseCase,
    this.addOrRemoveFavoritesUseCase,
    this.getAllFavoritesUseCase,
    this.getCartUseCase,
    this.getSpecificCategoryUseCase,
  ) : super(const HomeState()) {
    on<GetHomeDataEvent>((event, emit) {
      return _getHomeData();
    });

    on<GetCategoriesDataEvent>((event, emit) {
      return _getCategoriesData();
    });

    on<AddOrRemoveToCartEvent>((event, emit) {
      return _addOrRemoveFromCart(
        event.product,
        event.index,
        removeFromCartScreen: event.removeFromCartScreen,
      );
    });

    on<GetCartDataEvent>((event, emit) {
      return _getCart();
    });

    on<AddOrRemoveToFavoriteEvent>((event, emit) {
      return _addOrRemoveToFavorites(event.product, event.index);
    });

    on<GetFavoriteDataEvent>((event, emit) {
      return _getFavorites();
    });
    on<GetTotalPriceEvent>((event, emit) {
      return _getTotal();
    });

    on<GetSpecificCategoryEvent>((event, emit) {
      return _getSpecificCategory(event.categoryId);
    });

    on<SearchEvent>((event, emit) {
      return _searchProduct(event.searchQuery);
    });
  }

  void _getHomeData() async {
    emit(state.copyWith(homeProductsState: RequestState.loading));

    final result = await getHomeDataUseCase(NoParams());

    emit(
      result.fold(
        (failure) {
          log(failure.toString());

          return state.copyWith(
            homeProductsState: RequestState.error,
            homeProductsErrorMessage: failure.message.toString(),
          );
        },
        (home) {
          getTotalPrice();
          return state.copyWith(
            homeProductsState: RequestState.loaded,
            homeProductsData: home,
          );
        },
      ),
    );
  }

  void _getTotal() {
    if (state.getCartDataState == RequestState.loaded &&
        state.homeProductsState == RequestState.loaded &&
        state.getFavoriteDataState == RequestState.loaded &&
        state.homeCategoriesState == RequestState.loaded) {
      getTotalPrice();
    }
  }

  void _getCategoriesData() async {
    emit(state.copyWith(homeCategoriesState: RequestState.loading));

    final result = await getCategoriesDataUsecase(NoParams());

    emit(
      result.fold(
        (failure) {
          log(failure.toString());

          return state.copyWith(
            homeCategoriesState: RequestState.error,
            homeCategoriesErrorMessage: failure.message.toString(),
          );
        },
        (categories) {
          return state.copyWith(
            homeCategoriesState: RequestState.loaded,
            homeCategoriesData: categories,
          );
        },
      ),
    );
  }

  void _addOrRemoveFromCart(CartItem product, int index,
      {bool? removeFromCartScreen}) async {
    _addOrRemoveFromCartList(product, index);
    log(removeFromCartScreen.toString());

    if (removeFromCartScreen == false) {
      emit(state.copyWith(
        addOrRemoveToCartState: RequestState.loading,
        addToCartIndex: index,
      ));
    }

    final result = await addOrRemoveCartUseCase(product.product.id.toString());

    emit(
      result.fold(
        (failure) {
          log(failure.message.toString());

          return state.copyWith(
            addOrRemoveToCartState: RequestState.error,
            addToCartErrorMessage: failure.message.toString(),
            addToCartIndex: index,
          );
        },
        (response) {
          return state.copyWith(
            addOrRemoveToCartState: RequestState.loaded,
            addToCartIndex: index,
          );
        },
      ),
    );
  }

  void _addOrRemoveFromCartList(CartItem cartItem, int index) {
    if (isProductInCart(cartItem.product.id)) {
      state.getCartDataData!.data.products.removeWhere(
        (element) => element.product.id == cartItem.product.id,
      );
    } else {
      final CartItemModel item = CartItemModel(
        id: cartItem.id.toInt(),
        product: CartProductModel(
          id: cartItem.product.id,
          name: cartItem.product.name,
          price: cartItem.product.price,
          oldPrice: cartItem.product.oldPrice,
          discount: cartItem.product.discount,
          image: cartItem.product.image,
          description: cartItem.product.description,
        ),
        quantity: 1,
      );
      state.getCartDataData!.data.products.add(item);
    }

    getTotalPrice();
  }

  void _getCart() async {
    emit(state.copyWith(getCartDataState: RequestState.loading));

    final result = await getCartUseCase(NoParams());

    emit(
      result.fold(
        (failure) {
          log(failure.message.toString());

          return state.copyWith(
            getCartDataState: RequestState.error,
            getCartDataErrorMessage: failure.message.toString(),
          );
        },
        (response) {
          return state.copyWith(
            getCartDataState: RequestState.loaded,
            getCartDataData: response,
          );
        },
      ),
    );
  }

  void _addOrRemoveToFavorites(FavoritesProduct product, int index) async {
    _addOrRemoveFromFavoritesList(product, index);
    emit(
      state.copyWith(
        addOrRemoveToFavoriteState: RequestState.loading,
        addToFavIndex: index,
      ),
    );

    final result = await addOrRemoveFavoritesUseCase(product.id.toString());

    emit(
      result.fold(
        (failure) {
          log(failure.message.toString());

          return state.copyWith(
            addOrRemoveToFavoriteState: RequestState.error,
            addOrRemoveToFavoriteErrorMessage: failure.message.toString(),
            addToFavIndex: index,
          );
        },
        (favorites) {
          // _addOrRemoveFromFavoritesList(product, index);

          return state.copyWith(
            addOrRemoveToFavoriteState: RequestState.loaded,
            addToFavIndex: index,
          );
        },
      ),
    );
  }

  void _addOrRemoveFromFavoritesList(FavoritesProduct product, int index) {
    if (isProductInFavorites(product.id)) {
      state.getFavoriteDataData!.data.data.removeWhere(
        (element) => element.product.id == product.id,
      );
    } else {
      final FavoritesItemDataModel item = FavoritesItemDataModel(
        id: product.id,
        product: FavoritesProduct(
          id: product.id,
          name: product.name,
          description: product.description,
          image: product.image,
          price: product.price,
          oldPrice: product.oldPrice,
          discount: product.discount,
        ),
      );
      state.getFavoriteDataData!.data.data.add(item);
    }
  }

  void _getFavorites() async {
    emit(state.copyWith(getFavoriteDataState: RequestState.loading));

    final result = await getAllFavoritesUseCase(NoParams());

    emit(
      result.fold(
        (failure) {
          log(failure.message.toString());

          return state.copyWith(
            getFavoriteDataState: RequestState.error,
            getFavoriteDataErrorMessage: failure.message.toString(),
          );
        },
        (response) {
          return state.copyWith(
            getFavoriteDataState: RequestState.loaded,
            getFavoriteDataData: response,
          );
        },
      ),
    );
  }

  void _getSpecificCategory(String id) async {
    emit(state.copyWith(specificCategoryState: RequestState.loading));

    final result = await getSpecificCategoryUseCase(id);

    emit(
      result.fold(
        (failure) {
          log(failure.message.toString());
          return state.copyWith(
            specificCategoryState: RequestState.error,
            specificCategoryErrorMessage: failure.message.toString(),
          );
        },
        (response) {
          return state.copyWith(
            specificCategoryState: RequestState.loaded,
            specificCategoryData: response,
          );
        },
      ),
    );
  }

  void _searchProduct(String text) async {
    emit(
      state.copyWith(
        searchProductsState: RequestState.loading,
        isSearch: true,
      ),
    );

    final result = state.homeProductsData.data!.products!.where(
      (element) {
        return element.name!.toLowerCase().contains(text.toLowerCase());
      },
    );

    emit(
      state.copyWith(
        searchProductsState: RequestState.loaded,
        searchProductsData: result.toList(),
        // isSearch: false,
      ),
    );
    log(state.searchProductsData!.length.toString());
  }

  bool isProductInFavorites(int productId) {
    return state.getFavoriteDataData!.data.data
        .any((element) => element.product.id == productId);
  }

  bool isProductInCart(int productId) {
    return state.getCartDataData!.data.products
        .any((element) => element.product.id == productId);
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var element in state.getCartDataData!.data.products) {
      totalPrice += element.product.price * element.quantity;
    }
    emit(state.copyWith(totalPrice: totalPrice));
    log(state.totalPrice.toString());
    return totalPrice;
  }

  void incrementQuantity(int index) {
    num counter = state.getCartDataData!.data.products[index].quantity;
    if (counter == 99) return;
    counter++;
    state.getCartDataData!.data.products[index].quantity = counter;

    emit(state.copyWith(getCartDataData: state.getCartDataData));
    getTotalPrice();
  }

  void decrementQuantity(int index) {
    num counter = state.getCartDataData!.data.products[index].quantity;
    if (counter == 1) return;
    counter--;
    state.getCartDataData!.data.products[index].quantity = counter;

    emit(state.copyWith(getCartDataData: state.getCartDataData));
    getTotalPrice();
  }

  @override
  Future<void> close() {
    log('HomeBloc closed', error: 'HomeBloc closed');
    return super.close();
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.homeProductsState = RequestState.initial,
    this.homeProductsData = const Home(status: false),
    this.homeProductsErrorMessage = '',

    //! Home categories
    this.homeCategoriesState = RequestState.initial,
    this.homeCategoriesErrorMessage = '',
    this.homeCategoriesData = const Categories(status: false),

    //! Add OR Remove To Cart
    this.addOrRemoveToCartState = RequestState.initial,
    this.addToCartErrorMessage = '',
    this.addToCartIndex = 0,

    //! Get Cart Data
    this.getCartDataState = RequestState.initial,
    this.getCartDataErrorMessage = '',
    this.getCartDataData,
    //! Add OR Remove To Favorite
    this.addOrRemoveToFavoriteState = RequestState.initial,
    this.addOrRemoveToFavoriteErrorMessage = '',
    this.addToFavIndex = 0,
    //! Get Favorite Data
    this.getFavoriteDataState = RequestState.initial,
    this.getFavoriteDataErrorMessage = '',
    this.getFavoriteDataData,
    //! Total Price
    this.totalPrice = 0.0,

    //! Specific Category
    this.specificCategoryState = RequestState.initial,
    this.specificCategoryErrorMessage = '',
    this.specificCategoryData = const SpecificCategory(
      status: false,
      message: '',
      data: SpecificCategoryData(total: 0, data: []),
    ),

    //! Search Products
    this.searchProductsState = RequestState.initial,
    this.searchProductsErrorMessage = '',
    this.searchProductsData,
    this.isSearch = false,
  });

  //! Home Products
  final RequestState homeProductsState;
  final String? homeProductsErrorMessage;
  final Home homeProductsData;

  //! Home Categories
  final RequestState homeCategoriesState;
  final String? homeCategoriesErrorMessage;
  final Categories homeCategoriesData;

  //! Add To Cart
  final RequestState addOrRemoveToCartState;
  final String? addToCartErrorMessage;
  final int addToCartIndex;

  //! Get Cart Data
  final RequestState getCartDataState;
  final String? getCartDataErrorMessage;
  final AllCart? getCartDataData;

  //! Add To Favorite
  final RequestState addOrRemoveToFavoriteState;
  final String? addOrRemoveToFavoriteErrorMessage;
  final int addToFavIndex;

  //! Get Favorite Data
  final RequestState getFavoriteDataState;
  final String? getFavoriteDataErrorMessage;
  final AllFavorites? getFavoriteDataData;

  //! Total Price
  final double totalPrice;

  //! Specific Category
  final RequestState specificCategoryState;
  final String? specificCategoryErrorMessage;
  final SpecificCategory specificCategoryData;

  //! Search Products
  final RequestState searchProductsState;
  final String? searchProductsErrorMessage;
  final List<Product>? searchProductsData;
  final bool isSearch;

  @override
  List<Object?> get props => [
        homeProductsState,
        homeProductsData,
        homeProductsErrorMessage,
        homeCategoriesState,
        homeCategoriesErrorMessage,
        homeCategoriesData,
        addOrRemoveToCartState,
        addToCartErrorMessage,
        getCartDataState,
        getCartDataErrorMessage,
        getCartDataData,
        addOrRemoveToFavoriteState,
        addOrRemoveToFavoriteErrorMessage,
        getFavoriteDataState,
        getFavoriteDataErrorMessage,
        getFavoriteDataData,
        addToCartIndex,
        addToFavIndex,
        totalPrice,
        specificCategoryState,
        specificCategoryErrorMessage,
        specificCategoryData,
        searchProductsState,
        searchProductsErrorMessage,
        searchProductsData,
        isSearch,
      ];

  HomeState copyWith({
    RequestState? homeProductsState,
    String? homeProductsErrorMessage,
    Home? homeProductsData,
    RequestState? homeCategoriesState,
    String? homeCategoriesErrorMessage,
    Categories? homeCategoriesData,
    RequestState? addOrRemoveToCartState,
    String? addToCartErrorMessage,
    int? addToCartIndex,
    RequestState? getCartDataState,
    String? getCartDataErrorMessage,
    AllCart? getCartDataData,
    RequestState? addOrRemoveToFavoriteState,
    String? addOrRemoveToFavoriteErrorMessage,
    int? addToFavIndex,
    RequestState? getFavoriteDataState,
    String? getFavoriteDataErrorMessage,
    AllFavorites? getFavoriteDataData,
    double? totalPrice,
    RequestState? specificCategoryState,
    String? specificCategoryErrorMessage,
    SpecificCategory? specificCategoryData,
    RequestState? searchProductsState,
    String? searchProductsErrorMessage,
    List<Product>? searchProductsData,
    bool? isSearch,
  }) {
    return HomeState(
      homeProductsState: homeProductsState ?? this.homeProductsState,
      homeProductsErrorMessage:
          homeProductsErrorMessage ?? this.homeProductsErrorMessage,
      homeProductsData: homeProductsData ?? this.homeProductsData,
      homeCategoriesState: homeCategoriesState ?? this.homeCategoriesState,
      homeCategoriesErrorMessage:
          homeCategoriesErrorMessage ?? this.homeCategoriesErrorMessage,
      homeCategoriesData: homeCategoriesData ?? this.homeCategoriesData,
      addOrRemoveToCartState:
          addOrRemoveToCartState ?? this.addOrRemoveToCartState,
      addToCartErrorMessage:
          addToCartErrorMessage ?? this.addToCartErrorMessage,
      addToCartIndex: addToCartIndex ?? this.addToCartIndex,
      getCartDataState: getCartDataState ?? this.getCartDataState,
      getCartDataErrorMessage:
          getCartDataErrorMessage ?? this.getCartDataErrorMessage,
      getCartDataData: getCartDataData ?? this.getCartDataData,
      addOrRemoveToFavoriteState:
          addOrRemoveToFavoriteState ?? this.addOrRemoveToFavoriteState,
      addOrRemoveToFavoriteErrorMessage: addOrRemoveToFavoriteErrorMessage ??
          this.addOrRemoveToFavoriteErrorMessage,
      addToFavIndex: addToFavIndex ?? this.addToFavIndex,
      getFavoriteDataState: getFavoriteDataState ?? this.getFavoriteDataState,
      getFavoriteDataErrorMessage:
          getFavoriteDataErrorMessage ?? this.getFavoriteDataErrorMessage,
      getFavoriteDataData: getFavoriteDataData ?? this.getFavoriteDataData,
      totalPrice: totalPrice ?? this.totalPrice,
      specificCategoryState:
          specificCategoryState ?? this.specificCategoryState,
      specificCategoryErrorMessage:
          specificCategoryErrorMessage ?? this.specificCategoryErrorMessage,
      specificCategoryData: specificCategoryData ?? this.specificCategoryData,
      searchProductsState: searchProductsState ?? this.searchProductsState,
      searchProductsErrorMessage:
          searchProductsErrorMessage ?? this.searchProductsErrorMessage,
      searchProductsData: searchProductsData ?? this.searchProductsData,
      isSearch: isSearch ?? this.isSearch,
    );
  }
}

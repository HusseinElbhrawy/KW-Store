import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/core/utils/media_query_values.dart';

import '../../../../app/injector.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/enums.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../bloc/home_bloc.dart';
import 'cart_screen.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  List pages = [
    BlocProvider.value(
      value: serviceLocator<HomeBloc>()
        ..add(GetHomeDataEvent())
        ..add(GetCategoriesDataEvent())
        ..add(GetFavoriteDataEvent())
        ..add(GetCartDataEvent())
        ..add(GetTotalPriceEvent()),
      child: const HomeScreen(),
    ),
    BlocProvider.value(
      value: serviceLocator<HomeBloc>(),
      child: const FavoritesScreen(),
    ),
    BlocProvider.value(
      value: serviceLocator<HomeBloc>(),
      child: const CartScreen(),
    ),
    BlocProvider.value(
      value: serviceLocator<ProfileBloc>()
        ..add(GetProfileDataEvent())
        ..add(GetNotificationDataEvent())
        ..add(GetFAQsDataEvent()),
      child: const ProfileScreen(),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(
          milliseconds: AppConstant.kDefaultAnimationDuration,
        ),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        controller: _pageController,
        children: [...pages],
      ),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Visibility(
            visible: state.homeProductsState != RequestState.error ||
                state.getCartDataState != RequestState.error ||
                state.homeCategoriesState != RequestState.error ||
                state.getFavoriteDataState != RequestState.error,
            child: FlashyTabBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              selectedIndex: _selectedIndex,
              showElevation: true,
              onItemSelected: (index) => _onItemTapped(index),
              items: [
                FlashyTabBarItem(
                  icon: const Icon(Icons.home_outlined),
                  title: Text(
                    AppStrings.home(context),
                    style: TextStyle(
                      color: context.theme.textTheme.bodyLarge!.color,
                    ),
                  ),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.favorite_border_outlined),
                  title: Text(
                    AppStrings.favorites(context),
                    style: TextStyle(
                      color: context.theme.textTheme.bodyLarge!.color,
                    ),
                  ),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.shopping_bag_outlined),
                  title: Text(
                    AppStrings.cart(context),
                    style: TextStyle(
                      color: context.theme.textTheme.bodyLarge!.color,
                    ),
                  ),
                ),
                FlashyTabBarItem(
                  icon: const Icon(
                    Icons.account_circle_outlined,
                  ),
                  title: Text(
                    AppStrings.profile(context),
                    style: TextStyle(
                      color: context.theme.textTheme.bodyLarge!.color,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

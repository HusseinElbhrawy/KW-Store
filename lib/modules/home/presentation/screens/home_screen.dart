import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injector.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/error_screen_widget.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_loaded_body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.homeProductsState == RequestState.error ||
            state.homeCategoriesState == RequestState.error ||
            state.getCartDataState == RequestState.error ||
            state.getFavoriteDataState == RequestState.error) {
          return ErrorScreenWidget(
            errorMessage: state.homeProductsErrorMessage ??
                state.homeCategoriesErrorMessage ??
                state.getCartDataErrorMessage ??
                state.getFavoriteDataErrorMessage ??
                AppStrings.errorHappen(context),
            onRetry: () {
              serviceLocator<HomeBloc>()
                ..add(GetHomeDataEvent())
                ..add(GetCategoriesDataEvent())
                ..add(GetFavoriteDataEvent())
                ..add(GetCartDataEvent())
                ..add(GetTotalPriceEvent());

              // serviceLocator<ProfileBloc>().add(GetAddressesEvent());
            },
          );
        }
        return const HomeLoadedBodyWidget();
      },
    );
  }
}

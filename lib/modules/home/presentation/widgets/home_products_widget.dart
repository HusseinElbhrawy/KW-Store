import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../bloc/home_bloc.dart';
import 'single_product_item_widget.dart';

class HomeProductsWidget extends StatelessWidget {
  const HomeProductsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.homeProductsState) {
          case RequestState.initial:
          case RequestState.loading:
            return const HomeProductsLoadingWidget();
          case RequestState.loaded:
            return HomeProductsLoadedWidget(state: state);
          case RequestState.error:
            return SliverToBoxAdapter(
              child: Center(
                child: Text(state.homeProductsErrorMessage!),
              ),
            );
        }
      },
    );
  }
}

class HomeProductsLoadedWidget extends StatelessWidget {
  const HomeProductsLoadedWidget({
    super.key,
    required this.state,
  });
  final HomeState state;
  @override
  Widget build(BuildContext context) {
    if (state.isSearch && state.searchProductsData!.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
          child: EmptyWidget(
            title: AppStrings.noProductsFound,
          ),
        ),
      );
    } else {
      return SliverGrid.builder(
        itemCount: state.isSearch
            ? state.searchProductsData!.length
            : state.homeProductsData.data!.products!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppDimensions.height20(context),
          crossAxisSpacing: AppDimensions.width20(context),
          childAspectRatio: AppUtils.customAspectRatio(context),
        ),
        itemBuilder: (context, index) {
          return SingleProductItemWidget(
            product: state.isSearch
                ? state.searchProductsData!
                : state.homeProductsData.data!.products!,
            index: index,
          );
        },
      );
    }
  }
}

class HomeProductsLoadingWidget extends StatelessWidget {
  const HomeProductsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppDimensions.height20(context),
        crossAxisSpacing: AppDimensions.width20(context),
        childAspectRatio: .8,
      ),
      itemBuilder: (context, index) {
        return SkeletonAvatar(
          style: SkeletonAvatarStyle(
            borderRadius: BorderRadius.circular(
              AppConstant.defaultPadding(context) / 2,
            ),
          ),
        );
      },
    );
  }
}

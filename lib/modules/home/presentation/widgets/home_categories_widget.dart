import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_cached_network_image_widget.dart';
import '../../../../core/widgets/small_text_widget.dart';
import '../bloc/home_bloc.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.homeProductsState == RequestState.loading ||
            state.homeCategoriesState == RequestState.loading) {
          return const HomeCategoriesLoadingWidget();
        } else if (state.homeProductsState == RequestState.loaded ||
            state.homeCategoriesState == RequestState.loaded) {
          return HomeCategoriesLoadedWidget(state: state);
        }
        return Center(
          child: Text(state.homeCategoriesErrorMessage!),
        );
        // switch (state.homeCategoriesState) {
        //   case RequestState.initial:
        //   case RequestState.loading:
        //     return const HomeCategoriesLoadingWidget();
        //   case RequestState.loaded:
        //     return HomeCategoriesLoadedWidget(state: state);

        //   case RequestState.error:
        // return Center(
        //   child: Text(state.homeCategoriesErrorMessage!),
        // );
        // }
      },
    );
  }
}

class HomeCategoriesLoadedWidget extends StatelessWidget {
  const HomeCategoriesLoadedWidget({
    super.key,
    required this.state,
  });
  final HomeState state;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: kToolbarHeight / 2),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          state.homeCategoriesData.data!.data.length,
          (index) {
            return InkWell(
              onTap: () {
                log('Category: ${state.homeCategoriesData.data!.data[index].name}');
                context.navigateToWithArguments(
                  Routes.categoryRoute,
                  {
                    'title': state.homeCategoriesData.data!.data[index].name,
                    'id': state.homeCategoriesData.data!.data[index].id,
                  },
                );
              },
              child: Column(
                children: [
                  CustomCachedNetworkImageWidget(
                    height: AppDimensions.homeCategoriesHeight(context),
                    width: AppDimensions.homeCategoriesWidth(context),
                    imageUrl: state.homeCategoriesData.data!.data[index].image,
                    imageBuilder: (context, image) {
                      return Container(
                        height: AppDimensions.homeCategoriesHeight(context),
                        width: AppDimensions.homeCategoriesWidth(context),
                        margin: EdgeInsets.only(
                          top: kToolbarHeight / 2,
                          left: AppConstant.defaultPadding(context) / 2,
                          right: AppConstant.defaultPadding(context) / 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppConstant.defaultPadding(context) / 2,
                          ),
                          image: DecorationImage(
                            image: image,
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.none,
                          ),
                        ),
                      );
                    },
                  ),
                  AppConstant.horizontalDivider(),
                  SmallTextWidget(
                    AppUtils.makeFirstLetterCapital(
                        state.homeCategoriesData.data!.data[index].name),
                    fontWeight: AppFontsWeight.bold,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomeCategoriesLoadingWidget extends StatelessWidget {
  const HomeCategoriesLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.homeCategoriesLoadingHeight(context),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstant.defaultPadding(context) / 2,
              vertical: AppConstant.defaultPadding(context) / 1.5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    height: AppDimensions.homeCategoriesHeight(context),
                    width: AppDimensions.homeCategoriesWidth(context),
                  ),
                ),
                AppConstant.horizontalDivider(),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: context.responsiveHeight(16),
                    width: AppDimensions.homeCategoriesWidth(context),
                    borderRadius: BorderRadius.circular(8),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

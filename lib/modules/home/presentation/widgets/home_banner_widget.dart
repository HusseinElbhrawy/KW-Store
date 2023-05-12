import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/custom_cached_network_image_widget.dart';
import '../bloc/home_bloc.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.homeProductsState != current.homeProductsState,
      builder: (context, state) {
        if (state.homeProductsState == RequestState.loading ||
            state.homeCategoriesState == RequestState.loading) {
          return SkeletonAvatar(
            style: SkeletonAvatarStyle(
              padding: const EdgeInsets.only(top: kToolbarHeight / 2),
              width: double.infinity,
              height: AppDimensions.bannerHeight(context),
              borderRadius: BorderRadius.circular(
                AppConstant.defaultPadding(context),
              ),
            ),
          );
        } else if (state.homeProductsState == RequestState.loaded) {
          return const HomeBannerLoadedWidget();
        } else {
          return Center(
            child: Text(state.homeProductsErrorMessage!),
          );
        }
      },
    );
  }
}

// switch (state.homeProductsState) {
//   case RequestState.initial:
//   case RequestState.loading:
// return SkeletonAvatar(
//   style: SkeletonAvatarStyle(
//     padding: const EdgeInsets.only(top: kToolbarHeight / 2),
//     width: double.infinity,
//     height: AppDimensions.bannerHeight(context),
//     borderRadius: BorderRadius.circular(
//       AppConstant.defaultPadding(context),
//     ),
//   ),
// );

//   case RequestState.loaded:
//     return const HomeBannerLoadedWidget();
//   case RequestState.error:
// return Center(
//   child: Text(state.homeProductsErrorMessage!),
// );
// }

class HomeBannerLoadedWidget extends StatelessWidget {
  const HomeBannerLoadedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: CarouselSlider.builder(
            itemCount: state.homeProductsData.data!.banners!.length,
            itemBuilder: (context, index, realIndex) {
              return CustomCachedNetworkImageWidget(
                imageUrl: state.homeProductsData.data!.banners![index].image!,
                imageBuilder: (context, imageProvider) => Container(
                  margin: const EdgeInsets.only(top: kToolbarHeight / 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppConstant.defaultPadding(context) / 2,
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.none,
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: AppDimensions.bannerHeight(context),
              initialPage: 0,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
            ),
          ),
          crossFadeState: state.isSearch
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(
            milliseconds: AppConstant.kDefaultAnimationDuration,
          ),
        );
      },
    );
  }
}

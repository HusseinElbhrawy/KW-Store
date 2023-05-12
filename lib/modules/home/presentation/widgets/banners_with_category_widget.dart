import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../bloc/home_bloc.dart';
import 'home_banner_widget.dart';
import 'home_categories_widget.dart';

class BannersWithCategoryWidget extends StatelessWidget {
  const BannersWithCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          crossFadeState: state.isSearch
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          excludeBottomFocus: true,
          reverseDuration: const Duration(
            milliseconds: AppConstant.kDefaultAnimationDuration,
          ),
          duration: const Duration(
            milliseconds: AppConstant.kDefaultAnimationDuration,
          ),
          secondChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeBannerWidget(),
              AppConstant.horizontalDivider(),
              const BigTextWidget(
                AppStrings.categories,
                fontWeight: AppFontsWeight.bold,
              ),
              const HomeCategoriesWidget(),
            ],
          ),
        );
      },
    );
  }
}

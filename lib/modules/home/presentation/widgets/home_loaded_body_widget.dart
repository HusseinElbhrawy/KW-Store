import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/widgets/big_text_widget.dart';
import 'banners_with_category_widget.dart';
import 'home_products_widget.dart';
import 'home_search_widget.dart';

class HomeLoadedBodyWidget extends StatelessWidget {
  const HomeLoadedBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: SvgPicture.asset(
              AppSvgAssets.appLogo,
              height: AppDimensions.height45(context),
              color: Theme.of(context).textTheme.headlineLarge!.color,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const HomeSearchWidget(),
                AppConstant.horizontalDivider(),
                const BannersWithCategoryWidget(),
                BigTextWidget(
                  AppStrings.products(context),
                  fontWeight: AppFontsWeight.bold,
                ),
                AppConstant.horizontalDivider(),
              ],
            ),
          ),
          const HomeProductsWidget(),
        ],
      ),
    );
  }
}

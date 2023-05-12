import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/expandable_text_widget.dart';
import '../../domain/entities/home.dart';

class ProductOverViewInfoWidget extends StatelessWidget {
  final PageController pageController;
  final Product products;
  const ProductOverViewInfoWidget({
    Key? key,
    required this.pageController,
    required this.products,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstant.defaultPadding(context),
        vertical: AppConstant.defaultPadding(context),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: products.images!.length,
                effect: SlideEffect(
                  spacing: context.responsiveWidth(8),
                  radius: AppConstant.defaultPadding(context) / 4,
                  dotWidth: context.responsiveWidth(24),
                  dotHeight: context.responsiveHeight(14),
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: context.responsiveWidth(1.5),
                  dotColor: Theme.of(context).hintColor.withOpacity(.5),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppConstant.defaultPadding(context),
              ),
              child: BigTextWidget(
                products.name.toString(),
                overflow: TextOverflow.visible,
                fontWeight: AppFontsWeight.bold,
              ),
            ),
            ExpandableTextWidget(text: products.description!),
          ],
        ),
      ),
    );
  }
}

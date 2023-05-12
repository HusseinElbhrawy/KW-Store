// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_store/core/utils/dimensions.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/widgets/small_text_widget.dart';

class ProductOrderItemWidget extends StatelessWidget {
  const ProductOrderItemWidget({
    super.key,
    required this.data,
    required this.subTitle,
    required this.title,
    required this.trailing,
    this.thirdTitle,
    this.trailingBGColor,
    this.trailingTextColor,
  });
  final String title;
  final String subTitle;
  final String? thirdTitle;
  final String data;
  final String trailing;
  final Color? trailingBGColor;
  final Color? trailingTextColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsetsDirectional.only(
            start: AppDimensions.width30(context) * 5,
            end: AppDimensions.width30(context),
            bottom: AppDimensions.height20(context),
          ),
          padding: EdgeInsetsDirectional.only(
            top: AppDimensions.height20(context),
            start: AppDimensions.width30(context) * 2.5,
            bottom: AppDimensions.height20(context),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).hintColor.withOpacity(.075),
            borderRadius: BorderRadius.circular(
              AppConstant.defaultPadding(context),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallTextWidget(
                    title,
                    fontWeight: AppFontsWeight.bold,
                  ),
                  Container(
                    color: trailingBGColor,
                    margin: EdgeInsets.symmetric(
                      horizontal: AppDimensions.width10(context),
                    ),
                    padding: EdgeInsets.all(
                      AppDimensions.width10(context) / 2,
                    ),
                    child: SmallTextWidget(
                      trailing,
                      color: trailingTextColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppDimensions.height10(context) / 3),
              SmallTextWidget(subTitle),
              SizedBox(height: AppDimensions.height10(context) / 3),
              thirdTitle == null
                  ? AppConstant.horizontalDivider()
                  : SmallTextWidget(thirdTitle!),
              SizedBox(height: AppDimensions.height10(context) / 3),
              SmallTextWidget(data),
            ],
          ),
        ),
        Container(
          height: AppDimensions.checkoutProductCartItemHeight(context),
          width: AppDimensions.checkoutProductCartItemWidth(context),
          margin: EdgeInsetsDirectional.only(
            top: AppDimensions.height20(context),
            start: AppDimensions.width20(context),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppConstant.defaultPadding(context),
            ),
            color: Theme.of(context).colorScheme.background,
          ),
          child: SvgPicture.asset(
            AppSvgAssets.appLogo,
            fit: BoxFit.contain,
            color: Theme.of(context).textTheme.headlineLarge!.color,
          ),
        ),
      ],
    );
  }
}

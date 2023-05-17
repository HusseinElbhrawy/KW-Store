// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/app_custom_animation_widget.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../widgets/about/contact_me_widget.dart';
import '../widgets/about/this_app_developed_by_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: BigTextWidget(
          AppStrings.about(context),
          size: AppDimensions.font20(context),
          fontWeight: FontWeight.w600,
        ),
      ),
      body: AppCustomAnimationWidget(
        children: [
          SvgPicture.asset(
            AppSvgAssets.appLogo,
            height: context.responsiveHeight(75),
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
          AppConstant.horizontalDivider(),
          BigTextWidget(
            AppStrings.storeDetails(context),
            size: AppDimensions.font20(context),
            overflow: TextOverflow.visible,
          ),
          AppConstant.horizontalDivider(),
          const ThisAppDevelopedByWidget(),
          BigTextWidget(
            "\n\n${AppStrings.contactMe(context)}\n",
            size: AppDimensions.font20(context),
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.visible,
          ),
          const ContactMeWidget(),
        ],
      ),
    );
  }
}

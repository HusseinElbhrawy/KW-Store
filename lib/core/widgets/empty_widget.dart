import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_assets.dart';
import '../utils/dimensions.dart';
import '../utils/fonts_manager.dart';
import '../utils/media_query_values.dart';
import 'big_text_widget.dart';
import 'small_text_widget.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.title,
    this.subTitle,
  });
  final String title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppLottieAssets.empty,
            width: context.width,
            height: AppDimensions.cartLottieImageHeight(context),
            repeat: false,
          ),
          SizedBox(height: context.responsiveHeight(20)),
          BigTextWidget(
            title,
            fontWeight: AppFontsWeight.bold,
          ),
          SizedBox(height: context.responsiveHeight(10)),
          SmallTextWidget(
            subTitle ?? '',
          ),
        ],
      ),
    );
  }
}

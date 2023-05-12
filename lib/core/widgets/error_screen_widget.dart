import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/small_text_widget.dart';

class ErrorScreenWidget extends StatelessWidget {
  const ErrorScreenWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });
  final String errorMessage;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    AppConstant.kErrorImage.shuffle();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
        decoration: const BoxDecoration(
          color: Color(0xff272730),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Container(
                height: context.responsiveHeight(215),
                width: context.responsiveWidth(240),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(AppConstant.kErrorImage.first),
              ),
              SizedBox(height: context.responsiveHeight(20)),
              BigTextWidget(
                AppStrings.oops,
                size: AppDimensions.font26(context),
                fontWeight: AppFontsWeight.bold,
                color: Theme.of(context).textTheme.bodySmall!.color,
              ),
              SizedBox(height: context.responsiveHeight(20)),
              SmallTextWidget(
                errorMessage,
                maxLines: 3,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                size: AppDimensions.font26(context),
                color: Theme.of(context).textTheme.bodySmall!.color,
              ),
              SizedBox(height: context.responsiveHeight(20)),
              const Spacer(),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context),
                    ),
                  ),
                  fixedSize: Size(
                    context.width,
                    context.responsiveHeight(50),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
                child: SmallTextWidget(
                  AppStrings.retry,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/widgets/small_text_widget.dart';

class CouponCodeTFFWidget extends StatelessWidget {
  const CouponCodeTFFWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallTextWidget(
              AppStrings.couponCode,
              fontFamily: AppFonts.jannah,
              size: AppDimensions.font20(context),
            ),
            AppConstant.horizontalDivider(),
            TextFormField(
              decoration: InputDecoration(
                hintText: AppStrings.enterCouponCode,
                hintStyle: const TextStyle(
                  fontFamily: AppFonts.jannah,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppConstant.defaultPadding(context),
                ),
                border: const OutlineInputBorder(),
                errorBorder: const OutlineInputBorder(),
                focusedErrorBorder: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                disabledBorder: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.check),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

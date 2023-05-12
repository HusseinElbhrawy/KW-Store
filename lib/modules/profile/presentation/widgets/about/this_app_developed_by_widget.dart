import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/fonts_manager.dart';

class ThisAppDevelopedByWidget extends StatelessWidget {
  const ThisAppDevelopedByWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: AppStrings.thisAppDevelopedBy(context),
        style: TextStyle(
          fontSize: AppDimensions.font20(context),
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.caveat,
        ),
        children: [
          TextSpan(
            text: AppStrings.husseinElbhrawy(context),
            style: TextStyle(
              fontSize: AppDimensions.font20(context),
              fontWeight: FontWeight.w500,
              color: Colors.red,
              fontFamily: AppFonts.caveat,
            ),
          ),
        ],
      ),
    );
  }
}

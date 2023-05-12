import 'package:flutter/material.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/utils/media_query_values.dart';
import '../../../../../core/widgets/small_text_widget.dart';

class BackToHomeButtonWidget extends StatelessWidget {
  const BackToHomeButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        AppConstant.defaultPadding(context),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
        ),
        onPressed: () => context.navigateToWithReplacementAndClearStack(
          Routes.layoutRoute,
        ),
        child: const SmallTextWidget(
          AppStrings.backToHome,
          fontFamily: AppFonts.jannah,
        ),
      ),
    );
  }
}

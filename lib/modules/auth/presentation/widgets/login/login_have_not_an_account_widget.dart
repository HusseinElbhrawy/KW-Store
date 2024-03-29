import 'package:flutter/material.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/utils/media_query_values.dart';
import '../../../../../core/widgets/small_text_widget.dart';

class LoginHaveNotAnAccountWidget extends StatelessWidget {
  const LoginHaveNotAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmallTextWidget(AppStrings.donNotHaveAnAccount(context)),
        TextButton(
          onPressed: () {
            context
                .navigateToWithReplacementAndClearStack(Routes.registersRoute);
          },
          child: SmallTextWidget(
            AppStrings.register(context),
            fontWeight: AppFontsWeight.bold,
          ),
        ),
      ],
    );
  }
}

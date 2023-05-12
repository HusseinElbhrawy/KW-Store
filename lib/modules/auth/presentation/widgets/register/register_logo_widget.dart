import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/dimensions.dart';

class RegisterLogoWidget extends StatelessWidget {
  const RegisterLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppDimensions.height45(context) * 2,
        bottom: AppDimensions.height45(context),
      ),
      child: SvgPicture.asset(
        AppSvgAssets.appLogo,
        color: Theme.of(context).textTheme.headlineLarge!.color,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../widgets/help&support/help_and_support_screen_body_widget.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: BigTextWidget(
          AppStrings.faqs(context),
          size: AppDimensions.font20(context),
          fontWeight: FontWeight.w600,
        ),
      ),
      body: const HelpAndSupportScreenBodyWidget(),
    );
  }
}

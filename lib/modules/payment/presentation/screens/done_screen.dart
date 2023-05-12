import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/small_text_widget.dart';
import '../bloc/payment_bloc.dart';
import '../widgets/done/back_to_home_button_widget.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BackToHomeButtonWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            AppLottieAssets.paymentSuccess,
            repeat: false,
            height: AppDimensions.doneLottieHeightWidget(context),
            width: double.infinity,
          ),
          const BigTextWidget(
            AppStrings.paymentSuccessful,
            fontFamily: AppFonts.jannah,
          ),
          SizedBox(height: context.responsiveHeight(20)),
          SmallTextWidget(
            '${AppStrings.yourOrder} #${context.read<PaymentBloc>().orderId} \n${AppStrings.thankYouForPurchase}',
            textAlign: TextAlign.center,
            fontFamily: AppFonts.jannah,
          ),
        ],
      ),
    );
  }
}

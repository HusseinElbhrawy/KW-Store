import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../bloc/payment_bloc.dart';
import '../payment%20method/payment_method_item_widget.dart';

class PayWithMobileWalletWidget extends StatelessWidget {
  const PayWithMobileWalletWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return PaymentMethodItemWidget(
          groupValue: state.paymentMethod,
          onChange: (value) {
            showWarningToast('Mobile Wallet Coming Soon').show(context);
          },
          value: CustomPaymentMethod.mobileWallet,
          secondWidget: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppConstant.defaultPadding(context) * 2,
            ),
            child: Row(
              children: [
                const Icon(LineAwesomeIcons.wallet),
                AppConstant.verticalDivider(),
                SmallTextWidget(
                  AppStrings.mobileWallets(context),
                  fontFamily: AppFonts.jannah,
                  fontWeight: FontWeight.w600,
                  size: AppDimensions.font20(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../bloc/payment_bloc.dart';
import '../payment%20method/payment_method_item_widget.dart';

class PayWithOtherMethodsWidget extends StatelessWidget {
  const PayWithOtherMethodsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return PaymentMethodItemWidget(
          groupValue: state.paymentMethod,
          onChange: (value) {
            context.read<PaymentBloc>().add(ChoosePaymentMethodEvent(value!));
          },
          value: CustomPaymentMethod.other,
          secondWidget: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppConstant.defaultPadding(context) * 2,
            ),
            child: Row(
              children: [
                const Icon(Iconsax.link),
                AppConstant.verticalDivider(),
                SmallTextWidget(
                  AppStrings.otherPaymentMethods(context),
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.jannah,
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

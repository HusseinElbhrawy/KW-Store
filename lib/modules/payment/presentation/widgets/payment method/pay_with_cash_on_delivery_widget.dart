import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../bloc/payment_bloc.dart';
import '../payment%20method/payment_method_item_widget.dart';

class PayWithCashOnDeliveryWidget extends StatelessWidget {
  const PayWithCashOnDeliveryWidget({
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
          value: PaymentMethod.cashOnDelivery,
          secondWidget: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppConstant.defaultPadding(context) * 2,
            ),
            child: Row(
              children: [
                const Icon(LineAwesomeIcons.alternate_wavy_money_bill),
                AppConstant.verticalDivider(),
                SmallTextWidget(
                  AppStrings.cashOnDelivery,
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

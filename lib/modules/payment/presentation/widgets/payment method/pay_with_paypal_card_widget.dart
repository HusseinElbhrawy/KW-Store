import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/utils.dart';
import '../../bloc/payment_bloc.dart';
import '../payment%20method/payment_method_item_widget.dart';

class PayWithPaypalCardWidget extends StatelessWidget {
  const PayWithPaypalCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentMethodItemWidget(
      groupValue: context.read<PaymentBloc>().state.paymentMethod,
      path: AppSvgAssets.paypal,
      onChange: (value) {
        showWarningToast(AppStrings.payWithPaypal(context)).show(context);
      },
      value: CustomPaymentMethod.paypal,
    );
  }
}

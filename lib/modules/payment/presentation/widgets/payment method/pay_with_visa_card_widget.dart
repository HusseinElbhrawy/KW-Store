import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/enums.dart';
import '../../bloc/payment_bloc.dart';
import '../payment%20method/payment_method_item_widget.dart';

class PayWithVisaCardWidget extends StatelessWidget {
  const PayWithVisaCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return PaymentMethodItemWidget(
          groupValue: state.paymentMethod,
          path: AppSvgAssets.visa,
          onChange: (value) {
            context.read<PaymentBloc>().add(ChoosePaymentMethodEvent(value!));
          },
          value: CustomPaymentMethod.visa,
        );
      },
    );
  }
}

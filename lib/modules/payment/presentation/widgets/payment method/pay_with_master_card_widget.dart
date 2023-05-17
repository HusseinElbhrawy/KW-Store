// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/modules/payment/presentation/bloc/payment_bloc.dart';
import 'package:kw_store/modules/payment/presentation/widgets/payment%20method/payment_method_item_widget.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/enums.dart';

class PayWithMasterCardWidget extends StatelessWidget {
  const PayWithMasterCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return PaymentMethodItemWidget(
          groupValue: state.paymentMethod,
          path: AppSvgAssets.mastercard,
          onChange: (value) {
            context.read<PaymentBloc>().add(ChoosePaymentMethodEvent(value!));
          },
          value: CustomPaymentMethod.mastercard,
        );
      },
    );
  }
}

// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../bloc/payment_bloc.dart';

class CreditCardPayButtonWidget extends StatelessWidget {
  const CreditCardPayButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(
            AppConstant.defaultPadding(context),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {
              var state = context.read<PaymentBloc>().state;
              context
                  .read<PaymentBloc>()
                  .emit(state.copyWith(currentPaymentScreen: 0));
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.red,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(
              AppConstant.defaultPadding(context),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0.0),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppConstant.defaultPadding(context) / 2,
                  ),
                ),
              ),
              onPressed: () {
                var state = context.read<PaymentBloc>().state;
                context.read<PaymentBloc>().emit(state.copyWith(activeStep: 2));
              },
              child: SmallTextWidget(
                AppStrings.pay,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                size: AppDimensions.font20(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

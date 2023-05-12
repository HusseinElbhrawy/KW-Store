import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/utils.dart';
import '../../bloc/payment_bloc.dart';

class CardNumberWidget extends StatelessWidget {
  const CardNumberWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        context.read<PaymentBloc>().add(ShowCreditCardFrontViewEvent());
      },
      onChanged: (value) {
        context.read<PaymentBloc>().add(UpdateCardNumberEvent(value));
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: AppStrings.cardNumber(context),
        hintText: 'XXXX XXXX XXXX XXXX',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(16),
        CardNumberInputFormatter(),
        CardNumberFormatter(),
      ],
    );
  }
}

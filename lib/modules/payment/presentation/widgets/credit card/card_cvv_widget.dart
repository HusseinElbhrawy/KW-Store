import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/utils.dart';
import '../../bloc/payment_bloc.dart';

class CardCVVWidget extends StatelessWidget {
  const CardCVVWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onTap: () {
          context.read<PaymentBloc>().add(ShowCreditCardBackViewEvent());
        },
        onChanged: (value) {
          context.read<PaymentBloc>().add(UpdateCvvCodeEvent(value));
        },
        textInputAction: TextInputAction.done,
        obscureText: true,
        decoration: InputDecoration(
          labelText: AppStrings.cvv(context),
          hintText: 'XXX',
        ),
        onFieldSubmitted: (value) {
          FocusScope.of(context).unfocus();
          context.read<PaymentBloc>().add(ShowCreditCardFrontViewEvent());
        },
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(3),
          CardCvvFormatter(),
        ],
      ),
    );
  }
}

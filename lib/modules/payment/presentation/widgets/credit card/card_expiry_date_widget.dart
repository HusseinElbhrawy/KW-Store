import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/utils.dart';
import '../../bloc/payment_bloc.dart';

class CardExpiryDateWidget extends StatelessWidget {
  const CardExpiryDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onTap: () {
          context.read<PaymentBloc>().add(ShowCreditCardFrontViewEvent());
        },
        onChanged: (value) {
          context.read<PaymentBloc>().add(UpdateExpiryDateEvent(value));
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: AppStrings.expiryDate,
          hintText: 'MM/YY',
        ),
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        onFieldSubmitted: (value) {
          context.read<PaymentBloc>().add(ShowCreditCardBackViewEvent());
        },
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(4),
          ExpirationDateFormatter(),
        ],
      ),
    );
  }
}

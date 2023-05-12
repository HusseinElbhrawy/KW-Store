import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/utils.dart';
import '../../bloc/payment_bloc.dart';

class CardHolderNameWidget extends StatelessWidget {
  const CardHolderNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        context.read<PaymentBloc>().add(ShowCreditCardFrontViewEvent());
      },
      onChanged: (value) {
        context.read<PaymentBloc>().add(UpdateCardHolderNameEvent(value));
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: AppStrings.cardHolderName,
        hintText: 'HUSSEIN ELBHRAWY',
      ),
      keyboardType: TextInputType.text,
      inputFormatters: [
        CardHolderNameFormatter(),
      ],
    );
  }
}

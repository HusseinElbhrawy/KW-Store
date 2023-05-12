import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../../../../core/extensions/payment_extension.dart';
import '../../bloc/payment_bloc.dart';

class CustomCreditCardWidget extends StatelessWidget {
  const CustomCreditCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return CreditCardWidget(
          padding: 0.0,
          cardHolderName: state.cardHolderName,
          cardNumber: state.cardNumber,
          cvvCode: state.cvvCode,
          expiryDate: state.expiryDate,
          onCreditCardWidgetChange: (creditCardBrand) {},
          cardType: state.paymentMethod.getCurrentPaymentMethod(),
          cardBgColor: Colors.black,
          isHolderNameVisible: true,
          obscureCardCvv: true,
          obscureCardNumber: true,
          showBackView: state.showBackView,
        );
      },
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first, invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/core/utils/app_strings.dart';
import 'package:kw_store/core/utils/enums.dart';
import 'package:kw_store/modules/payment/presentation/screens/credit_card_screen.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/widgets/app_custom_animation_widget.dart';
import '../../../../core/widgets/small_text_widget.dart';
import '../bloc/payment_bloc.dart';
import '../widgets/payment method/pay_with_cash_on_delivery_widget.dart';
import '../widgets/payment method/pay_with_master_card_widget.dart';
import '../widgets/payment method/pay_with_mobile_wallet_widget.dart';
import '../widgets/payment method/pay_with_other_methods_widget.dart';
import '../widgets/payment method/pay_with_paypal_card_widget.dart';
import '../widgets/payment method/pay_with_visa_card_widget.dart';
import 'other_payment_method_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  List<Widget> steps = [
    const MethodsWidget(),
    const CreditCardScreen(),
    const OtherPaymentMethodScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    log('PaymentMethodScreen build', name: 'PaymentMethodScreen');

    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return steps[state.currentPaymentScreen];
      },
    );
  }
}

class MethodsWidget extends StatelessWidget {
  const MethodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        padding: EdgeInsets.symmetric(
          horizontal: AppConstant.defaultPadding(context),
        ),
        child: Row(
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
                      .emit(state.copyWith(activeStep: 0));
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
                child: ElevatedButton(
                  onPressed: () {
                    //Todo : Code Refactoring
                    var state = context.read<PaymentBloc>().state;
                    if (state.paymentMethod == PaymentMethod.visa ||
                        state.paymentMethod == PaymentMethod.mastercard) {
                      context
                          .read<PaymentBloc>()
                          .emit(state.copyWith(currentPaymentScreen: 1));
                    } else if (state.paymentMethod ==
                        PaymentMethod.cashOnDelivery) {
                      context
                          .read<PaymentBloc>()
                          .emit(state.copyWith(activeStep: 2));
                    } else if (state.paymentMethod == PaymentMethod.other) {
                      context
                          .read<PaymentBloc>()
                          .emit(state.copyWith(currentPaymentScreen: 2));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: SmallTextWidget(
                    AppStrings.next(context),
                    fontWeight: AppFontsWeight.semiBold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: const AppCustomAnimationWidget(
        children: [
          PayWithPaypalCardWidget(),
          PayWithVisaCardWidget(),
          PayWithMasterCardWidget(),
          PayWithMobileWalletWidget(),
          PayWithCashOnDeliveryWidget(),
          PayWithOtherMethodsWidget(),
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/core/utils/app_strings.dart';
import 'package:kw_store/modules/payment/presentation/screens/done_screen.dart';
import 'package:kw_store/modules/payment/presentation/screens/payment_method_screen.dart';

import '../../../../app/injector.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/widgets/small_text_widget.dart';
import '../bloc/payment_bloc.dart';
import '../widgets/checkout/cart_order.dart';
import '../widgets/checkout/checkout_stepper_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<Widget> processList = [
    const Expanded(
      child: CartOrder(),
    ),
    Expanded(
      child: BlocProvider.value(
        value: serviceLocator<PaymentBloc>()..add(PaymentAuthenticationEvent()),
        child: const PaymentMethodScreen(),
      ),
    ),
    const Expanded(child: DoneScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SmallTextWidget(
          AppStrings.checkout,
          size: AppDimensions.font20(context),
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Column(
        children: [
          const CheckoutStepperWidget(),
          BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              return processList[state.activeStep];
            },
          ),
        ],
      ),
    );
  }
}

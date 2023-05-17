// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/core/utils/app_strings.dart';
import 'package:kw_store/modules/payment/presentation/screens/done_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
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
    Expanded(
      child: BlocProvider.value(
        value: serviceLocator<PaymentBloc>()..dateTime(),
        child: const CartOrder(),
      ),
    ),
    Expanded(
      child: BlocProvider.value(
        value: serviceLocator<PaymentBloc>()..dateTime(),
        child: const CartOrder(),
      ),
    ),
    // Container(),
    // const Expanded(child: PaymentSheetScreen()),
    const Expanded(child: DoneScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SmallTextWidget(
          AppStrings.checkout(context),
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

class PaymentSheetScreen extends StatefulWidget {
  const PaymentSheetScreen({super.key});

  @override
  _PaymentSheetScreenState createState() => _PaymentSheetScreenState();
}

class _PaymentSheetScreenState extends State<PaymentSheetScreen> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Make Payment'),
          onPressed: () async {
            await makePayment();
          },
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('10', 'USD');
      //Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
          // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
          style: ThemeMode.dark,
          merchantDisplayName: 'Hussein Elbhrway',
        ),
      );

      displayPaymentSheet();
    } catch (e, s) {
      log('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then(
        (value) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            Text("Payment Successful"),
                          ],
                        ),
                      ],
                    ),
                  ));

          paymentIntent = null;
        },
      ).onError(
        (error, stackTrace) {
          log('Error is:--->$error $stackTrace');
        },
      );
    } on StripeException catch (e) {
      log('Error is:---> $e');
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          content: Text("Cancelled "),
        ),
      );
    } catch (e) {
      log('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var bearer =
          'sk_test_51KzIHnAWCRF0dInoA8UMTbvM99VUcI9iCauL9HhoNXoCoQSe20tP7i6Ed9OXCxJAtrVytlkzAPYmI0MlzmYY8YjF00spbBPVsm';
      var headers = {
        'Authorization': 'Bearer $bearer',
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      var response = await Dio().post(
        'https://api.stripe.com/v1/payment_intents',
        data: body,
        options: Options(headers: headers),
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.data.toString()}');
      return response.data;
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }
}

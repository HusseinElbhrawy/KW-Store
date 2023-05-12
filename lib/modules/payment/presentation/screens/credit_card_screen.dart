// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/core/utils/constant.dart';
import 'package:kw_store/core/utils/media_query_values.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../bloc/payment_bloc.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  int progress = 0;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const CreditCardPayButtonWidget(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          var state = context.read<PaymentBloc>().state;
          context
              .read<PaymentBloc>()
              .emit(state.copyWith(currentPaymentScreen: 0));
        },
        label: const Text('Back'),
      ),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          return Stack(
            children: [
              WebViewWidget(
                controller: WebViewController(
                  onPermissionRequest: (request) {},
                )
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..setNavigationDelegate(NavigationDelegate())
                  ..setBackgroundColor(const Color(0x00000000))
                  ..setNavigationDelegate(
                    NavigationDelegate(
                      onProgress: (int progress) {},
                      onPageStarted: (String url) {},
                      onPageFinished: (String url) {
                        setState(() {
                          progress = 100;
                        });
                      },
                      onWebResourceError: (WebResourceError error) {},
                      onNavigationRequest: (NavigationRequest request) {
                        if (request.url
                            .startsWith('https://www.youtube.com/')) {
                          return NavigationDecision.prevent;
                        }
                        return NavigationDecision.navigate;
                      },
                    ),
                  )
                  ..loadRequest(Uri.parse(
                      'https://accept.paymob.com/api/acceptance/iframes/379680?payment_token=${state.paymentKey!.token}')),
              ),
              Visibility(
                visible: progress < 100,
                child: Container(
                  height: context.height,
                  width: context.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.all(AppConstant.defaultPadding(context)),
                    child: const CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      //Todo : Show Web View Here;
      // body: ListView(
      //   padding: EdgeInsets.symmetric(
      //     horizontal: AppConstant.defaultPadding(context),
      //   ),
      //   children: [
      //     const CustomCreditCardWidget(),
      //     AppConstant.horizontalDivider(),
      //     const CardNumberWidget(),
      //     AppConstant.horizontalDivider(),
      //     const CardHolderNameWidget(),
      //     AppConstant.horizontalDivider(),
      //     Row(
      //       children: [
      //         const CardExpiryDateWidget(),
      //         AppConstant.verticalDivider(),
      //         const CardCVVWidget(),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}

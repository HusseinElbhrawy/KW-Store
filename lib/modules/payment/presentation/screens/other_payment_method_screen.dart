// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/core/utils/media_query_values.dart';
import 'package:kw_store/core/widgets/big_text_widget.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/small_text_widget.dart';
import '../bloc/payment_bloc.dart';

class OtherPaymentMethodScreen extends StatefulWidget {
  const OtherPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<OtherPaymentMethodScreen> createState() =>
      _OtherPaymentMethodScreenState();
}

class _OtherPaymentMethodScreenState extends State<OtherPaymentMethodScreen> {
  @override
  void initState() {
    BlocProvider.of<PaymentBloc>(context).add(GetRefCodeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
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
                  log(state.refCode!.billReference.toString());
                  // context
                  //     .read<PaymentBloc>()
                  //     .emit(state.copyWith(activeStep: 2));
                },
                child: SmallTextWidget(
                  'Done',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  size: AppDimensions.font20(context),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BigTextWidget('You can pay with this code'),
          BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              switch (state.getRefCodeState) {
                case RequestState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case RequestState.initial:
                case RequestState.loaded:
                  return InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () async {
                      Clipboard.setData(const ClipboardData(text: '97216162'))
                          .then(
                        (value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Copied to clipboard'),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: context.width,
                      padding:
                          EdgeInsets.all(AppConstant.defaultPadding(context)),
                      margin:
                          EdgeInsets.all(AppConstant.defaultPadding(context)),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppConstant.defaultPadding(context) / 3,
                        ),
                        color: Colors.orange,
                      ),
                      child: BigTextWidget(
                        state.refCode?.billReference.toString() ?? '',
                        color: Colors.white,
                      ),
                    ),
                  );

                case RequestState.error:
                  return const Center(
                    child: Text('Error'),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/media_query_values.dart';
import '../../bloc/payment_bloc.dart';

class CheckoutStepperWidget extends StatelessWidget {
  const CheckoutStepperWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return EasyStepper(
          activeStep: state.activeStep,
          lineLength: context.width * 0.35,
          lineType: LineType.normal,
          defaultLineColor: Colors.white,
          finishedLineColor: Colors.orange,
          activeStepTextColor: context.theme.textTheme.bodyLarge!.color!,
          finishedStepTextColor: context.theme.textTheme.bodyLarge!.color!,
          disableScroll: false,
          enableStepTapping: true,
          showLoadingAnimation: false,
          showStepBorder: false,
          internalPadding: 0.0,
          padding: const EdgeInsetsDirectional.only(top: kToolbarHeight / 2),
          stepRadius: context.responsiveHeight(10),
          lineDotRadius: 3,
          steps: [
            EasyStep(
              customStep: BlocBuilder<PaymentBloc, PaymentState>(
                builder: (context, state) {
                  return CircleAvatar(
                    backgroundColor:
                        state.activeStep >= 0 ? Colors.orange : Colors.white,
                  );
                },
              ),
              title: AppStrings.orders,
            ),
            EasyStep(
              customStep: BlocBuilder<PaymentBloc, PaymentState>(
                builder: (context, state) {
                  return CircleAvatar(
                    backgroundColor:
                        state.activeStep >= 1 ? Colors.orange : Colors.white,
                  );
                },
              ),
              title: AppStrings.payment,
              topTitle: true,
            ),
            EasyStep(
              customStep: BlocBuilder<PaymentBloc, PaymentState>(
                builder: (context, state) {
                  return CircleAvatar(
                    backgroundColor:
                        state.activeStep >= 2 ? Colors.orange : Colors.white,
                  );
                },
              ),
              title: AppStrings.done,
            ),
          ],
          onStepReached: (index) =>
              context.read<PaymentBloc>().add(GoToNextStepEvent(index)),
        );
      },
    );
  }
}

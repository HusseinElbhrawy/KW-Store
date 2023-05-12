import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_strings.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../../../home/presentation/bloc/home_bloc.dart';

class CheckoutTotalPriceCardWidget extends StatelessWidget {
  const CheckoutTotalPriceCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(AppConstant.defaultPadding(context)),
      child: Padding(
        padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallTextWidget(
              AppStrings.totalPrice,
              size: AppDimensions.font20(context),
              fontFamily: AppFonts.jannah,
            ),
            const Divider(thickness: .25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SmallTextWidget(
                  AppStrings.subTotal,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.jannah,
                ),
                SmallTextWidget(
                  '\$ ${context.read<HomeBloc>().state.totalPrice}',
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.jannah,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SmallTextWidget(
                  AppStrings.shipping,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.jannah,
                ),
                SmallTextWidget(
                  '\$0',
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.jannah,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SmallTextWidget(
                  AppStrings.discount,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.jannah,
                ),
                SmallTextWidget(
                  '\$0',
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.jannah,
                ),
              ],
            ),
            AppConstant.horizontalDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SmallTextWidget(
                  AppStrings.total,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.jannah,
                ),
                SmallTextWidget(
                  '\$${context.read<HomeBloc>().state.totalPrice}',
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.jannah,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

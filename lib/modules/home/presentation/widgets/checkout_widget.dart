import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/small_text_widget.dart';
import '../bloc/home_bloc.dart';

class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.getCartDataData!.data.products.isEmpty) {
          return const SizedBox.shrink();
        }
        return Container(
          height: AppDimensions.cartCheckoutHeight(context),
          width: context.width,
          padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigTextWidget(
                AppStrings.total(context),
                fontWeight: AppFontsWeight.bold,
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return BigTextWidget(
                    state.totalPrice.toString(),
                    fontWeight: AppFontsWeight.bold,
                  );
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  context.navigateTo(Routes.checkoutRoute);
                },
                child: SmallTextWidget(
                  AppStrings.checkout(context),
                  size: AppDimensions.font20(context),
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

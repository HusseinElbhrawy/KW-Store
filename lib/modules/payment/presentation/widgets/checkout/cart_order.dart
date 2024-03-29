import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../../../home/presentation/bloc/home_bloc.dart';
import '../../bloc/payment_bloc.dart';
import 'checkout_total_price_card_widget.dart';
import 'coupon_code_tff_widget.dart';
import 'product_order_item_widget.dart';
import 'shipping_address_card_widget.dart';

class CartOrder extends StatefulWidget {
  const CartOrder({super.key});

  @override
  State<CartOrder> createState() => _CartOrderState();
}

class _CartOrderState extends State<CartOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        shape: const CircularNotchedRectangle(),
        padding: EdgeInsets.symmetric(
          horizontal: AppConstant.defaultPadding(context),
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, state) {
            return Padding(
              padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
              child: Row(
                children: [
                  SmallTextWidget(
                    '${AppStrings.total(context)} : \$${state.totalPrice.toString()}',
                    fontWeight: FontWeight.w600,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PaymentBloc>().makePayment(context);
                      context
                          .read<PaymentBloc>()
                          .add(const GoToNextStepEvent(1));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: SmallTextWidget(
                      AppStrings.placeOrder(context),
                      fontWeight: AppFontsWeight.semiBold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          const ShippingAddressCardWidget(),
          SizedBox(
            height: AppDimensions.checkoutProductCartItemHeight(context) * 2 +
                AppConstant.defaultPadding(context) * 2,
            child: CardSwiper(
              numberOfCardsDisplayed: 1,
              cardBuilder: (context, index) {
                return BlocBuilder<PaymentBloc, PaymentState>(
                  builder: (context, state) {
                    return ProductOrderItemWidget(
                      data: state.orderDate.toString(),
                      subTitle:
                          '${AppStrings.orderID(context)} : ${context.read<PaymentBloc>().orderId}',
                      title: AppStrings.orderPlaced(context),
                      trailing: AppStrings.pending(context),
                    );
                  },
                );
              },
              cardsCount: 10,
            ),
          ),
          AppConstant.horizontalDivider(),
          const CouponCodeTFFWidget(),
          const CheckoutTotalPriceCardWidget(),
        ],
      ),
    );
  }
}

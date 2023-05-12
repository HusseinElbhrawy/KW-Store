import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/widgets/app_custom_animation_widget.dart';
import '../bloc/home_bloc.dart';
import '../widgets/empty_cart_screen.dart';
import 'cart_widget.dart';

class CartBodyWidget extends StatelessWidget {
  const CartBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.getCartDataData!.data.products.isEmpty) {
          return const EmptyCartScreen();
        }
        return AppCustomAnimationWidget(
          children: [
            for (var i = 0;
                i < state.getCartDataData!.data.products.length;
                i++)
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppDimensions.height10(context)),
                child: CartWidget(
                  cart: state.getCartDataData!.data.products[i],
                  index: i,
                  state: state,
                ),
              ),
          ],
        );
        // return ListView.separated(
        //   padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
        //   itemBuilder: (context, index) {
        //     return CartWidget(
        //       cart: state.getCartDataData!.data.products[index],
        //       index: index,
        //       state: state,
        //     );
        //   },
        //   itemCount: state.getCartDataData!.data.products.length,
        //   separatorBuilder: (BuildContext context, int index) {
        //     return SizedBox(height: AppDimensions.height10(context));
        //   },
        // );
      },
    );
  }
}

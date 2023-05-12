import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/custom_cached_network_image_widget.dart';
import '../../domain/entities/cart.dart';
import '../bloc/home_bloc.dart';
import '../widgets/custom_icon_button_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.cart,
    required this.index,
  });

  final CartItem cart;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.carItemHeight(context),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(AppConstant.defaultPadding(context)),
        color: Theme.of(context).colorScheme.primary.withOpacity(.05),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: CustomCachedNetworkImageWidget(
              imageUrl: cart.product.image,
              imageBuilder: (context, image) {
                return Material(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(
                    AppConstant.defaultPadding(context),
                  ),
                  child: Image(
                    image: image,
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          AppConstant.verticalDivider(),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: BigTextWidget(
                    cart.product.name,
                    size: AppDimensions.font20(context),
                    maxLines: 2,
                    fontWeight: AppFontsWeight.bold,
                    overflow: TextOverflow.visible,
                  ),
                ),
                Flexible(
                  child: BigTextWidget(
                    '${cart.product.price * cart.quantity}',
                    size: AppDimensions.font20(context),
                    fontWeight: AppFontsWeight.bold,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButtonWidget(
                        icon: Icons.add,
                        onPressed: () {
                          context.read<HomeBloc>().incrementQuantity(index);
                        },
                      ),
                      const Spacer(flex: 1),
                      BigTextWidget(
                        cart.quantity.toString(),
                        size: AppDimensions.font20(context),
                        fontWeight: AppFontsWeight.bold,
                      ),
                      const Spacer(flex: 1),
                      CustomIconButtonWidget(
                        icon: Icons.remove,
                        onPressed: () {
                          context.read<HomeBloc>().decrementQuantity(index);
                        },
                      ),
                      const Spacer(flex: 6),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/small_text_widget.dart';
import '../../domain/entities/cart.dart';
import '../../domain/entities/home.dart';
import '../bloc/home_bloc.dart';
import '../widgets/single_product_item_widget.dart';

class ProductOverviewBottomNavWidget extends StatelessWidget {
  const ProductOverviewBottomNavWidget({
    super.key,
    required this.products,
    required this.index,
  });

  final Product products;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(.05),
        borderRadius: BorderRadius.circular(
          AppConstant.defaultPadding(context),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: SmallTextWidget(
              AppStrings.price,
              color: Theme.of(context).hintColor.withOpacity(.5),
            ),
            subtitle: Row(
              children: [
                BigTextWidget(
                  '\$${products.price}',
                  fontWeight: AppFontsWeight.bold,
                ),
                SizedBox(width: AppDimensions.width15(context)),
                Visibility(
                  visible: products.discount != 0,
                  child: BigTextWidget(
                    '\$${products.oldPrice}',
                    color: Theme.of(context).hintColor.withOpacity(.5),
                    size: AppDimensions.font20(context),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            trailing: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return IconButton(
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.width20(context),
                      ),
                      side: BorderSide(
                        color: context
                                .read<HomeBloc>()
                                .isProductInCart(products.id!)
                            ? context.theme.colorScheme.error
                            : context.theme.hintColor.withOpacity(.5),
                      ),
                    ),
                  ),
                  alignment: Alignment.center,
                  onPressed: () {
                    final cart = CartItem(
                      id: products.id!,
                      quantity: 1,
                      product: CartProduct(
                        id: products.id!.toInt(),
                        name: products.name!,
                        description: products.description!,
                        image: products.image!,
                        price: products.price!,
                        oldPrice: products.oldPrice!,
                        discount: products.discount!,
                      ),
                    );
                    context.read<HomeBloc>().add(
                          AddOrRemoveToCartEvent(
                            product: cart,
                            index: index,
                          ),
                        );
                  },
                  icon: InCartIconWidget(
                    state: state,
                    product: products,
                    index: index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

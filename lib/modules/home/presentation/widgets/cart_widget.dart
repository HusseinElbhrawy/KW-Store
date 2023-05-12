import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/slidable_delete_widget.dart';
import '../../domain/entities/cart.dart';
import '../bloc/home_bloc.dart';
import 'cart_item_widget.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
    required this.cart,
    required this.index,
    required this.state,
  });
  final CartItem cart;
  final int index;
  final HomeState state;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.addOrRemoveToCartState == RequestState.loading &&
            state.addOrRemoveToCartState.index == index) {
          return const SizedBox.shrink();
        } else {
          return Slidable(
            key: Key(cart.id.toString()),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(
                onDismissed: () {
                  context.read<HomeBloc>().add(
                        AddOrRemoveToCartEvent(
                          index: index,
                          product: CartItem(
                            id: cart.id,
                            product: CartProduct(
                              id: cart.product.id,
                              name: cart.product.name,
                              description: cart.product.description,
                              image: cart.product.image,
                              price: cart.product.price,
                              oldPrice: cart.product.oldPrice,
                              discount: cart.product.discount,
                            ),
                            quantity: 1,
                          ),
                          removeFromCartScreen: true,
                        ),
                      );
                },
              ),
              extentRatio: .4,
              children: [
                SlidableDeleteWidget(index: index),
              ],
            ),
            child: CartItemWidget(cart: cart, index: index),
          );
        }
      },
    );
  }
}

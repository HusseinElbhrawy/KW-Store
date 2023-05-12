// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/core/widgets/custom_cached_network_image_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/small_text_widget.dart';
import '../../domain/entities/cart.dart';
import '../../domain/entities/favorites.dart';
import '../../domain/entities/home.dart';
import '../bloc/home_bloc.dart';

class SingleProductItemWidget extends StatelessWidget {
  const SingleProductItemWidget({
    super.key,
    required this.product,
    required this.index,
  });
  final List<Product> product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            log(product[index].id.toString());
            context.navigateToWithArguments(
              Routes.productsOverviewRoute,
              {
                'product': product[index],
                'index': index,
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
              // color: Colors.grey.shade300,
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(
                AppConstant.defaultPadding(context) / 2,
              ),
            ),
            child: Column(
              children: [
                ProductImageAndFavButtonWidget(
                  product: product[index],
                  index: index,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstant.defaultPadding(context) / 2,
                  ),
                  child: SmallTextWidget(
                    product[index].name!,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    fontWeight: AppFontsWeight.bold,
                  ),
                ),
                PriceWithCartButtonWidget(product: product, index: index),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PriceWithCartButtonWidget extends StatelessWidget {
  const PriceWithCartButtonWidget({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final List<Product> product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstant.defaultPadding(context) / 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BigTextWidget(
              product[index].price!.toString(),
              fontWeight: AppFontsWeight.bold,
              size: AppDimensions.font20(context),
              color: Theme.of(context).colorScheme.errorContainer,
            ),
            BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state.addOrRemoveToCartState == RequestState.error &&
                    state.addToFavIndex == index) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.addOrRemoveToFavoriteErrorMessage!),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    final item = CartItem(
                      id: product[index].id!,
                      quantity: 1,
                      product: CartProduct(
                        id: product[index].id!.toInt(),
                        name: product[index].name!,
                        description: product[index].description!,
                        image: product[index].image!,
                        price: product[index].price!,
                        oldPrice: product[index].oldPrice!,
                        discount: product[index].discount!,
                      ),
                    );

                    context.read<HomeBloc>().add(
                          AddOrRemoveToCartEvent(
                            product: item,
                            index: index,
                          ),
                        );
                  },
                  icon: InCartIconWidget(
                    state: state,
                    index: index,
                    product: product[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class InCartIconWidget extends StatelessWidget {
  const InCartIconWidget(
      {super.key, required this.state, this.index, required this.product});
  final HomeState state;
  final int? index;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return state.addOrRemoveToCartState == RequestState.loading &&
            state.addToCartIndex == index
        ? LoadingAnimationWidget.newtonCradle(
            color: Theme.of(context).colorScheme.primary,
            size: AppDimensions.iconSize24(context) * 1.5,
          )
        : Icon(
            context.read<HomeBloc>().isProductInCart(product.id!)
                ? Icons.done_all_outlined
                : Icons.add_shopping_cart_outlined,
            color: context.read<HomeBloc>().isProductInCart(product.id!)
                ? Theme.of(context).colorScheme.errorContainer
                : Theme.of(context).textTheme.headlineSmall!.color,
          );
  }
}

class ProductImageAndFavButtonWidget extends StatelessWidget {
  const ProductImageAndFavButtonWidget({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final Product product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(AppConstant.defaultPadding(context) / 3),
          child: Hero(
            tag: product.id!,
            child: CustomCachedNetworkImageWidget(
              imageUrl: product.image ?? AppConstant.comingSoonImageLink,
              height: AppDimensions.homeProductImageHeight(context),
              width: context.width,
              fit: BoxFit.fill,
            ),
          ),
        ),
        HomeFavButtonWidget(product: product, index: index),
      ],
    );
  }
}

class HomeFavButtonWidget extends StatelessWidget {
  const HomeFavButtonWidget({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.addOrRemoveToFavoriteState == RequestState.error &&
            state.addToFavIndex == index) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.addOrRemoveToFavoriteErrorMessage!),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      builder: (context, state) {
        return Align(
          alignment: AlignmentDirectional.topEnd,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () async {
                  context.read<HomeBloc>().add(
                        AddOrRemoveToFavoriteEvent(
                          product: FavoritesProduct(
                            id: product.id!,
                            name: product.name!,
                            description: product.description!,
                            image: product.image!,
                            price: product.price!,
                            oldPrice: product.oldPrice!,
                            discount: product.discount!,
                          ),
                          index: index,
                        ),
                      );
                },
                icon: FavIconWidget(
                  state: state,
                  product: product,
                  index: index,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class FavIconWidget extends StatelessWidget {
  const FavIconWidget({
    super.key,
    required this.state,
    this.index,
    required this.product,
  });
  final HomeState state;
  final int? index;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return state.addOrRemoveToFavoriteState == RequestState.loading &&
            state.addToFavIndex == index
        ? LoadingAnimationWidget.newtonCradle(
            color: Theme.of(context).colorScheme.primary,
            size: AppDimensions.iconSize24(context) * 1.5,
          )
        : Icon(
            context.read<HomeBloc>().isProductInFavorites(product.id!)
                ? Icons.favorite
                : Icons.favorite_border,
            color: context.read<HomeBloc>().isProductInFavorites(product.id!)
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).colorScheme.primary,
          );
  }
}

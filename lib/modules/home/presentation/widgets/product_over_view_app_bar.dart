import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/custom_cached_network_image_widget.dart';
import '../../domain/entities/favorites.dart';
import '../../domain/entities/home.dart';
import '../bloc/home_bloc.dart';
import '../widgets/single_product_item_widget.dart';

class ProductOverViewAppBar extends StatelessWidget {
  const ProductOverViewAppBar({
    super.key,
    required this.product,
    required PageController pageController,
    required this.index,
  }) : _pageController = pageController;

  final Product product;

  final int index;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
      actions: [
        BlocBuilder<HomeBloc, HomeState>(
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
                            .isProductInFavorites(product.id!)
                        ? context.theme.colorScheme.error
                        : context.theme.hintColor.withOpacity(.5),
                  ),
                ),
              ),
              alignment: Alignment.center,
              onPressed: () {
                final favoritesProduct = FavoritesProduct(
                  id: product.id!,
                  name: product.name!,
                  description: product.description!,
                  image: product.image!,
                  price: product.price!,
                  oldPrice: product.oldPrice!,
                  discount: product.discount!,
                );
                context.read<HomeBloc>().add(
                      AddOrRemoveToFavoriteEvent(
                        product: favoritesProduct,
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
      ],
      expandedHeight: context.height / 1.8,
      flexibleSpace: FlexibleSpaceBar(
        background: PageView.builder(
          controller: _pageController,
          itemCount: product.images!.length,
          itemBuilder: (context, index) {
            return Hero(
              tag: product.id!,
              child: CustomCachedNetworkImageWidget(
                imageUrl: product.images![index],
                fit: BoxFit.contain,
              ),
            );
          },
        ),
      ),
    );
  }
}

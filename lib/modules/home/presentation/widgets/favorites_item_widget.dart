import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/custom_cached_network_image_widget.dart';
import '../../../../core/widgets/slidable_delete_widget.dart';
import '../../domain/entities/favorites.dart';
import '../bloc/home_bloc.dart';

class FavoritesItemWidget extends StatelessWidget {
  const FavoritesItemWidget({
    super.key,
    required this.favorites,
    required this.index,
  });
  final FavoritesProduct favorites;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(favorites.id.toString()),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            context.read<HomeBloc>().add(
                  AddOrRemoveToFavoriteEvent(
                    product: FavoritesProduct(
                      id: favorites.id,
                      name: favorites.name,
                      description: favorites.description,
                      image: favorites.image,
                      price: favorites.price,
                      oldPrice: favorites.oldPrice,
                      discount: favorites.discount,
                    ),
                    index: index,
                  ),
                );
          },
        ),
        extentRatio: .4,
        children: [
          SlidableDeleteWidget(index: index),
        ],
      ),
      child: Container(
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
                imageUrl: favorites.image,
                imageBuilder: (context, image) {
                  return Material(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(
                      AppConstant.defaultPadding(context),
                    ),
                    child: Image(
                      image: image,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.none,
                      width: double.infinity,
                      height: double.infinity,
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
                      favorites.name,
                      size: AppDimensions.font20(context),
                      maxLines: 2,
                      fontWeight: AppFontsWeight.bold,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  Flexible(
                    child: BigTextWidget(
                      favorites.description,
                      size: AppDimensions.font20(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                    child: BigTextWidget(
                      '\$ ${favorites.price}',
                      size: AppDimensions.font20(context),
                      fontWeight: AppFontsWeight.bold,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

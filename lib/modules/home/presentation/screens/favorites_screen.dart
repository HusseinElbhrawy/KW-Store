import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/widgets/app_custom_animation_widget.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../bloc/home_bloc.dart';
import '../widgets/favorites_item_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigTextWidget(
          AppStrings.favorites(context),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.getFavoriteDataData!.data.data.isEmpty) {
            return EmptyWidget(title: AppStrings.yourFavoritesIsEmpty(context));
          } else {
            return AppCustomAnimationWidget(
              children: [
                for (var i = 0;
                    i < state.getFavoriteDataData!.data.data.length;
                    i++)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimensions.height10(context),
                    ),
                    child: FavoritesItemWidget(
                      favorites:
                          state.getFavoriteDataData!.data.data[i].product,
                      index: i,
                    ),
                  ),
              ],
            );
          }
          // return ListView.separated(
          //   padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
          //   itemBuilder: (context, index) {
          //     return FavoritesItemWidget(
          //       favorites: state.getFavoriteDataData!.data.data[index].product,
          //       index: index,
          //     );
          //   },
          //   separatorBuilder: (context, index) {
          //     return SizedBox(height: AppDimensions.height10(context));
          //   },
          //   itemCount: state.getFavoriteDataData!.data.data.length,
          // );
        },
      ),
    );
  }
}

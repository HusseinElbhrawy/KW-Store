import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../app/injector.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/error_screen_widget.dart';
import '../bloc/home_bloc.dart';
import '../widgets/single_product_item_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    Key? key,
    required this.title,
    required this.id,
  }) : super(key: key);
  final String title;
  final int id;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    serviceLocator<HomeBloc>().add(
      GetSpecificCategoryEvent(
        widget.id.toString(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigTextWidget(
          AppUtils.makeFirstLetterCapital(widget.title),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state.specificCategoryState) {
            case RequestState.initial:
            case RequestState.loading:
              return CustomGridViewWidget(
                itemBuilder: (_, index) {
                  return SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      borderRadius: BorderRadius.circular(
                        AppConstant.defaultPadding(context) / 2,
                      ),
                    ),
                  );
                },
              );

            case RequestState.loaded:
              log(state.specificCategoryData.data!.data.length.toString());
              return CustomGridViewWidget(
                itemCount: state.specificCategoryData.data!.data.length,
                itemBuilder: (context, index) {
                  return SingleProductItemWidget(
                    product: state.specificCategoryData.data!.data,
                    index: index,
                  );
                },
              );

            case RequestState.error:
              return ErrorScreenWidget(
                errorMessage: state.specificCategoryErrorMessage!,
                onRetry: () {
                  serviceLocator<HomeBloc>().add(
                    GetSpecificCategoryEvent(
                      widget.id.toString(),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}

class CustomGridViewWidget extends StatelessWidget {
  const CustomGridViewWidget({
    super.key,
    required this.itemBuilder,
    this.itemCount = 10,
  });
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.width20(context),
        vertical: AppDimensions.height20(context),
      ),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppDimensions.height20(context),
        crossAxisSpacing: AppDimensions.width20(context),
        childAspectRatio: AppUtils.customAspectRatio(context),
      ),
      itemBuilder: itemBuilder,
    );
  }
}

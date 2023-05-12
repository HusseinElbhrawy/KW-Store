import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/widgets/big_text_widget.dart';
import '../../../../../core/widgets/small_text_widget.dart';

class FAQsItemWidget extends StatelessWidget {
  const FAQsItemWidget({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppConstant.defaultPadding(context) / 2,
        horizontal: AppConstant.defaultPadding(context),
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppConstant.defaultPadding(context),
          ),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppConstant.defaultPadding(context),
          ),
        ),
        collapsedBackgroundColor: Theme.of(context).hintColor.withOpacity(.05),
        backgroundColor: Theme.of(context).hintColor.withOpacity(.05),
        collapsedIconColor: Theme.of(context).colorScheme.secondary,
        collapsedTextColor: Theme.of(context).colorScheme.secondary,
        title: BigTextWidget(
          title,
          size: AppDimensions.font20(context),
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.visible,
        ),
        tilePadding: EdgeInsets.all(AppConstant.defaultPadding(context)),
        childrenPadding: EdgeInsets.symmetric(
          horizontal: AppConstant.defaultPadding(context),
          vertical: AppConstant.defaultPadding(context) / 2,
        ),
        children: [
          SmallTextWidget(
            description,
            size: AppDimensions.font16(context),
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

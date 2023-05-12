import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../utils/app_strings.dart';
import '../utils/constant.dart';

class SlidableDeleteWidget extends StatelessWidget {
  const SlidableDeleteWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
      key: ValueKey(index),
      onPressed: null,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(
          AppConstant.defaultPadding(context) / 1.5,
        ),
        bottomRight: Radius.circular(
          AppConstant.defaultPadding(context) / 1.5,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      icon: Icons.delete,
      label: AppStrings.delete,
    );
  }
}

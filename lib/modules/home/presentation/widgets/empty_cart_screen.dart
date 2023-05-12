import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/empty_widget.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyWidget(
      title: AppStrings.yourCartIsEmpty,
      subTitle: AppStrings.startShoppingNow,
    );
  }
}

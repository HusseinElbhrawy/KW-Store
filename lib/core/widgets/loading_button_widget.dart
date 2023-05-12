import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../utils/media_query_values.dart';

class LoadingButtonWidget extends StatelessWidget {
  const LoadingButtonWidget({
    super.key,
    this.isUsedWithLoginScreen = false,
  });
  final bool isUsedWithLoginScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isUsedWithLoginScreen
              ? 0.0
              : AppConstant.defaultPadding(context) * 2,
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                vertical: AppConstant.defaultPadding(context) / 3,
              ),
            ),
            fixedSize: MaterialStateProperty.all(Size.fromWidth(context.width)),
          ),
          onPressed: null,
          child: const CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

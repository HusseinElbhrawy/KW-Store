import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';

class CustomAboutButtonWidget extends StatelessWidget {
  const CustomAboutButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.color,
    this.isFirst = false,
  });
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;
  final bool isFirst;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: AppConstant.defaultPadding(context),
          ),
        ),
        shape: MaterialStateProperty.all(
          const CircleBorder(),
        ),
        backgroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

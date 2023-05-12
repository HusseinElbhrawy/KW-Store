import 'package:flutter/material.dart';

import '../../../../core/utils/constant.dart';

class CustomIconButtonWidget extends StatelessWidget {
  const CustomIconButtonWidget({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppConstant.defaultPadding(context) / 2),
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.secondary.withOpacity(.1),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}

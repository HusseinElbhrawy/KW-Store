import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../utils/constant.dart';

class AppCustomAnimationWidget extends StatelessWidget {
  const AppCustomAnimationWidget({
    super.key,
    required this.children,
    this.padding,
  });
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView(
        padding: padding ?? EdgeInsets.all(AppConstant.defaultPadding(context)),
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 400),
          childAnimationBuilder: (widget) {
            return SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: widget,
              ),
            );
          },
          children: children,
        ),
      ),
    );
  }
}

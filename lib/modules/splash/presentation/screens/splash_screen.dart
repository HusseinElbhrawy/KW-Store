import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;

  @override
  void initState() {
    _scaleController = AnimationController(
      vsync: this,
      value: 0.0,
      duration: const Duration(milliseconds: 750),
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _scaleController,
        builder: (BuildContext context, Widget? child) {
          return ScaleTransition(
            scale: _scaleController,
            child: child,
          );
        },
        child: Center(
          child: SvgPicture.asset(
            AppSvgAssets.appLogo,
            theme: const SvgTheme(
              currentColor: Colors.white,
            ),
            color: Theme.of(context).textTheme.headlineLarge!.color,
          ),
        ),
      ),
    );
  }
}

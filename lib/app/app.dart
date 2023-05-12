import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/app/injector.dart';

import '../config/router/app_routes.dart';
import '../config/themes/dark_theme.dart';
import '../config/themes/light_theme.dart';
import '../core/utils/app_strings.dart';
import '../modules/splash/presentation/bloc/splash_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<SplashBloc>()..add(IsDarkModeEvent(context)),
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          return MaterialApp(
            title: AppStrings.appName,
            theme: kLightTheme,
            darkTheme: kDarkTheme,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: Routes.splashRoute,
            // initialRoute: Routes.layoutRoute,
            // home: const LoginScreen(),
          );
        },
      ),
    );
  }
}

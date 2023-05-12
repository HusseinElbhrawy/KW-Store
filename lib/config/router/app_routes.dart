import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/modules/profile/presentation/screens/profile_screen.dart';

import '../../app/injector.dart';
import '../../core/utils/app_strings.dart';
import '../../modules/auth/presentation/bloc/auth_bloc.dart';
import '../../modules/auth/presentation/screens/login_screen.dart';
import '../../modules/auth/presentation/screens/register_screen.dart';
import '../../modules/home/presentation/bloc/home_bloc.dart';
import '../../modules/home/presentation/screens/cart_screen.dart';
import '../../modules/home/presentation/screens/category_screen.dart';
import '../../modules/home/presentation/screens/favorites_screen.dart';
import '../../modules/home/presentation/screens/home_screen.dart';
import '../../modules/home/presentation/screens/layout_screen.dart';
import '../../modules/home/presentation/screens/products_overview.dart';
import '../../modules/payment/presentation/bloc/payment_bloc.dart';
import '../../modules/payment/presentation/screens/checkout_screen.dart';
import '../../modules/payment/presentation/screens/credit_card_screen.dart';
import '../../modules/payment/presentation/screens/done_screen.dart';
import '../../modules/payment/presentation/screens/other_payment_method_screen.dart';
import '../../modules/payment/presentation/screens/payment_method_screen.dart';
import '../../modules/profile/domain/entities/profile.dart';
import '../../modules/profile/presentation/bloc/profile_bloc.dart';
import '../../modules/profile/presentation/screens/about_screen.dart';
import '../../modules/profile/presentation/screens/add_new_address_screen.dart';
import '../../modules/profile/presentation/screens/address_screen.dart';
import '../../modules/profile/presentation/screens/help_and_support_screen.dart';
import '../../modules/profile/presentation/screens/notification_screen.dart';
import '../../modules/profile/presentation/screens/profile_info_screen.dart';
import '../../modules/splash/presentation/bloc/splash_bloc.dart';
import '../../modules/splash/presentation/screens/on_boarding_screen.dart';
import '../../modules/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String splashRoute = '/splash';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registersRoute = '/registers';
  static const String layoutRoute = '/layout';
  static const String homeRoute = '/home';

  static const String profileRoute = '/profile';
  static const String profileInfoRoute = '/profileInfo';
  static const String notificationRoute = '/notification';
  static const String helpAndSupportRoute = '/helpAndSupport';
  static const String aboutRoute = '/about';
  static const String addressRoute = '/address';
  static const String addNewAddressRoute = '/addNewAddress';

  static const String productsOverviewRoute = '/productsOverview';

  static const String cartRoute = '/cart';
  static const String favoritesRoute = '/favorites';
  static const String categoryRoute = '/category';

  static const String checkoutRoute = '/checkout';
  static const String paymentMethodRoute = '/paymentMethod';
  static const String creditCardRoute = '/creditCard';
  static const String otherPaymentMethodRoute = '/otherPaymentMethod';
  static const String doneRoute = '/done';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            lazy: false,
            create: (context) =>
                serviceLocator<SplashBloc>()..add(IsOnBoardingSkip(context)),
            child: const SplashScreen(),
          ),
        );

      case Routes.onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<SplashBloc>(),
            child: const OnBoardingScreen(),
          ),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.registersRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<AuthBloc>(),
            child: const RegisterScreen(),
          ),
        );

      case Routes.layoutRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: serviceLocator<HomeBloc>(),
              ),
              BlocProvider.value(
                value: serviceLocator<ProfileBloc>()..add(GetAddressesEvent()),
              ),
            ],
            child: const LayoutScreen(),
          ),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => serviceLocator<HomeBloc>()
                  ..add(GetCategoriesDataEvent())
                  ..add(GetHomeDataEvent()),
              ),
            ],
            child: const HomeScreen(),
          ),
        );

      case Routes.profileRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: serviceLocator<ProfileBloc>()..add(GetAddressesEvent()),
              ),
              BlocProvider.value(
                value: serviceLocator<SplashBloc>(),
              ),
            ],
            child: const ProfileScreen(),
          ),
        );

      case Routes.profileInfoRoute:
        Profile profile = routeSettings.arguments as Profile;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<ProfileBloc>(),
            child: ProfileInfoScreen(
              profile: profile,
            ),
          ),
        );

      case Routes.notificationRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<ProfileBloc>(),
            child: const NotificationScreen(),
          ),
        );
      case Routes.helpAndSupportRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<ProfileBloc>(),
            child: const HelpAndSupportScreen(),
          ),
        );
      case Routes.aboutRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<ProfileBloc>(),
            child: const AboutScreen(),
          ),
        );

      case Routes.addressRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<ProfileBloc>()..add(GetAddressesEvent()),
            child: const AddressScreen(),
          ),
        );
      case Routes.addNewAddressRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<ProfileBloc>()
              ..add(const GetCurrentLocationEvent()),
            child: const AddNewAddressScreen(),
          ),
        );

      case Routes.productsOverviewRoute:
        var product = routeSettings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<HomeBloc>(),
            child: ProductsOverview(
              product: product['product'],
              index: product['index'],
            ),
          ),
        );

      case Routes.cartRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<HomeBloc>(),
            child: const CartScreen(),
          ),
        );

      case Routes.favoritesRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<HomeBloc>(),
            child: const FavoritesScreen(),
          ),
        );

      case Routes.categoryRoute:
        var data = routeSettings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<HomeBloc>(),
            child: CategoryScreen(
              title: data['title'],
              id: data['id'],
            ),
          ),
        );
      case Routes.checkoutRoute:
        return MaterialPageRoute(
          builder: (_) {
            return MultiBlocProvider(
              providers: [
                //..add(PaymentAuthenticationEvent())
                BlocProvider.value(
                  value: serviceLocator<PaymentBloc>(),
                ),
                BlocProvider.value(
                  value: serviceLocator<HomeBloc>(),
                ),
                BlocProvider.value(
                  value: serviceLocator<ProfileBloc>(),
                ),
              ],
              child: const CheckoutScreen(),
            );
          },
        );

      case Routes.paymentMethodRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<PaymentBloc>(),
            child: const PaymentMethodScreen(),
          ),
        );
      case Routes.creditCardRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<PaymentBloc>(),
            child: const CreditCardScreen(),
          ),
        );
      case Routes.otherPaymentMethodRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<PaymentBloc>(),
            child: const OtherPaymentMethodScreen(),
          ),
        );

      case Routes.doneRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<PaymentBloc>(),
            child: const DoneScreen(),
          ),
        );
      //! Default
      default:
        return _unDefinedRoute();
    }
  }

  static MaterialPageRoute<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}

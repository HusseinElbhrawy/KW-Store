import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'app/app.dart';
import 'app/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51KzIHnAWCRF0dIno8hucZ5zYpgxE8YeN7MgqjxEtej8VV8kpkRf9bYVjtmBMfyIoJuHVbYyXdSIkWoQmdGd351o500kDguhcgN';

  // Bloc.observer = MyBlocObserver();

  await setupServiceLocator();

  runApp(MyApp());
}

import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = MyBlocObserver();

  await setupServiceLocator();

  runApp(MyApp());
}

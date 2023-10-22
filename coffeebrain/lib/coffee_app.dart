// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:wiredbrain/services/services.dart';

import 'coffee_router.dart';
import './get_theme.dart';
import 'screens/splash_screen.dart';

class CoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      navigatorKey: CoffeeRouter.instance.navigatorKey,
      navigatorObservers: <NavigatorObserver>[
        AnalyticsService.observer,
      ],
      theme: getTheme(),
    );
  }
}

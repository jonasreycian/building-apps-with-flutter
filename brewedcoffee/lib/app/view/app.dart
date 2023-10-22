import 'package:brewedcoffee/app/coffee_router.dart';
import 'package:brewedcoffee/app/screens/splash_screen.dart';
import 'package:brewedcoffee/app/services/services.dart';
import 'package:brewedcoffee/counter/counter.dart';
import 'package:brewedcoffee/l10n/l10n.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // home: const CounterPage(),
      home: const SplashScreen(),
      navigatorKey: CoffeeRouter.instance.navigatorKey,
      navigatorObservers: <NavigatorObserver>[
        AnalyticsService.observer,
      ],
    );
  }
}

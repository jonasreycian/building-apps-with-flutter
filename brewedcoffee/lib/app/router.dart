import 'package:brewedcoffee/app/enums/src/routes.dart';
import 'package:brewedcoffee/coffee/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  redirect: (context, state) {
    if (state.uri.toString() == '/') {
      context.goNamed(AppRouteEnum.splash.name);
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: AppRouteEnum.menu.name,
          // builder: (context, state) => const MenuScreen(),
        ),
      ],
    ),
  ],
);

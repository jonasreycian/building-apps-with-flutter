import 'package:brewedcoffee/app/enums/src/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = 'splashScreen';
  static Route<SplashScreen> route() {
    return MaterialPageRoute<SplashScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => const SplashScreen(),
    );
  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService.instance;
  final FirestoreService _firestoreService = FirestoreService.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/coffeback.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 600),
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 70,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        if (_authService.currentUser != null) {
          final String userId = _authService.currentUser!.uid;
          _firestoreService.setUserLastLoginTimestamp(userId);
          _firestoreService.addLog(
            activity: ActivityEnum.login,
            userId: userId,
          );

          CoffeeRouter.instance.pushReplacement(MenuScreen.route());
        } else {
          CoffeeRouter.instance.pushReplacement(HomeScreen.route());
        }
      },
    );
  }
}

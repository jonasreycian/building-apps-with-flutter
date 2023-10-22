import 'package:brewedcoffee/app/coffee_router.dart';
import 'package:brewedcoffee/app/screens/login.dart';
import 'package:brewedcoffee/app/screens/register.dart';
import 'package:brewedcoffee/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routeName = 'homeScreen';
  static Route<HomeScreen> route() {
    return MaterialPageRoute<HomeScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              height: 150,
              width: 150,
            ),
            SvgPicture.asset(
              'assets/hangout.svg',
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              semanticsLabel: 'Wired Brain Coffee',
              fit: BoxFit.fitWidth,
            ),
            Text(
              'Get the best coffee!',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CommonButton(
                  onPressed: () {
                    CoffeeRouter.instance.push(
                      RegisterScreen.route(),
                    );
                  },
                  text: 'Register',
                  highlighColor: true,
                ),
                const SizedBox(
                  width: 20,
                ),
                CommonButton(
                  onPressed: () {
                    CoffeeRouter.instance.push(
                      LoginScreen.route(),
                    );
                  },
                  text: 'Log In',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

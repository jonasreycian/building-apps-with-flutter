import 'package:brewedcoffee/app/coffee_router.dart';
import 'package:brewedcoffee/app/enums/src/activity.dart';
import 'package:brewedcoffee/app/screens/home.dart';
import 'package:brewedcoffee/app/services/services.dart';
import 'package:brewedcoffee/app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static String routeName = 'profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AnalyticsService _analyticsService = AnalyticsService.instance;
  final AuthService _authService = AuthService.instance;
  final FirestoreService _firestoreService = FirestoreService.instance;
  final MessagingService _messagingService = MessagingService.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authService.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return const Scaffold(body: Center(child: Text('Error!')));
        }
        final user = snapshot.data;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/coffee_break.svg',
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    semanticsLabel: 'Wired Brain Coffee',
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            if (user != null && user.isAnonymous)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('You are logged in annonymously!'),
              ),
            if (user != null && !user.isAnonymous)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text('Email: ${user.email}'),
              ),
            if (user != null && !user.emailVerified && !user.isAnonymous)
              CommonButton(
                text: 'Verify Your Email',
                onPressed: user.sendEmailVerification,
              ),
            if (_messagingService.userDeviceToken != null)
              CommonButton(
                text: 'Subscribe coffee newsletter',
                onPressed: () async {
                  await _messagingService.subscribeToTopic('Coffees');
                },
              ),
            if (_messagingService.userDeviceToken != null)
              CommonButton(
                text: 'Unsubscribe coffee newsletter',
                onPressed: () async {
                  await _messagingService.unsubscribeFromTopic('Coffees');
                },
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CommonButton(
                onPressed: () async {
                  await _firestoreService.addLog(
                    activity: ActivityEnum.logout,
                    userId: _authService.currentUser!.uid,
                  );
                  print(_messagingService.userDeviceToken);
                  await _firestoreService.deleteUserToken(
                    token: _messagingService.userDeviceToken!,
                    userId: _authService.currentUser!.uid,
                  );
                  await _analyticsService.logLogoutPressed();
                  await _authService.signOut();
                  await CoffeeRouter.instance
                      .pushAndRemoveUntil(HomeScreen.route());
                },
                text: 'Logout',
              ),
            ),
          ],
        );
      },
    );
  }
}

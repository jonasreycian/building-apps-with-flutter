import 'dart:async';

import 'package:brewedcoffee/app/coffee_router.dart';
import 'package:brewedcoffee/app/enums/enums.dart';
import 'package:brewedcoffee/app/enums/src/role.dart';
import 'package:brewedcoffee/app/screens/login_email.dart';
import 'package:brewedcoffee/app/screens/menu.dart';
import 'package:brewedcoffee/app/services/services.dart';
import 'package:brewedcoffee/app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = 'loginScreen';
  static Route<LoginScreen> route() {
    return MaterialPageRoute<LoginScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => const LoginScreen(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _textFieldController = TextEditingController();
  final AnalyticsService _analyticsService = AnalyticsService.instance;
  final AuthService _authService = AuthService.instance;
  final FirestoreService _firestoreService = FirestoreService.instance;

  StreamSubscription<User?>? _authChangeSubscription;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _authChangeSubscription = _authService.authStateChanges().listen(
      (User? user) async {
        if (user != null) {
          // which provider users is logged
          for (final provider in user.providerData) {
            await _analyticsService.logLogin(loginMethod: provider.providerId);
          }
          await _analyticsService.setUserProperties(
            userId: user.uid,
            userRoles: [UserRoleEnum.customer],
          );

          await _firestoreService.setUserLastLoginTimestamp(user.uid);

          await _firestoreService.addLog(
            activity: ActivityEnum.login,
            userId: user.uid,
          );

          await CoffeeRouter.instance.pushAndRemoveUntil(MenuScreen.route());
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _authChangeSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          Image.asset(
            'assets/logo.png',
            semanticLabel: 'logo',
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: <Widget>[
            Center(
              child: SvgPicture.asset(
                'assets/hotbeverage.svg',
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                semanticsLabel: 'Wired Brain Coffee',
                fit: BoxFit.fitWidth,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // SignInButton.phone(onPressed: () {
                  //   _displayTextInputDialog(context);
                  // }),
                  // SizedBox(height: 20),
                  SignInButton.google(
                    onPressed: _authService.signInWithGoogle,
                  ),
                  const SizedBox(height: 20),
                  FutureBuilder<bool>(
                    future: _authService.isAppleSignInAvailable(),
                    builder: (context, AsyncSnapshot<bool> snapshot) {
                      final isAvailable = snapshot.data ?? false;
                      if (isAvailable) {
                        return SignInButton.apple(
                          onPressed: _authService.signInWithApple,
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  const SizedBox(height: 20),
                  SignInButton.mail(
                    onPressed: () {
                      CoffeeRouter.instance.push(LoginEmailScreen.route());
                    },
                  ),
                  const SizedBox(height: 20),
                  const Center(child: Text('OR')),
                  const SizedBox(height: 20),
                  CommonButton(
                    onPressed: _loading
                        ? null // disable button
                        : () async {
                            setState(() {
                              _loading = true;
                            });

                            await _authService.signInAnonymously();

                            setState(() {
                              _loading = false;
                            });
                          },
                    text: _loading
                        ? 'Please wait, Login...'
                        : 'Continue anonymously',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Phone Number'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Phone number'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: CoffeeRouter.instance.pop,
              child: const Text('CANCEL'),
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                final phoneNumber = _textFieldController.text;
                if (_textFieldController.text.isNotEmpty) {
                  _authService.signInWithPhoneNumber(phoneNumber);
                }
                CoffeeRouter.instance.pop();
              },
            ),
          ],
        );
      },
    );
  }
}

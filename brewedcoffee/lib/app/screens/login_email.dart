import 'package:brewedcoffee/app/coffee_router.dart';
import 'package:brewedcoffee/app/constants.dart';
import 'package:brewedcoffee/app/enums/enums.dart';
import 'package:brewedcoffee/app/screens/forgot_password.dart';
import 'package:brewedcoffee/app/screens/menu.dart';
import 'package:brewedcoffee/app/services/services.dart';
import 'package:brewedcoffee/app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginEmailScreen extends StatefulWidget {
  const LoginEmailScreen({super.key});

  static String routeName = 'loginEmailScreen';
  static Route<LoginEmailScreen> route() {
    return MaterialPageRoute<LoginEmailScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => const LoginEmailScreen(),
    );
  }

  @override
  State<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  final formKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  final AnalyticsService _analyticsService = AnalyticsService.instance;
  final AuthService _authService = AuthService.instance;

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                LoginInputs(
                  emailFieldController: _emailFieldController,
                  passwordFieldController: _passwordFieldController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        CoffeeRouter.instance.push(
                          ForgotPasswordScreen.route(),
                        );
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: darkBrown,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                CommonButton(
                  onPressed: _onSubmitLoginButton,
                  text: 'login',
                ),
                const CreateAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isFormValidated() {
    final form = formKey.currentState!;
    return form.validate();
  }

  Future<void> _onSubmitLoginButton() async {
    if (_isFormValidated()) {
      ScaffoldMessenger.of(context).showSnackBar(
        loadingSnackBar(
          text: ' Signing-In...',
        ),
      );

      final user = await _authService.signInWithEmailAndPassword(
        email: _emailFieldController.text,
        password: _passwordFieldController.text,
      );

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (user != null) {
        await _analyticsService.logLogin();

        await _analyticsService.setUserProperties(
          userId: user.uid,
          userRoles: [UserRoleEnum.customer],
        );

        await CoffeeRouter.instance.push(MenuScreen.route());
      }
    }
  }
}

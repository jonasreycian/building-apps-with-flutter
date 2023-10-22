import 'package:brewedcoffee/app/coffee_router.dart';
import 'package:brewedcoffee/app/enums/src/role.dart';
import 'package:brewedcoffee/app/screens/menu.dart';
import 'package:brewedcoffee/app/services/services.dart';
import 'package:brewedcoffee/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static String routeName = 'RegisterScreen';
  static Route<RegisterScreen> route() {
    return MaterialPageRoute<RegisterScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => RegisterScreen(),
    );
  }

  final formKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  final AnalyticsService _analyticsService = AnalyticsService.instance;
  final AuthService _authService = AuthService.instance;
  final FirestoreService _firestoreService = FirestoreService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
                LoginInputs(
                  emailFieldController: _emailFieldController,
                  passwordFieldController: _passwordFieldController,
                ),
                CommonButton(
                  onPressed: () {
                    _onSubmitLoginButton(context);
                  },
                  text: 'Register',
                ),
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

  Future<void> _onSubmitLoginButton(BuildContext context) async {
    if (_isFormValidated()) {
      ScaffoldMessenger.of(context).showSnackBar(
        loadingSnackBar(
          text: ' Creating user...',
        ),
      );

      final user = await _authService.createUserWithEmailAndPassword(
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

        await _firestoreService.setUserRoles(user.uid, [
          UserRoleEnum.customer,
        ]);

        await CoffeeRouter.instance.pushAndRemoveUntil(
          MenuScreen.route(),
        );
      }
    }
  }
}

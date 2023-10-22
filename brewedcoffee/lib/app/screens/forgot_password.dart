import 'package:brewedcoffee/app/coffee_router.dart';
import 'package:brewedcoffee/app/constants.dart';
import 'package:brewedcoffee/app/helpers/helpers.dart';
import 'package:brewedcoffee/app/screens/home.dart';
import 'package:brewedcoffee/app/services/services.dart';
import 'package:brewedcoffee/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static String routeName = 'ForgotPasswordScreen';
  static Route<ForgotPasswordScreen> route() {
    return MaterialPageRoute<ForgotPasswordScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => const ForgotPasswordScreen(),
    );
  }

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();

  final AuthService _authService = AuthService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
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
                TextFormField(
                  key: const Key('email'),
                  controller: _emailFieldController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'me@majidhajian.com',
                    labelStyle: const TextStyle(color: darkBrown),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: darkBrown),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: darkBrown),
                    ),
                  ),
                  cursorColor: darkBrown,
                  validator: Validators.validateEmail,
                ),
                CommonButton(
                  onPressed: _onSubmitLoginButton,
                  text: 'Submit',
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

  _onSubmitLoginButton() async {
    if (_isFormValidated()) {
      ScaffoldMessenger.of(context).showSnackBar(
        loadingSnackBar(
          text: ' Wait please...',
        ),
      );

      await _authService.sendPasswordResetEmail(
        email: _emailFieldController.text,
      );

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      const snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text('Please check your email!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      await CoffeeRouter.instance.push(HomeScreen.route());
    }
  }
}

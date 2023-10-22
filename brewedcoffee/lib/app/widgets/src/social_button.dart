import 'package:brewedcoffee/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@immutable
class SignInButton extends StatelessWidget {
  const SignInButton({
    required this.onPressed,
    required this.icon,
    required this.btnColor,
    required this.btnTextColor,
    required this.btnText,
    super.key,
    this.padding = 15.0,
    this.shape = const StadiumBorder(),
  });

  factory SignInButton.apple({
    required void Function() onPressed,
  }) {
    return SignInButton(
      btnText: 'Sign in with Apple',
      btnTextColor: Colors.black,
      btnColor: const Color(0xfff7f7f7),
      icon: FontAwesomeIcons.apple,
      onPressed: onPressed,
    );
  }

  factory SignInButton.twitter({
    required void Function() onPressed,
  }) =>
      SignInButton(
        btnText: 'Sign in with Twitter',
        btnTextColor: Colors.white,
        btnColor: const Color(0xFF1DA1F2),
        icon: FontAwesomeIcons.twitter,
        onPressed: onPressed,
      );

  factory SignInButton.google({
    required void Function() onPressed,
  }) =>
      SignInButton(
        btnText: 'Sign in with Google',
        btnTextColor: Colors.white,
        btnColor: const Color(0xff4285F4),
        icon: FontAwesomeIcons.google,
        onPressed: onPressed,
      );

  factory SignInButton.mail({
    required void Function() onPressed,
  }) =>
      SignInButton(
        btnText: 'Sign in with Email',
        btnTextColor: Colors.white,
        btnColor: darkBrown,
        icon: FontAwesomeIcons.envelope,
        onPressed: onPressed,
      );

  factory SignInButton.phone({
    required void Function() onPressed,
  }) =>
      SignInButton(
        btnText: 'Sign in with Phone',
        btnTextColor: Colors.white,
        btnColor: Colors.grey,
        icon: FontAwesomeIcons.phone,
        onPressed: onPressed,
      );

  final void Function() onPressed;
  final Color btnColor;
  final Color btnTextColor;
  final String btnText;
  final IconData icon;

  final double padding;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: btnColor,
      shape: shape,
      onPressed: onPressed,
      elevation: 1,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(padding),
            child: Icon(
              icon,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(padding),
            child: Text(
              btnText,
              style: TextStyle(
                color: btnTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

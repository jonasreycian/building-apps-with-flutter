import 'package:brewedcoffee/app/coffee_router.dart';
import 'package:brewedcoffee/app/constants.dart';
import 'package:brewedcoffee/app/screens/register.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey.shade600),
        ),
        TextButton(
          onPressed: () {
            CoffeeRouter.instance.push(RegisterScreen.route());
          },
          child: const Text(
            ' Register',
            style: TextStyle(
              color: darkBrown,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:brewedcoffee/app/constants.dart';
import 'package:brewedcoffee/app/helpers/src/validators.dart';
import 'package:flutter/material.dart';

class LoginInputs extends StatelessWidget {
  const LoginInputs({
    super.key,
    this.emailFieldController,
    this.passwordFieldController,
  });

  final TextEditingController? emailFieldController;
  final TextEditingController? passwordFieldController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          key: const Key('email'),
          controller: emailFieldController,
          decoration: InputDecoration(
            labelText: 'Username',
            hintText: 'me@jonasreycian.com',
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
        const SizedBox(height: 30),
        TextFormField(
          key: const Key('password'),
          controller: passwordFieldController,
          autocorrect: false,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'securepassword',
            labelText: 'Password',
            labelStyle: const TextStyle(color: darkBrown),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: darkBrown),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: darkBrown),
            ),
          ),
          cursorColor: darkBrown,
          validator: Validators.validatePassword,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

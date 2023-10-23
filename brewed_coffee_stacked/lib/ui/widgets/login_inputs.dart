import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../constants.dart';
import '../../helpers/src/validators.dart';
import 'login_inputs.form.dart';
import 'login_inputs.model.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginInputs extends StackedView<LoginInputsModel> with $LoginInputs {
  const LoginInputs({super.key});

  @override
  Widget builder(
    BuildContext context,
    LoginInputsModel viewModel,
    Widget? child,
  ) {
    return Column(
      children: <Widget>[
        TextFormField(
          key: const ValueKey('email'),
          controller: emailController,
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
          controller: passwordController,
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

  @override
  LoginInputsModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginInputsModel();

  @override
  void onDispose(LoginInputsModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}

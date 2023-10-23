import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants.dart';
import 'create_account.model.dart';

class CreateAccount extends StackedView<CreateAccountModel> {
  const CreateAccount({super.key});

  @override
  Widget builder(
    BuildContext context,
    CreateAccountModel viewModel,
    Widget? child,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey.shade600),
        ),
        TextButton(
          onPressed: viewModel.navigateToRegisterScreen,
          child: const Text(
            " Register",
            style: TextStyle(
              color: darkBrown,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  @override
  CreateAccountModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateAccountModel();
}

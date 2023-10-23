import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_inputs_model.dart';

class LoginInputs extends StackedView<LoginInputsModel> {
  const LoginInputs({super.key});

  @override
  Widget builder(
    BuildContext context,
    LoginInputsModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  LoginInputsModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginInputsModel();
}

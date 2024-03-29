import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_email_viewmodel.dart';

class LoginEmailView extends StackedView<LoginEmailViewModel> {
  const LoginEmailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginEmailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  LoginEmailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginEmailViewModel();
}

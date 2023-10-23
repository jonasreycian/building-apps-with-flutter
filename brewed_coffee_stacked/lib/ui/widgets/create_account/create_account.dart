import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'create_account_model.dart';

class CreateAccount extends StackedView<CreateAccountModel> {
  const CreateAccount({super.key});

  @override
  Widget builder(
    BuildContext context,
    CreateAccountModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  CreateAccountModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateAccountModel();
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'social_button_model.dart';

class SocialButton extends StackedView<SocialButtonModel> {
  const SocialButton({super.key});

  @override
  Widget builder(
    BuildContext context,
    SocialButtonModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  SocialButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      SocialButtonModel();
}

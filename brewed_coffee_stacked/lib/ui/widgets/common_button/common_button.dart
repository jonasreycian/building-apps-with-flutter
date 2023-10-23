import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'common_button_model.dart';

class CommonButton extends StackedView<CommonButtonModel> {
  const CommonButton({super.key});

  @override
  Widget builder(
    BuildContext context,
    CommonButtonModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  CommonButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      CommonButtonModel();
}

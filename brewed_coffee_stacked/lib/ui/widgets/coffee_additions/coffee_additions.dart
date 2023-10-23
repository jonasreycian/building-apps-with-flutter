import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'coffee_additions_model.dart';

class CoffeeAdditions extends StackedView<CoffeeAdditionsModel> {
  const CoffeeAdditions({super.key});

  @override
  Widget builder(
    BuildContext context,
    CoffeeAdditionsModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  CoffeeAdditionsModel viewModelBuilder(
    BuildContext context,
  ) =>
      CoffeeAdditionsModel();
}

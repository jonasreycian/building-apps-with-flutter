import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'coffee_size_model.dart';

class CoffeeSize extends StackedView<CoffeeSizeModel> {
  const CoffeeSize({super.key});

  @override
  Widget builder(
    BuildContext context,
    CoffeeSizeModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  CoffeeSizeModel viewModelBuilder(
    BuildContext context,
  ) =>
      CoffeeSizeModel();
}

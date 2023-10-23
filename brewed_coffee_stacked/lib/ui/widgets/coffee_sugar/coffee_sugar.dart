import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'coffee_sugar_model.dart';

class CoffeeSugar extends StackedView<CoffeeSugarModel> {
  const CoffeeSugar({super.key});

  @override
  Widget builder(
    BuildContext context,
    CoffeeSugarModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  CoffeeSugarModel viewModelBuilder(
    BuildContext context,
  ) =>
      CoffeeSugarModel();
}

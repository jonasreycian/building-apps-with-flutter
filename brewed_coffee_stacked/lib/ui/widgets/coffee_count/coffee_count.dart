import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'coffee_count_model.dart';

class CoffeeCount extends StackedView<CoffeeCountModel> {
  const CoffeeCount({super.key});

  @override
  Widget builder(
    BuildContext context,
    CoffeeCountModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  CoffeeCountModel viewModelBuilder(
    BuildContext context,
  ) =>
      CoffeeCountModel();
}

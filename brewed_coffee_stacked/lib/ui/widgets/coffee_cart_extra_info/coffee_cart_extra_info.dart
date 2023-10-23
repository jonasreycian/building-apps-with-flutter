import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'coffee_cart_extra_info_model.dart';

class CoffeeCartExtraInfo extends StackedView<CoffeeCartExtraInfoModel> {
  const CoffeeCartExtraInfo({super.key});

  @override
  Widget builder(
    BuildContext context,
    CoffeeCartExtraInfoModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  CoffeeCartExtraInfoModel viewModelBuilder(
    BuildContext context,
  ) =>
      CoffeeCartExtraInfoModel();
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'cart_badge_model.dart';

class CartBadge extends StackedView<CartBadgeModel> {
  const CartBadge({super.key});

  @override
  Widget builder(
    BuildContext context,
    CartBadgeModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  CartBadgeModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartBadgeModel();
}

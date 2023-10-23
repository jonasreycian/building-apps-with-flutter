import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../models/models.dart';
import 'cart_badge.model.dart';

class CartBadge extends StackedView<CartBadgeModel> {
  const CartBadge({
    Key? key,
    required this.cartChild,
    this.color,
    required this.top,
    required this.right,
  }) : super(key: key);

  final double top;
  final double right;
  final Widget cartChild;
  final Color? color;

  @override
  Widget builder(
    BuildContext context,
    CartBadgeModel viewModel,
    Widget? child,
  ) {
    return StreamBuilder<List<CartItem>?>(
      key: const ValueKey('CartBadgeStream'),
      initialData: const [],
      stream: viewModel.stream as Stream<List<CartItem>>,
      builder: (context, AsyncSnapshot<List<CartItem>?> snapshot) {
        int cartItems = 0;

        if (snapshot.hasError ||
            snapshot.connectionState != ConnectionState.active ||
            !snapshot.hasData) {
          return const SizedBox();
        }

        cartItems = snapshot.data!.length;
        return Stack(
          alignment: Alignment.center,
          children: [
            cartChild,
            Positioned(
              right: right,
              top: top,
              child: Container(
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: color ?? Colors.red,
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  cartItems.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  CartBadgeModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartBadgeModel();
}

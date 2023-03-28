import 'package:flutter/material.dart';
import 'package:wiredbrain/models/models.dart';
import 'package:wiredbrain/widgets/widgets.dart';

class CoffeeCartExtraInfo extends StatelessWidget {
  const CoffeeCartExtraInfo({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text('Details: ${item.quantity} x ${item.coffee.name}'),
          CoffeeSize(
            icon: item.coffee.iconData,
            size: item.size,
            lessSpace: true,
            onPressed: (_) {},
          ),
          Divider(height: 1),
          CoffeeSugar(
            sugar: item.sugar,
            lessSpace: true,
            onPressed: (_) {},
          ),
          Divider(height: 1),
          CoffeeAdditions(
            onPressed: (_) {},
            lessSpace: true,
            additions: item.additions,
          ),
        ],
      ),
    );
  }
}

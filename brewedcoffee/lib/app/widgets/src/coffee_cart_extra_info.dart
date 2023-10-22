import 'package:brewedcoffee/app/models/models.dart';
import 'package:brewedcoffee/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CoffeeCartExtraInfo extends StatelessWidget {
  const CoffeeCartExtraInfo({
    required this.item,
    super.key,
  });

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
          const Divider(height: 1),
          CoffeeSugar(
            sugar: item.sugar,
            lessSpace: true,
            onPressed: (_) {},
          ),
          const Divider(height: 1),
          CoffeeAdditions(
            lessSpace: true,
            additions: item.additions,
            onPressed: (_) {},
          ),
        ],
      ),
    );
  }
}

import 'package:brewedcoffee/app/enums/enums.dart';
import 'package:flutter/material.dart';

class CoffeeSize extends StatelessWidget {
  const CoffeeSize({
    required this.icon,
    required this.size,
    required this.onPressed,
    super.key,
    this.lessSpace = false,
  });

  final IconData icon;
  final CoffeeCupSizeEnum size;
  final bool lessSpace;
  final void Function(CoffeeCupSizeEnum) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        if (!lessSpace) ...[
          Text(
            'Size',
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(width: 50),
        ],
        IconButton(
          icon: Icon(
            icon,
            color: getColor(isSelected: size.isSmall),
            size: CoffeeCupSizeEnum.small.iconSize,
          ),
          onPressed: () {
            onPressed(CoffeeCupSizeEnum.small);
          },
        ),
        IconButton(
          icon: Icon(
            icon,
            color: getColor(isSelected: size.isMedium),
            size: CoffeeCupSizeEnum.medium.iconSize,
          ),
          onPressed: () {
            onPressed(CoffeeCupSizeEnum.medium);
          },
        ),
        IconButton(
          icon: Icon(
            icon,
            color: getColor(isSelected: size.isLarge),
            size: CoffeeCupSizeEnum.large.iconSize,
          ),
          onPressed: () {
            onPressed(CoffeeCupSizeEnum.large);
          },
        ),
      ],
    );
  }

  Color getColor({bool isSelected = false}) {
    return isSelected ? Colors.brown.shade800 : Colors.grey.shade400;
  }
}

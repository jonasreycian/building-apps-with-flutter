import 'package:flutter/material.dart';
import 'package:wiredbrain/enums/enums.dart';

class CoffeeAdditions extends StatelessWidget {
  CoffeeAdditions({
    Key? key,
    required this.additions,
    required this.onPressed,
    this.lessSpace = false,
  }) : super(key: key);

  final List<CoffeeAdditionEnum> additions;
  final bool lessSpace;
  final Function(List<CoffeeAdditionEnum>) onPressed;

  get hasCake {
    return additions.contains(CoffeeAdditionEnum.cake);
  }

  get hasIceCream {
    return additions.contains(CoffeeAdditionEnum.icecream);
  }

  get hasCheese {
    return additions.contains(CoffeeAdditionEnum.cheese);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        if (!lessSpace) ...[
          Text(
            "Additions",
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(width: 14),
        ],
        IconButton(
          icon: Icon(
            CoffeeAdditionEnum.cake.iconData,
            color: getColor(hasCake),
          ),
          onPressed: () {
            toggle(hasCake, CoffeeAdditionEnum.cake);
          },
        ),
        IconButton(
          icon: Icon(
            CoffeeAdditionEnum.icecream.iconData,
            color: getColor(additions.contains(CoffeeAdditionEnum.icecream)),
          ),
          onPressed: () {
            toggle(hasIceCream, CoffeeAdditionEnum.icecream);
          },
        ),
        IconButton(
          icon: Icon(
            CoffeeAdditionEnum.cheese.iconData,
            color: getColor(additions.contains(CoffeeAdditionEnum.cheese)),
          ),
          onPressed: () {
            toggle(hasCheese, CoffeeAdditionEnum.cheese);
          },
        ),
      ],
    );
  }

  Color getColor(bool isSelected) {
    return isSelected ? Colors.brown.shade800 : Colors.grey.shade400;
  }

  void toggle(bool selected, CoffeeAdditionEnum addition) {
    if (selected) {
      final newList = additions.where((item) => item != addition).toList();
      onPressed(newList);
    } else {
      final newList = [...additions, addition];
      onPressed(newList);
    }
  }
}

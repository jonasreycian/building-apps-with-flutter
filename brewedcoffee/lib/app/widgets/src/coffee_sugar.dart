import 'package:brewedcoffee/app/enums/enums.dart';
import 'package:flutter/material.dart';

class CoffeeSugar extends StatelessWidget {
  const CoffeeSugar({
    required this.sugar,
    required this.onPressed,
    super.key,
    this.lessSpace = false,
  });

  final SugarCubeEnum sugar;
  final bool lessSpace;
  final void Function(SugarCubeEnum) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        if (!lessSpace) ...[
          Text(
            'Sugar',
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(width: 40),
        ],
        IconButton(
          icon: Icon(
            SugarCubeEnum.no.iconData,
            color: getColor(isSelected: sugar == SugarCubeEnum.no),
          ),
          onPressed: () {
            onPressed(SugarCubeEnum.no);
          },
        ),
        IconButton(
          icon: Icon(
            SugarCubeEnum.one.iconData,
            color: getColor(isSelected: sugar == SugarCubeEnum.one),
          ),
          onPressed: () {
            onPressed(SugarCubeEnum.one);
          },
        ),
        IconButton(
          icon: Row(
            children: <Widget>[
              Icon(
                SugarCubeEnum.two.iconData,
                color: getColor(isSelected: sugar == SugarCubeEnum.two),
              ),
              Flexible(
                child: Icon(
                  SugarCubeEnum.two.iconData,
                  color: getColor(isSelected: sugar == SugarCubeEnum.two),
                ),
              ),
            ],
          ),
          onPressed: () {
            onPressed(SugarCubeEnum.two);
          },
        ),
      ],
    );
  }

  Color getColor({bool isSelected = false}) {
    return isSelected ? Colors.brown.shade800 : Colors.grey.shade400;
  }
}

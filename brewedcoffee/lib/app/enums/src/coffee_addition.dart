import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum CoffeeAdditionEnum {
  cake(Icons.cake),
  icecream(FontAwesomeIcons.iceCream),
  cheese(FontAwesomeIcons.cheese);

  const CoffeeAdditionEnum(this.iconData);
  final IconData iconData;
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum CoffeeAdditionEnum {
  cake,
  icecream,
  cheese,
}

extension CoffeeAdditionExtension on CoffeeAdditionEnum {
  IconData get iconData {
    switch (this) {
      case CoffeeAdditionEnum.cake:
        return Icons.cake;
      case CoffeeAdditionEnum.icecream:
        return FontAwesomeIcons.iceCream;
      case CoffeeAdditionEnum.cheese:
        return FontAwesomeIcons.cheese;
      default:
        return Icons.close;
    }
  }
}

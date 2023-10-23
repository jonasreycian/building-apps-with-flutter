import 'package:flutter/material.dart';

enum SugarCubeEnum {
  no(Icons.close),
  one(Icons.check_box_outline_blank_outlined),
  two(Icons.check_box_outline_blank);

  const SugarCubeEnum(this.iconData);
  final IconData iconData;
}

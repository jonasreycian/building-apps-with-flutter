import 'package:brewed_coffee_stacked/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color darkBrown = Color(0xFFA26E47);
const Color lightBrown = Color(0xFFF9E8D4);
const Color brown = Color(0xFF9C5700);
const Color facebookColor = Color(0xFF4867AA);

final List<Coffee> coffees = [
  Coffee(
      id: '1',
      icon: FontAwesomeIcons.mugSaucer.codePoint,
      name: "Espresso ",
      price: 8),
  Coffee(
      id: '1',
      icon: FontAwesomeIcons.mugHot.codePoint,
      name: "Cappuccino",
      price: 10),
  Coffee(
      id: '1',
      icon: FontAwesomeIcons.martiniGlassCitrus.codePoint,
      name: "Mocha",
      price: 12),
  Coffee(
      id: '1',
      icon: FontAwesomeIcons.beerMugEmpty.codePoint,
      name: "Americano",
      price: 7),
  Coffee(
    id: '1',
    icon: FontAwesomeIcons.martiniGlassCitrus.codePoint,
    name: "Italian Macchiato",
    price: 5,
  ),
  Coffee(
      id: '1',
      icon: FontAwesomeIcons.mugSaucer.codePoint,
      name: "Flat White",
      price: 3),
  Coffee(
    id: '1',
    icon: FontAwesomeIcons.mugHot.codePoint,
    name: "American Affogato",
    price: 11,
  ),
  Coffee(
      id: '1',
      icon: FontAwesomeIcons.mugSaucer.codePoint,
      name: "Long Black",
      price: 4),
  Coffee(
      id: '1',
      icon: FontAwesomeIcons.mugHot.codePoint,
      name: "Latte",
      price: 12),
  Coffee(
    id: '1',
    icon: FontAwesomeIcons.martiniGlassCitrus.codePoint,
    name: "American Espresso",
    price: 9,
  ),
  Coffee(
      id: '1',
      icon: FontAwesomeIcons.beerMugEmpty.codePoint,
      name: "CAFÈ AU LAIT.",
      price: 10),
  Coffee(
      id: '1',
      icon: FontAwesomeIcons.mugSaucer.codePoint,
      name: "AFFÈ MOCHA.",
      price: 12),
  Coffee(
      id: '1',
      icon: FontAwesomeIcons.beerMugEmpty.codePoint,
      name: "Americano",
      price: 7),
  Coffee(
    id: '1',
    icon: FontAwesomeIcons.martiniGlassCitrus.codePoint,
    name: "Double Exspersso",
    price: 5,
  ),
];

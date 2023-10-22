import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee.g.dart';
part 'coffee.freezed.dart';

@freezed
class Coffee with _$Coffee {
  const Coffee._();

  const factory Coffee({
    required int icon,
    required String id,
    required String name,
    required int price,
  }) = _Coffee;

  IconData get iconData => IconData(
        icon,
        fontFamily: 'FontAwesomeSolid',
        fontPackage: 'font_awesome_flutter',
      );

  factory Coffee.fromJson(Map<String, dynamic> json) => _$CoffeeFromJson(json);
}

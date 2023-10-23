import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee.freezed.dart';
part 'coffee.g.dart';

@freezed
class Coffee with _$Coffee {
  const factory Coffee({
    required int icon,
    required String id,
    required String name,
    required int price,
  }) = _Coffee;

  factory Coffee.fromJson(Map<String, dynamic> json) => _$CoffeeFromJson(json);
  const Coffee._();

  IconData get iconData => IconData(
        icon,
        fontFamily: 'FontAwesomeSolid',
        fontPackage: 'font_awesome_flutter',
      );
}

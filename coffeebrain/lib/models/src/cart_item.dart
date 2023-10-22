import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wiredbrain/helpers/helpers.dart';
import 'package:wiredbrain/enums/enums.dart';

import 'coffee.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    String? id,
    required Coffee coffee,
    required CoffeeCupSize size,
    required CoffeeSugarCube sugar,
    required int quantity,
    required List<CoffeeAdditionEnum> additions,
  }) = _CartItem;

  num get total => getCartItemTotal(
        count: quantity,
        price: coffee.price,
        additions: additions.length,
        size: size.index,
        sugar: sugar.index,
      );

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

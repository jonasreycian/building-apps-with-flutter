import 'package:brewedcoffee/app/enums/enums.dart';
import 'package:brewedcoffee/app/helpers/helpers.dart';
import 'package:brewedcoffee/app/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required Coffee coffee,
    required CoffeeCupSizeEnum size,
    required SugarCubeEnum sugar,
    required int quantity,
    required List<CoffeeAdditionEnum> additions,
    String? id,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
  const CartItem._();

  num get total => getCartItemTotal(
        count: quantity,
        price: coffee.price,
        additions: additions.length,
        size: size.index,
        sugar: sugar.index,
      );
}

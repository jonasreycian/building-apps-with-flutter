import 'package:brewedcoffee/app/enums/src/order_status.dart';
import 'package:brewedcoffee/app/helpers/helpers.dart';
import 'package:brewedcoffee/app/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class OrderItem with _$OrderItem {
  @DateTimeConverter()
  const factory OrderItem({
    required List<CartItem> items,
    required OrderStatusEnum status,
    required String userId,
    required DateTime created,
    required DateTime updated,
    String? id,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
  const OrderItem._();

  bool get isReady => status.isReady;

  num get total => items
      .map(
        (item) => getCartItemTotal(
          count: item.quantity,
          price: item.coffee.price,
          additions: item.additions.length,
          size: item.size.index,
          sugar: item.sugar.index,
        ),
      )
      .reduce((value, element) => value + element);
}

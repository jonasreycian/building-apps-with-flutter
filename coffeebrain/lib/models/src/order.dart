import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/enums.dart';
import '../../helpers/helpers.dart';
import 'cart_item.dart';
import 'date_time_converter.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class OrderItem with _$OrderItem {
  const OrderItem._();

  @DateTimeConverter()
  const factory OrderItem({
    String? id,
    required List<CartItem> items,
    required OrderStatus status,
    required String userId,
    required DateTime created,
    required DateTime updated,
  }) = _OrderItem;

  bool get isReady => status == OrderStatus.ready;

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

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@JsonEnum(valueField: 'code')
enum StatusCodeEnhanced {
  success(200),
  movedPermanently(301),
  found(302),
  internalServerError(500);

  const StatusCodeEnhanced(this.code);
  final int code;
}

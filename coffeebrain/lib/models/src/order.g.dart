// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      id: json['id'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      userId: json['userId'] as String,
      created:
          const DateTimeConverter().fromJson(json['created'] as FieldValue),
      updated:
          const DateTimeConverter().fromJson(json['updated'] as FieldValue),
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.items,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'userId': instance.userId,
      'created': const DateTimeConverter().toJson(instance.created),
      'updated': const DateTimeConverter().toJson(instance.updated),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.preparing: 'preparing',
  OrderStatus.ready: 'ready',
  OrderStatus.delivered: 'delivered',
  OrderStatus.canceled: 'canceled',
};

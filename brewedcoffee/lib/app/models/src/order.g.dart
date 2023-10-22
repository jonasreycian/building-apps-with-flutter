// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecode(_$OrderStatusEnumEnumMap, json['status']),
      userId: json['userId'] as String,
      created:
          const DateTimeConverter().fromJson(json['created'] as FieldValue),
      updated:
          const DateTimeConverter().fromJson(json['updated'] as FieldValue),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'status': _$OrderStatusEnumEnumMap[instance.status]!,
      'userId': instance.userId,
      'created': const DateTimeConverter().toJson(instance.created),
      'updated': const DateTimeConverter().toJson(instance.updated),
      'id': instance.id,
    };

const _$OrderStatusEnumEnumMap = {
  OrderStatusEnum.pending: 'pending',
  OrderStatusEnum.preparing: 'preparing',
  OrderStatusEnum.ready: 'ready',
  OrderStatusEnum.delivered: 'delivered',
  OrderStatusEnum.canceled: 'canceled',
};

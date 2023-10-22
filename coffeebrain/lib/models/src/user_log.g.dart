// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLogImpl _$$UserLogImplFromJson(Map<String, dynamic> json) =>
    _$UserLogImpl(
      id: json['id'] as String?,
      activity: $enumDecode(_$ActivityEnumMap, json['activity']),
      created:
          const DateTimeConverter().fromJson(json['created'] as FieldValue),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$UserLogImplToJson(_$UserLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'activity': _$ActivityEnumMap[instance.activity]!,
      'created': const DateTimeConverter().toJson(instance.created),
      'userId': instance.userId,
    };

const _$ActivityEnumMap = {
  Activity.login: 'login',
  Activity.addToCart: 'addToCart',
  Activity.placeOrder: 'placeOrder',
  Activity.logout: 'logout',
};

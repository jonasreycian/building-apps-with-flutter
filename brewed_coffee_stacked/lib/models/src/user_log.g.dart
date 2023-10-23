// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLogImpl _$$UserLogImplFromJson(Map<String, dynamic> json) =>
    _$UserLogImpl(
      activity: $enumDecode(_$ActivityEnumEnumMap, json['activity']),
      created:
          const DateTimeConverter().fromJson(json['created'] as FieldValue),
      userId: json['userId'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$UserLogImplToJson(_$UserLogImpl instance) =>
    <String, dynamic>{
      'activity': _$ActivityEnumEnumMap[instance.activity]!,
      'created': const DateTimeConverter().toJson(instance.created),
      'userId': instance.userId,
      'id': instance.id,
    };

const _$ActivityEnumEnumMap = {
  ActivityEnum.login: 'login',
  ActivityEnum.addToCart: 'addToCart',
  ActivityEnum.placeOrder: 'placeOrder',
  ActivityEnum.logout: 'logout',
};

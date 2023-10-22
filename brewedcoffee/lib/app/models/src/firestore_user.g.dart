// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirestoreUserImpl _$$FirestoreUserImplFromJson(Map<String, dynamic> json) =>
    _$FirestoreUserImpl(
      roles: (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$UserRoleEnumEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$FirestoreUserImplToJson(_$FirestoreUserImpl instance) =>
    <String, dynamic>{
      'roles': instance.roles.map((e) => _$UserRoleEnumEnumMap[e]!).toList(),
    };

const _$UserRoleEnumEnumMap = {
  UserRoleEnum.customer: 'customer',
  UserRoleEnum.admin: 'admin',
  UserRoleEnum.unknown: 'unknown',
};

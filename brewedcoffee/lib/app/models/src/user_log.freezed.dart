// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserLog _$UserLogFromJson(Map<String, dynamic> json) {
  return _UserLog.fromJson(json);
}

/// @nodoc
mixin _$UserLog {
  ActivityEnum get activity => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLogCopyWith<UserLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLogCopyWith<$Res> {
  factory $UserLogCopyWith(UserLog value, $Res Function(UserLog) then) =
      _$UserLogCopyWithImpl<$Res, UserLog>;
  @useResult
  $Res call(
      {ActivityEnum activity, DateTime created, String userId, String? id});
}

/// @nodoc
class _$UserLogCopyWithImpl<$Res, $Val extends UserLog>
    implements $UserLogCopyWith<$Res> {
  _$UserLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? created = null,
    Object? userId = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as ActivityEnum,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLogImplCopyWith<$Res> implements $UserLogCopyWith<$Res> {
  factory _$$UserLogImplCopyWith(
          _$UserLogImpl value, $Res Function(_$UserLogImpl) then) =
      __$$UserLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ActivityEnum activity, DateTime created, String userId, String? id});
}

/// @nodoc
class __$$UserLogImplCopyWithImpl<$Res>
    extends _$UserLogCopyWithImpl<$Res, _$UserLogImpl>
    implements _$$UserLogImplCopyWith<$Res> {
  __$$UserLogImplCopyWithImpl(
      _$UserLogImpl _value, $Res Function(_$UserLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? created = null,
    Object? userId = null,
    Object? id = freezed,
  }) {
    return _then(_$UserLogImpl(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as ActivityEnum,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@DateTimeConverter()
class _$UserLogImpl implements _UserLog {
  const _$UserLogImpl(
      {required this.activity,
      required this.created,
      required this.userId,
      this.id});

  factory _$UserLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLogImplFromJson(json);

  @override
  final ActivityEnum activity;
  @override
  final DateTime created;
  @override
  final String userId;
  @override
  final String? id;

  @override
  String toString() {
    return 'UserLog(activity: $activity, created: $created, userId: $userId, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLogImpl &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, activity, created, userId, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLogImplCopyWith<_$UserLogImpl> get copyWith =>
      __$$UserLogImplCopyWithImpl<_$UserLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLogImplToJson(
      this,
    );
  }
}

abstract class _UserLog implements UserLog {
  const factory _UserLog(
      {required final ActivityEnum activity,
      required final DateTime created,
      required final String userId,
      final String? id}) = _$UserLogImpl;

  factory _UserLog.fromJson(Map<String, dynamic> json) = _$UserLogImpl.fromJson;

  @override
  ActivityEnum get activity;
  @override
  DateTime get created;
  @override
  String get userId;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$UserLogImplCopyWith<_$UserLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

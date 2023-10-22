// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Coffee _$CoffeeFromJson(Map<String, dynamic> json) {
  return _Coffee.fromJson(json);
}

/// @nodoc
mixin _$Coffee {
  int get icon => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoffeeCopyWith<Coffee> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeCopyWith<$Res> {
  factory $CoffeeCopyWith(Coffee value, $Res Function(Coffee) then) =
      _$CoffeeCopyWithImpl<$Res, Coffee>;
  @useResult
  $Res call({int icon, String id, String name, int price});
}

/// @nodoc
class _$CoffeeCopyWithImpl<$Res, $Val extends Coffee>
    implements $CoffeeCopyWith<$Res> {
  _$CoffeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? id = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoffeeImplCopyWith<$Res> implements $CoffeeCopyWith<$Res> {
  factory _$$CoffeeImplCopyWith(
          _$CoffeeImpl value, $Res Function(_$CoffeeImpl) then) =
      __$$CoffeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int icon, String id, String name, int price});
}

/// @nodoc
class __$$CoffeeImplCopyWithImpl<$Res>
    extends _$CoffeeCopyWithImpl<$Res, _$CoffeeImpl>
    implements _$$CoffeeImplCopyWith<$Res> {
  __$$CoffeeImplCopyWithImpl(
      _$CoffeeImpl _value, $Res Function(_$CoffeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? id = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_$CoffeeImpl(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoffeeImpl extends _Coffee {
  const _$CoffeeImpl(
      {required this.icon,
      required this.id,
      required this.name,
      required this.price})
      : super._();

  factory _$CoffeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoffeeImplFromJson(json);

  @override
  final int icon;
  @override
  final String id;
  @override
  final String name;
  @override
  final int price;

  @override
  String toString() {
    return 'Coffee(icon: $icon, id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoffeeImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, icon, id, name, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoffeeImplCopyWith<_$CoffeeImpl> get copyWith =>
      __$$CoffeeImplCopyWithImpl<_$CoffeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoffeeImplToJson(
      this,
    );
  }
}

abstract class _Coffee extends Coffee {
  const factory _Coffee(
      {required final int icon,
      required final String id,
      required final String name,
      required final int price}) = _$CoffeeImpl;
  const _Coffee._() : super._();

  factory _Coffee.fromJson(Map<String, dynamic> json) = _$CoffeeImpl.fromJson;

  @override
  int get icon;
  @override
  String get id;
  @override
  String get name;
  @override
  int get price;
  @override
  @JsonKey(ignore: true)
  _$$CoffeeImplCopyWith<_$CoffeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

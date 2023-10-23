// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  Coffee get coffee => throw _privateConstructorUsedError;
  CoffeeCupSizeEnum get size => throw _privateConstructorUsedError;
  SugarCubeEnum get sugar => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  List<CoffeeAdditionEnum> get additions => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {Coffee coffee,
      CoffeeCupSizeEnum size,
      SugarCubeEnum sugar,
      int quantity,
      List<CoffeeAdditionEnum> additions,
      String? id});

  $CoffeeCopyWith<$Res> get coffee;
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coffee = null,
    Object? size = null,
    Object? sugar = null,
    Object? quantity = null,
    Object? additions = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      coffee: null == coffee
          ? _value.coffee
          : coffee // ignore: cast_nullable_to_non_nullable
              as Coffee,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as CoffeeCupSizeEnum,
      sugar: null == sugar
          ? _value.sugar
          : sugar // ignore: cast_nullable_to_non_nullable
              as SugarCubeEnum,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      additions: null == additions
          ? _value.additions
          : additions // ignore: cast_nullable_to_non_nullable
              as List<CoffeeAdditionEnum>,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CoffeeCopyWith<$Res> get coffee {
    return $CoffeeCopyWith<$Res>(_value.coffee, (value) {
      return _then(_value.copyWith(coffee: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Coffee coffee,
      CoffeeCupSizeEnum size,
      SugarCubeEnum sugar,
      int quantity,
      List<CoffeeAdditionEnum> additions,
      String? id});

  @override
  $CoffeeCopyWith<$Res> get coffee;
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coffee = null,
    Object? size = null,
    Object? sugar = null,
    Object? quantity = null,
    Object? additions = null,
    Object? id = freezed,
  }) {
    return _then(_$CartItemImpl(
      coffee: null == coffee
          ? _value.coffee
          : coffee // ignore: cast_nullable_to_non_nullable
              as Coffee,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as CoffeeCupSizeEnum,
      sugar: null == sugar
          ? _value.sugar
          : sugar // ignore: cast_nullable_to_non_nullable
              as SugarCubeEnum,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      additions: null == additions
          ? _value._additions
          : additions // ignore: cast_nullable_to_non_nullable
              as List<CoffeeAdditionEnum>,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl extends _CartItem {
  const _$CartItemImpl(
      {required this.coffee,
      required this.size,
      required this.sugar,
      required this.quantity,
      required final List<CoffeeAdditionEnum> additions,
      this.id})
      : _additions = additions,
        super._();

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  final Coffee coffee;
  @override
  final CoffeeCupSizeEnum size;
  @override
  final SugarCubeEnum sugar;
  @override
  final int quantity;
  final List<CoffeeAdditionEnum> _additions;
  @override
  List<CoffeeAdditionEnum> get additions {
    if (_additions is EqualUnmodifiableListView) return _additions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_additions);
  }

  @override
  final String? id;

  @override
  String toString() {
    return 'CartItem(coffee: $coffee, size: $size, sugar: $sugar, quantity: $quantity, additions: $additions, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.coffee, coffee) || other.coffee == coffee) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.sugar, sugar) || other.sugar == sugar) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality()
                .equals(other._additions, _additions) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, coffee, size, sugar, quantity,
      const DeepCollectionEquality().hash(_additions), id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem extends CartItem {
  const factory _CartItem(
      {required final Coffee coffee,
      required final CoffeeCupSizeEnum size,
      required final SugarCubeEnum sugar,
      required final int quantity,
      required final List<CoffeeAdditionEnum> additions,
      final String? id}) = _$CartItemImpl;
  const _CartItem._() : super._();

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  Coffee get coffee;
  @override
  CoffeeCupSizeEnum get size;
  @override
  SugarCubeEnum get sugar;
  @override
  int get quantity;
  @override
  List<CoffeeAdditionEnum> get additions;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

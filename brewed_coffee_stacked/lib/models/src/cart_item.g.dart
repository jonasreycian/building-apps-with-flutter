// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      coffee: Coffee.fromJson(json['coffee'] as Map<String, dynamic>),
      size: $enumDecode(_$CoffeeCupSizeEnumEnumMap, json['size']),
      sugar: $enumDecode(_$SugarCubeEnumEnumMap, json['sugar']),
      quantity: json['quantity'] as int,
      additions: (json['additions'] as List<dynamic>)
          .map((e) => $enumDecode(_$CoffeeAdditionEnumEnumMap, e))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'coffee': instance.coffee,
      'size': _$CoffeeCupSizeEnumEnumMap[instance.size]!,
      'sugar': _$SugarCubeEnumEnumMap[instance.sugar]!,
      'quantity': instance.quantity,
      'additions': instance.additions
          .map((e) => _$CoffeeAdditionEnumEnumMap[e]!)
          .toList(),
      'id': instance.id,
    };

const _$CoffeeCupSizeEnumEnumMap = {
  CoffeeCupSizeEnum.small: 'small',
  CoffeeCupSizeEnum.medium: 'medium',
  CoffeeCupSizeEnum.large: 'large',
};

const _$SugarCubeEnumEnumMap = {
  SugarCubeEnum.no: 'no',
  SugarCubeEnum.one: 'one',
  SugarCubeEnum.two: 'two',
};

const _$CoffeeAdditionEnumEnumMap = {
  CoffeeAdditionEnum.cake: 'cake',
  CoffeeAdditionEnum.icecream: 'icecream',
  CoffeeAdditionEnum.cheese: 'cheese',
};

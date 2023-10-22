// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      id: json['id'] as String?,
      coffee: Coffee.fromJson(json['coffee'] as Map<String, dynamic>),
      size: $enumDecode(_$CoffeeCupSizeEnumMap, json['size']),
      sugar: $enumDecode(_$CoffeeSugarCubeEnumMap, json['sugar']),
      quantity: json['quantity'] as int,
      additions: (json['additions'] as List<dynamic>)
          .map((e) => $enumDecode(_$CoffeeAdditionEnumEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coffee': instance.coffee,
      'size': _$CoffeeCupSizeEnumMap[instance.size]!,
      'sugar': _$CoffeeSugarCubeEnumMap[instance.sugar]!,
      'quantity': instance.quantity,
      'additions': instance.additions
          .map((e) => _$CoffeeAdditionEnumEnumMap[e]!)
          .toList(),
    };

const _$CoffeeCupSizeEnumMap = {
  CoffeeCupSize.small: 'small',
  CoffeeCupSize.medium: 'medium',
  CoffeeCupSize.large: 'large',
};

const _$CoffeeSugarCubeEnumMap = {
  CoffeeSugarCube.no: 'no',
  CoffeeSugarCube.one: 'one',
  CoffeeSugarCube.two: 'two',
};

const _$CoffeeAdditionEnumEnumMap = {
  CoffeeAdditionEnum.cake: 'cake',
  CoffeeAdditionEnum.icecream: 'icecream',
  CoffeeAdditionEnum.cheese: 'cheese',
};

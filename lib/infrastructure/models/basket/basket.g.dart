// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Basket _$BasketFromJson(Map<String, dynamic> json) => Basket(
      basketId: json['basketId'] as String,
      basketName: json['basketName'] as String,
      menu: json['menu'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$BasketToJson(Basket instance) => <String, dynamic>{
      'basketId': instance.basketId,
      'basketName': instance.basketName,
      'menu': instance.menu,
      'description': instance.description,
      'price': instance.price,
    };

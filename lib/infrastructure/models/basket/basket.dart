import 'package:json_annotation/json_annotation.dart';

part 'basket.g.dart';

@JsonSerializable()
class Basket {
  final String basketId;
  final String basketName;
  final String menu;
  final String description;
  final double price;

  Basket({
    required this.basketId,
    required this.basketName,
    required this.menu,
    required this.description,
    required this.price,
  });

  factory Basket.fromJson(Map<String, dynamic> json) => _$BasketFromJson(json);
  Map<String, dynamic> toJson() => _$BasketToJson(this);
}

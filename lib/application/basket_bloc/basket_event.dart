part of 'basket_bloc.dart';

@immutable
class BasketEvent {}

class GetAllProducts extends BasketEvent {}

class GetProduct extends BasketEvent {
  final String productId;
  GetProduct({required this.productId});
}

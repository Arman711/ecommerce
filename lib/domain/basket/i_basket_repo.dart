import 'package:ecommerce/infrastructure/models/basket/basket.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class IBasketRepository {
  Future<Either<String, List<Basket>>> getAllProducts();
  Future<Either<String, Basket>> getProducts({required String productId});
}

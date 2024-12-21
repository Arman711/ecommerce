import 'package:ecommerce/infrastructure/models/basket/basket.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class IUserRepo {
  Future<Either<String, Unit>> createUser({
    required String name,
    required String email,
  });
  Future<Either<String, Unit>> addFavorite({
    required Basket product,
  });
  Future<Either<String, List<Basket>>> getFavorite();
}

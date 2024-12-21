import 'package:ecommerce/infrastructure/models/basket/basket.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ISearchRepo {
  Future<Either<String, List<Basket>>> searchProduct(String searchText);
}

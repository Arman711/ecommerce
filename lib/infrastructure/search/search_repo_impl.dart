import 'package:ecommerce/domain/search/i_search_repo.dart';
import 'package:ecommerce/infrastructure/basket/basket_repo_impl.dart';
import 'package:ecommerce/infrastructure/models/basket/basket.dart';
import 'package:fpdart/src/either.dart';

class SearchRepoImpl implements ISearchRepo {
  @override
  Future<Either<String, List<Basket>>> searchProduct(String searchText) async {
    BasketRepoImpl allBaskets = BasketRepoImpl();
    try {
      List<Basket> allProducts = [];
      final response = await allBaskets.getAllProducts();
      response.fold(
        (errorMsg) {
          print(errorMsg);
        },
        (allProduct) {
          allProducts = allProduct;
        },
      );
      List<Basket> result = allProducts
          .where((item) =>
              item.basketName.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      return Right(result);
    } catch (e) {
      return Left('Error: $e');
    }
  }
}

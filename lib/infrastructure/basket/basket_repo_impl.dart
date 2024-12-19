import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/infrastructure/domain/i_basket_repo.dart';
import 'package:ecommerce/infrastructure/models/basket/basket.dart';
import 'package:fpdart/src/either.dart';

class BasketRepoImpl implements IBasketRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('baskets');

  @override
  Future<Either<String, List<Basket>>> getAllProducts() async {
    try {
      List<Basket> products = [];
      QuerySnapshot snapshot = await collection.get();
      products = snapshot.docs.map(
        (doc) {
          return Basket.fromJson(doc.data() as Map<String, dynamic>);
        },
      ).toList();
      log('0000000000000');

      return Right(products);
    } catch (e) {
      log('11111111111111111111111');
      return const Left('Get products feilure');
    }
  }

  @override
  Future<Either<String, Basket>> getProducts(String productId) async {
    try {
      DocumentSnapshot basket = await collection.doc(productId).get();
      if (basket.exists) {
        return Right(
          Basket.fromJson(basket.data() as Map<String, dynamic>),
        );
      } else {
        return const Left('Product not found');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/domain/user/i_user_repo.dart';
import 'package:ecommerce/infrastructure/models/basket/basket.dart';
import 'package:ecommerce/infrastructure/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';

class UserRepoImpl implements IUserRepo {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  Future<Either<String, Unit>> createUser({
    required String name,
    required String email,
  }) async {
    final userCollection = firestore.collection('users');
    final String uId = auth.currentUser!.uid;
    final UserDto userDto =
        UserDto(userId: uId, email: email, name: name, favoriteBaskets: []);
    try {
      await userCollection.doc(uId).set(userDto.toJson());
      return const Right(unit);
    } catch (e) {
      return const Left('Failed to add user');
    }
  }

  @override
  Future<Either<String, Unit>> addFavorite({required Basket product}) async {
    final userCollection = firestore.collection('users');
    final String userId = auth.currentUser!.uid;
    try {
      await userCollection.doc(userId).update({
        'favoriteBaskets': FieldValue.arrayUnion([product.basketId])
      });
      return const Right(unit);
    } catch (e) {
      return Left('error: $e');
    }
  }

  @override
  Future<Either<String, List<Basket>>> getFavorite() async {
    final userCollection = firestore.collection('users');
    final String userId = auth.currentUser!.uid;
    final basketCollection = firestore.collection('baskets');

    try {
      final user = await userCollection.doc(userId).get();

      if (!user.exists) {
        return const Left('User not found');
      }
      final favoritesSnapshot = await userCollection.doc(userId).get();

      List favoriteProductIds =
          favoritesSnapshot.data()?['favoriteBaskets'] ?? [];
      if (favoriteProductIds.isEmpty) {
        return const Right([]);
      }

      final productsQuery = await basketCollection
          .where(FieldPath.documentId, whereIn: favoriteProductIds)
          .get();

      final favoriteProducts = productsQuery.docs
          .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();

      List<Basket> favorites = favoriteProducts.map((element) {
        return Basket.fromJson(element);
      }).toList();

      log('Successfully fetched favorite baskets.');
      return Right(favorites);
    } catch (e) {
      log('Error fetching favorite baskets: $e');
      return Left('Error: ${e.toString()}');
    }
  }
}

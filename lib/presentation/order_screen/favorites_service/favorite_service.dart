import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/infrastructure/models/basket/basket.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String uId = FirebaseAuth.instance.currentUser!.uid;

  Stream<List<Basket>> getFavoriteProducts() async* {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(uId).get();
      if (userDoc.exists) {
        List<dynamic> favorites = userDoc['favoriteBaskets'] ?? [];

        List<Future<DocumentSnapshot>> productFutures = favorites
            .map((productId) =>
                _firestore.collection('baskets').doc(productId).get())
            .toList();

        List<DocumentSnapshot> productDoc = await Future.wait(productFutures);
        List<Basket> productDetails = productDoc
            .where((doc) => doc.exists)
            .map(
              (doc) => Basket.fromJson(doc.data() as Map<String, dynamic>),
            )
            .toList();

        yield productDetails;
      } else {
        yield [];
      }
    } catch (e) {
      log('Error fetching favorite products: $e');
      yield [];
    }
  }
}

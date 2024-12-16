import 'package:ecommerce/application/basket_bloc/basket_bloc.dart';
import 'package:ecommerce/infrastructure/models/basket/basket.dart';
import 'package:ecommerce/lc.dart';
import 'package:ecommerce/presentation/core/widgets/product_card.dart';
import 'package:ecommerce/presentation/core/widgets/product_card1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecomentedProductsSection extends StatelessWidget {
  const RecomentedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final CollectionReference firestore =
    //     FirebaseFirestore.instance.collection('baskets');
    // context.read<BasketBloc>().add(GetAllProducts());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recommended Combo',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        BlocBuilder<BasketBloc, BasketState>(
          builder: (context, basketState) {
            if (basketState is BasketLoadingState) {
              return const CircularProgressIndicator();
            } else if (basketState is BasketSuccessState) {
              List<Basket> products = basketState.products;
              return SizedBox(
                width: double.infinity,
                height: 182,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: basketState.products.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 22,
                    );
                  },
                  itemBuilder: (context, index) {
                    Basket product = products[index];

                    return ProductCard1(
                      productName: product.basketName,
                      price: product.price,
                      product: product,
                    );
                  },
                ),
              );
            } else {
              return const Text('data');
            }
          },
        ),
        // StreamBuilder(
        //     stream: firestore.snapshots(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasError) {
        //         return Center(child: Text('Error: ${snapshot.error}'));
        //       }
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(child: CircularProgressIndicator());
        //       }
        //       final List<DocumentSnapshot> docs = snapshot.data!.docs;

        //       return SizedBox(
        //         width: double.infinity,
        //         height: 182,
        //         child: ListView.builder(
        //           scrollDirection: Axis.horizontal,
        //           itemCount: docs.length,
        //           itemBuilder: (context, index) {
        //             final Map<String, dynamic> data =
        //                 docs[index].data()! as Map<String, dynamic>;
        //             Basket basket = Basket.fromJson(data);
        //             return ProductCard(
        //               productName: basket.basketName,
        //               price: basket.price,
        //             );
        //           },
        //         ),
        //       );
        //     }),
      ],
    );
  }
}

import 'package:ecommerce/application/bloc/basket_bloc/basket_bloc.dart';
import 'package:ecommerce/infrastructure/models/basket/basket.dart';
import 'package:ecommerce/presentation/core/ui/colors.dart';

import 'package:ecommerce/presentation/core/widgets/product_card.dart';
import 'package:ecommerce/presentation/core/widgets/product_card1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabbarSection extends StatelessWidget {
  final List<Basket> products;
  const TabbarSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          TabBar(
            labelColor: Colors.black,
            indicatorColor: AppColors.primaryColor,
            tabAlignment: TabAlignment.center,
            unselectedLabelColor: Colors.grey,
            tabs: const <Widget>[
              Tab(
                text: 'Hottest',
              ),
              Tab(
                text: 'Popular',
              ),
              Tab(
                text: 'New combo',
              ),
              Tab(
                text: 'Top',
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: TabBarView(
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 16,
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
                  // child: BlocBuilder<BasketBloc, BasketState>(
                  //   builder: (context, basketState) {
                  //     if (basketState is BasketLoadingState) {
                  //       return const CircularProgressIndicator();
                  //     } else if (basketState is BasketSuccessState) {
                  //       List<Basket> products = basketState.products;
                  //       return SizedBox(
                  //         width: double.infinity,
                  //         height: 182,
                  //         child: ListView.separated(
                  //           scrollDirection: Axis.horizontal,
                  //           itemCount: basketState.products.length,
                  //           separatorBuilder: (context, index) {
                  //             return const SizedBox(
                  //               width: 16,
                  //             );
                  //           },
                  //           itemBuilder: (context, index) {
                  //             Basket product = products[index];
                  //             return ProductCard1(
                  //               productName: product.basketName,
                  //               price: product.price,
                  //               product: product,
                  //             );
                  //           },
                  //         ),
                  //       );
                  //     } else {
                  //       return const Text('data');
                  //     }
                  //   },
                  // ),
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.purple,
                ),
                Container(
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:ecommerce/application/bloc/user_bloc/user_bloc.dart';
import 'package:ecommerce/infrastructure/models/basket/basket.dart';
import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:ecommerce/presentation/order_screen/favorites_service/favorite_service.dart';
import 'package:ecommerce/presentation/order_screen/widgets/checkout.dart';
import 'package:ecommerce/presentation/order_screen/widgets/order_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteService _favoriteService = FavoriteService();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 32,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.chevron_left_outlined,
                  ),
                  Text(
                    'Go back',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const Text(
              'My Basket',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 46),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            // alignment: AlignmentDirectional.bottomCenter,
            children: [
              // BlocBuilder<UserBloc, UserState>(
              //   builder: (context, state) {
              //     if (state is UserFavoriteProductsSuccessState) {
              //       return ListView.separated(
              //           itemBuilder: (context, index) {
              //             return OrderProductCard(
              //               productName:
              //                   state.favoriteProducts[index].basketName,
              //               price: state.favoriteProducts[index].price,
              //             );
              //           },
              //           separatorBuilder: (context, index) {
              //             return const SizedBox(
              //               height: 42,
              //             );
              //           },
              //           itemCount: state.favoriteProducts.length);
              //     } else {
              //       return const SizedBox();
              //     }
              //   },
              // ),
              StreamBuilder<List<Basket>>(
                stream: _favoriteService.getFavoriteProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No favorite products');
                  }
                  final favoriteProducts = snapshot.data!;
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return OrderProductCard(
                        productName: favoriteProducts[index].basketName,
                        price: favoriteProducts[index].price,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 42,
                      );
                    },
                    itemCount: favoriteProducts.length,
                  );
                },
              ),
              const Checkout(),
            ],
          ),
        ),
      ),
    );
  }
}

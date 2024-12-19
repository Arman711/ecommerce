import 'package:ecommerce/application/basket_bloc/basket_bloc.dart';
import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:ecommerce/presentation/product_screen/widgets/price_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBottomSection extends StatelessWidget {
  const ProductBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final CollectionReference firestore =
    //     FirebaseFirestore.instance.collection('baskets');
    // .doc('fvGDDMjlRgxqNHEkb85n').get()

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        child: BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            if (state is BasketFeilureState) {
              return Center(
                child: Text(state.errorMsg),
              );
            }
            if (state is GetBasketSuccessState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.product.basketName,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Expanded(
                    child: PriceTile(
                      price: state.product.price,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'One Pack Contains:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: Divider(
                      color: AppColors.primaryColor,
                      // height: 15,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      state.product.menu,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Text(state.product.description),
                  ),
                  const Spacer(),
                ],
              );
            }
            return const Center(
              child: Text('--------------------------------'),
            );
          },
        ),
      ),
    );
  }
}

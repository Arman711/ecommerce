import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/application/basket_bloc/basket_bloc.dart';
import 'package:ecommerce/application/bloc/user_bloc.dart';
import 'package:ecommerce/infrastructure/models/basket/basket.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/presentation/core/router/router.dart';
import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard1 extends StatefulWidget {
  final String productName;
  final double price;
  final Basket product;
  const ProductCard1({
    super.key,
    required this.productName,
    required this.price,
    required this.product,
  });

  @override
  State<ProductCard1> createState() => _ProductCard1State();
}

class _ProductCard1State extends State<ProductCard1> {
  bool isFavorite = false;
  void onAddBasket() {
    setState(() {
      if (isFavorite) {
        isFavorite = false;
      } else {
        isFavorite = true;
      }
    });
    log('$isFavorite');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        InkWell(
          onTap: () {
            context.read<BasketBloc>().add(
                  GetProduct(productId: widget.product.basketId),
                );
            context.router.push(const ProductRoute());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 152,
                height: 22,
              ),
              Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
              ),
              Text(
                widget.productName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: SizedBox(
                  width: 142,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'N',
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                          Text(
                            '${widget.price}',
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColors.shadowColor1,
                        child: Icon(
                          Icons.add,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<UserBloc>().add(
                  AddFavorite(widget.product),
                );
          },
          icon: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                return Icon(
                  Icons.favorite,
                  color: AppColors.primaryColor,
                );
              } else {
                return Icon(
                  Icons.favorite_border,
                  color: AppColors.primaryColor,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

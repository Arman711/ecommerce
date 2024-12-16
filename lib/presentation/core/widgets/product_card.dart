import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/presentation/core/router/router.dart';
import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String productName;
  final double price;
  bool isFavorite;
  ProductCard({
    super.key,
    required this.productName,
    required this.price,
    this.isFavorite = false,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isOnTap = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 182,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: widget.isFavorite
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border,
                    ),
              color: AppColors.primaryColor,
              onPressed: () {
                setState(() {
                  isOnTap = !isOnTap;
                });
              },
            ),
          ),
          InkWell(
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 80,
                    width: 80,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.productName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.attach_money_outlined,
                      color: AppColors.primaryColor,
                    ),
                    Text(
                      '${widget.price}',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    const Spacer(),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

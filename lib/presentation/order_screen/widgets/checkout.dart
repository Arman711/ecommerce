import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:ecommerce/presentation/order_screen/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'N 60000',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            CustomBottomSheet.show(context);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.primaryColor,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 52, vertical: 14),
              child: Text(
                'Checkout',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

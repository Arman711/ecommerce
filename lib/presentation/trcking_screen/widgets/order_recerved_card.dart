import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:flutter/material.dart';

class OrderRecervedCard extends StatelessWidget {
  const OrderRecervedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.successBorderColor,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        const Text('Order Received'),
        const Spacer(
          flex: 6,
        ),
        Icon(
          Icons.more_horiz,
          size: 40,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}

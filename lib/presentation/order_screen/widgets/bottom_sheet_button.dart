import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:flutter/material.dart';

class BottomSheetButton extends StatelessWidget {
  final String text;
  final double width;
  const BottomSheetButton({
    super.key,
    required this.text,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: AppColors.primaryColor,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}

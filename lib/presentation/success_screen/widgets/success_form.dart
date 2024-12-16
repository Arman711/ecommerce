import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:flutter/material.dart';

class SuccessForm extends StatelessWidget {
  const SuccessForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      height: 164,
      width: 164,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: AppColors.successBorderColor,
          ),
          color: const Color.fromRGBO(0, 255, 0, .2)),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.successBorderColor,
        ),
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 42,
        ),
      ),
    );
  }
}

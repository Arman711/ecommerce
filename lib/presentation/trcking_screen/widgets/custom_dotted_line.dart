import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:flutter/material.dart';

class CustomDottedLine extends StatelessWidget {
  final int length;
  const CustomDottedLine({
    super.key,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: length,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: DottedLine(
          direction: Axis.vertical,
          dashColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}

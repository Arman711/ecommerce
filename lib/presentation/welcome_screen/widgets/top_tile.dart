import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:flutter/material.dart';

class TopTile extends StatelessWidget {
  final String imgUrl;
  const TopTile({
    super.key,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primaryColor,
      child: Image.network(
        imgUrl,
        fit: BoxFit.contain,
      ),
      // child: const Text('data'),
    );
  }
}

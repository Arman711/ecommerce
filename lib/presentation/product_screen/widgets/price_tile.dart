import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:flutter/material.dart';

class PriceTile extends StatefulWidget {
  const PriceTile({super.key});

  @override
  State<PriceTile> createState() => _PriceTileState();
}

class _PriceTileState extends State<PriceTile> {
  int count = 1;
  void addCount() {
    setState(() {
      count++;
    });
  }

  void minCount() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: minCount,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1),
              ),
              child: const Text(
                '-',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 22,
          ),
          Text(
            '$count',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            width: 22,
          ),
          InkWell(
            onTap: addCount,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.shadowColor1,
              child: Icon(
                Icons.add,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const Spacer(),
          const Icon(Icons.attach_money_outlined),
          const Text(
            '2000',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

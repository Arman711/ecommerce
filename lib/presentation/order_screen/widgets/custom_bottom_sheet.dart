import 'package:ecommerce/presentation/order_screen/widgets/bottom_sheet_button.dart';
import 'package:ecommerce/presentation/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});
  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext ctx) {
        return const CustomBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 48,
          width: 48,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: const Icon(Icons.close),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(22),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Delivery address',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  hintText: '-----',
                  controller: textEditingController,
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Delivery address',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  hintText: '-----',
                  controller: textEditingController,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomSheetButton(
                      text: 'Pay on delivery',
                      width: 124,
                    ),
                    BottomSheetButton(
                      text: 'Pay with card',
                      width: 124,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

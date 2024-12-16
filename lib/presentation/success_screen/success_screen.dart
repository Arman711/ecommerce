import 'package:auto_route/annotations.dart';
import 'package:ecommerce/presentation/order_screen/widgets/bottom_sheet_button.dart';
import 'package:ecommerce/presentation/success_screen/widgets/success_form.dart';
import 'package:ecommerce/presentation/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            const SuccessForm(),
            const SizedBox(
              height: 56,
            ),
            const Text(
              'Congratulations!!!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Your order have been taken and is being attended to',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 56,
            ),
            PrimaryButton(
              buttonText: 'Track order',
              onTap: () {},
            ),
            const SizedBox(
              height: 48,
            ),
            const BottomSheetButton(
              text: 'Continue shopping',
              width: 182,
            ),
          ],
        ),
      ),
    );
  }
}

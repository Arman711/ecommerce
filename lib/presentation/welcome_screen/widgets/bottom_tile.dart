import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/presentation/core/router/router.dart';
import 'package:ecommerce/presentation/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomTile extends StatelessWidget {
  const BottomTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Get The Freshest Fruit Salad Combo',
              style: GoogleFonts.darkerGrotesque(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Expanded(
              child: Text(
                'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            const Spacer(),
            Center(
              child: PrimaryButton(
                buttonText: 'Lets Contionue',
                onTap: () {
                  context.router.push(const AuthRoute());
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

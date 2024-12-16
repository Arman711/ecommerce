import 'package:ecommerce/presentation/core/ui/colors.dart';
import 'package:ecommerce/presentation/product_screen/widgets/price_tile.dart';
import 'package:flutter/material.dart';

class ProductBottomSection extends StatelessWidget {
  const ProductBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final CollectionReference firestore =
    //     FirebaseFirestore.instance.collection('baskets');
    // .doc('fvGDDMjlRgxqNHEkb85n').get()

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quinoa Fruit Salad',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            const Expanded(
              child: PriceTile(),
            ),
            const Spacer(),
            const Text(
              'One Pack Contains:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 180,
              child: Divider(
                color: AppColors.primaryColor,
                // height: 15,
              ),
            ),
            const Expanded(
              child: Text(
                'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const Spacer(),
            const Expanded(
              child: Text(
                  'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

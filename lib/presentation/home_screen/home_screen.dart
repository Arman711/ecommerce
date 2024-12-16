import 'package:auto_route/annotations.dart';
import 'package:ecommerce/presentation/home_screen/widgets/content_tile.dart';
import 'package:ecommerce/presentation/home_screen/widgets/recomented_products_section.dart';
import 'package:ecommerce/presentation/home_screen/widgets/search_widget.dart';
import 'package:ecommerce/presentation/home_screen/widgets/tabbar_section.dart';
import 'package:ecommerce/presentation/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final CollectionReference firestore =
    //     FirebaseFirestore.instance.collection('baskets');
    return const Scaffold(
      appBar: CustomAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContentTile(),
              SizedBox(
                height: 24,
              ),
              SearchWidget(),
              SizedBox(
                height: 40,
              ),
              RecomentedProductsSection(),
              SizedBox(
                height: 48,
              ),
              TabbarSection(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:ecommerce/application/bloc/search_bloc/search_bloc.dart';
import 'package:ecommerce/presentation/home_screen/widgets/content_tile.dart';
import 'package:ecommerce/presentation/home_screen/widgets/recomented_products_section.dart';
import 'package:ecommerce/presentation/home_screen/widgets/search_widget.dart';
import 'package:ecommerce/presentation/home_screen/widgets/tabbar_section.dart';
import 'package:ecommerce/presentation/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final CollectionReference firestore =
    //     FirebaseFirestore.instance.collection('baskets');
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ContentTile(),
              const SizedBox(
                height: 24,
              ),
              // SearchWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          context.read<SearchBloc>().add(
                                SearchProduct(searchText: value),
                              );
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search for fruit salad combos',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(
                    Icons.settings,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const RecomentedProductsSection(),
              const SizedBox(
                height: 48,
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchFailureState) {
                    return Center(
                      child: Text(state.errorMsg),
                    );
                  }
                  if (state is SearchLoadingState) {
                    return const CircularProgressIndicator();
                  }
                  if (state is SearchSuccessState) {
                    return TabbarSection(
                      products: state.products,
                    );
                  } else {
                    return const TabbarSection(products: []);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

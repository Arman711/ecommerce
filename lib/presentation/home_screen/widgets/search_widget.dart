import 'package:ecommerce/application/bloc/search_bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(16),
            ),
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return TextField(
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
                );
              },
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
    );
  }
}

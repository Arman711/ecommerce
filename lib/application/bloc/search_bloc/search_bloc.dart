import 'package:bloc/bloc.dart';
import 'package:ecommerce/domain/search/i_search_repo.dart';
import 'package:ecommerce/domain/search/i_search_repo.dart';
import 'package:ecommerce/infrastructure/models/basket/basket.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ISearchRepo _iSearchRepo;
  SearchBloc(this._iSearchRepo) : super(SearchInitial()) {
    on<SearchProduct>(searchProduct);
  }

  Future<void> searchProduct(
      SearchProduct event, Emitter<SearchState> emit) async {
    emit(SearchInitial());
    final response = await _iSearchRepo.searchProduct(event.searchText);
    response.fold(
      (errorMsg) {
        emit(
          SearchFailureState(
            errorMsg: errorMsg,
          ),
        );
      },
      (products) {
        emit(
          SearchSuccessState(products: products),
        );
      },
    );
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/infrastructure/domain/i_basket_repo.dart';
import 'package:ecommerce/infrastructure/models/basket/basket.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  IBasketRepository basketRepository;

  BasketBloc(this.basketRepository) : super(BasketInitialState()) {
    on<GetAllProducts>(getAllProducts);
  }

  Future<void> getAllProducts(
    GetAllProducts event,
    Emitter<BasketState> emit,
  ) async {
    emit(BasketInitialState());
    final response = await basketRepository.getAllProducts();
    response.fold(
      (errorMsg) {
        log(errorMsg);
        emit(
          BasketFeilureState(errorMsg: errorMsg),
        );
      },
      (products) {
        log('---------------');
        emit(
          BasketSuccessState(products: products),
        );
      },
    );
  }
}

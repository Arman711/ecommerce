import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/domain/user/i_user_repo.dart';
import 'package:ecommerce/infrastructure/models/basket/basket.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserRepo _userRepo;
  UserBloc(this._userRepo) : super(UserInitial()) {
    on<CreateUser>(onCreateUser);
    on<AddFavorite>(onAddFavorites);
    on<GetFavoriteProducts>(onGetFavoriteProducts);
  }

  Future<void> onCreateUser(CreateUser event, Emitter<UserState> emit) async {
    emit(UserInitial());
    final response =
        await _userRepo.createUser(name: event.name, email: event.email);

    response.fold(
      (String errorMsg) {
        emit(
          UserFailed(errorMsg: errorMsg),
        );
      },
      (_) {
        emit(
          UserSuccess(),
        );
      },
    );
  }

  Future<void> onAddFavorites(
      AddFavorite event, Emitter<UserState> state) async {
    final response = await _userRepo.addFavorite(product: event.product);

    response.fold(
      (String errorMsg) {
        return UserFailed(
          errorMsg: errorMsg,
        );
      },
      (_) {
        return UserSuccess();
      },
    );
  }

  Future<void> onGetFavoriteProducts(
      GetFavoriteProducts event, Emitter<UserState> emit) async {
    final response = await _userRepo.getFavorite();

    response.fold((errorMsg) {
      log(errorMsg);
      emit(
        UserFailed(errorMsg: errorMsg),
      );
    }, (favoriteProducts) {
      emit(
          UserFavoriteProductsSuccessState(favoriteProducts: favoriteProducts));
    });
  }
}

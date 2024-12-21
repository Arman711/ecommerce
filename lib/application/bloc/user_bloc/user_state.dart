part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {}

final class UserFavoriteProductsSuccessState extends UserState {
  final List<Basket> favoriteProducts;
  const UserFavoriteProductsSuccessState({required this.favoriteProducts});
}

final class UserFailed extends UserState {
  final String errorMsg;
  const UserFailed({required this.errorMsg});
}

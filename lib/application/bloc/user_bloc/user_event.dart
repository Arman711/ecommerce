part of 'user_bloc.dart';

@immutable
class UserEvent {}

final class CreateUser extends UserEvent {
  final String name;
  final String email;
  CreateUser(this.name, this.email);
}

final class AddFavorite extends UserEvent {
  final Basket product;
  AddFavorite(this.product);
}

final class GetFavoriteProducts extends UserEvent {}

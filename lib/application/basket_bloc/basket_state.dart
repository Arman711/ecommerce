part of 'basket_bloc.dart';

class BasketState extends Equatable {
  const BasketState();

  @override
  List<Object> get props => [];
}

final class BasketInitialState extends BasketState {}

final class BasketLoadingState extends BasketState {}

final class BasketSuccessState extends BasketState {
  final List<Basket> products;
  const BasketSuccessState({required this.products});
}

final class BasketFeilureState extends BasketState {
  final String errorMsg;

  const BasketFeilureState({required this.errorMsg});
}

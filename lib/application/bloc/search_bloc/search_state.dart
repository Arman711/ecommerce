part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchFailureState extends SearchState {
  final String errorMsg;

  const SearchFailureState({
    required this.errorMsg,
  });
}

final class SearchSuccessState extends SearchState {
  final List<Basket> products;

  const SearchSuccessState({
    required this.products,
  });
}

part of 'search_bloc.dart';

@immutable
class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchProduct extends SearchEvent {
  final String searchText;

  const SearchProduct({
    required this.searchText,
  });
}

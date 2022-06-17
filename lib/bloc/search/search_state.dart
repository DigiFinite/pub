part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitialState extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoadingState extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchSuccessfulState extends SearchState {
  final List<Product> searchResult;
  const SearchSuccessfulState({
    required this.searchResult,
  });
  @override
  List<Object> get props => [searchResult];
}

class SearchFailedState extends SearchState {
  final dynamic data;
  const SearchFailedState({
    required this.data
  });
  @override
  List<Object> get props => [data];
}

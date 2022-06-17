part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchForProductEvent extends SearchEvent {
  final String searchTerm;
  const SearchForProductEvent({
    required this.searchTerm,
  });
  @override
  List<Object> get props => [searchTerm];
}

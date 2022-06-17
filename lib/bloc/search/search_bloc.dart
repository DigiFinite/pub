import 'package:bloc/bloc.dart';
import 'package:dro_health_home_task/models/product.dart';
import 'package:dro_health_home_task/repository/dro_repository.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitialState()) {
    on<SearchEvent>((event, emit) async {
      if (event is SearchForProductEvent) {
        emit(SearchLoadingState());
        final List<Product>? result = await DroRepository.searchForProduct(
          searchTerm: event.searchTerm,
        );

        if (result == null) {
          emit(
            const SearchFailedState(data: "Failed to load Search"),
          );
        } else {
          emit(
            SearchSuccessfulState(searchResult: result),
          );
        }
      }
    });
  }
}

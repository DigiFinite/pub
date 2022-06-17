import 'package:bloc/bloc.dart';
import 'package:dro_health_home_task/models/category.dart';
import 'package:dro_health_home_task/repository/dro_repository.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitialState()) {
    on<CategoriesEvent>((event, emit) async {
      if (event is FetchAllCategoriesEvent) {
        emit(CategoriesLoadingState());
        final List<Category>? result = await DroRepository.fetchAllCategories();

        if (result == null) {
          emit(
            const CategoriesFailedState(data: "Failed to load categories"),
          );
        } else {
          emit(
            CategoriesSuccessfulState(categories: result),
          );
        }
      }
    });
  }
}

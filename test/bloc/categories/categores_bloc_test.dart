
import 'package:bloc_test/bloc_test.dart';
import 'package:dro_health_home_task/bloc/categories_bloc/bloc/categories_bloc.dart';
import 'package:dro_health_home_task/repository/dro_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test for categories bloc", () {
    test("Test if the initial state is ProductInitialState", () {
      expect(CategoriesBloc().state, CategoriesInitialState());
    });

    test("Check if the total number of categories equals 4", () async {
      final categories = await DroRepository.fetchAllCategories();
      expect(categories?.length, 4);
    });

    blocTest(
        "Emit CategoriesLoadingState when the home page loads",
        build: () => CategoriesBloc(),
        act: (CategoriesBloc bloc) => bloc.add(FetchAllCategoriesEvent()),
        expect: () => [CategoriesLoadingState()]);
  });
}

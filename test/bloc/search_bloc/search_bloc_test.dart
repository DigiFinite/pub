import 'package:bloc_test/bloc_test.dart';
import 'package:dro_health_home_task/bloc/search/search_bloc.dart';
import 'package:dro_health_home_task/models/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test for the search bloc", () {
    test("Test if the initial state is ProductInitialState", () {
      expect(SearchBloc().state, SearchInitialState());
    });

    blocTest(
      "Search for a product that starts with 'pana'",
      build: () => SearchBloc(),
      act: (SearchBloc bloc) =>
          bloc.add(const SearchForProductEvent(searchTerm: "pana")),
      expect: () => [
        SearchLoadingState(),
        SearchSuccessfulState(searchResult: [
          Product(
            id: 5,
            name: "Panadol",
            type: "Tablet",
            mass: "500",
            price: 350,
            imageSource: "assets/images/panadol_extra.jpeg",
            manufacturer: "gsk",
            manufacturerLogo: "assets/images/gsk.png",
          ),
        ])
      ],
    );
  });
}

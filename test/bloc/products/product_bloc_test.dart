import 'package:bloc_test/bloc_test.dart';
import 'package:dro_health_home_task/bloc/products/products_bloc.dart';
import 'package:dro_health_home_task/repository/dro_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test for product bloc", () {
    test("Test if the initial state is ProductInitialState", () {
      expect(ProductsBloc().state, ProductsInitialState());
    });

    test("Check if the total number of products equals 7", () async {
      final products = await DroRepository.fetchAllProducts();
      expect(products.length, 7);
    });

    blocTest(
        "The product bloc should emit a ProductsLoadingState when the home page loads",
        build: () => ProductsBloc(),
        act: (ProductsBloc bloc) => bloc.add(FetchAllProductsEvent()),
        expect: () => [ProductsLoadingState()]);
  });
}

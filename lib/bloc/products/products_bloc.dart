import 'package:bloc/bloc.dart';
import 'package:dro_health_home_task/models/category.dart';
import 'package:dro_health_home_task/models/product.dart';
import 'package:dro_health_home_task/repository/dro_repository.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitialState()) {
    on<ProductsEvent>((event, emit) async {
      if (event is FetchAllProductsEvent) {
        emit(ProductsLoadingState());
        final List<Product>? result = await DroRepository.fetchAllProducts();

        if (result == null) {
          emit(
            const ProductsFailedState(data: "Failed to load Products"),
          );
        } else {
          emit(
            ProductsSuccessfulState(products: result),
          );
        }
      }
    });
  }
}
